package prox;

import prox.security.AccountAuthenticationProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Autowired
    private AccountAuthenticationProvider accountAuthenticationProvider;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) {

        auth.authenticationProvider(accountAuthenticationProvider);

    }

    @Configuration
    public static class ApiWebSecurityConfigurerAdapter
            extends WebSecurityConfigurerAdapter {

        @Override
        public void configure(WebSecurity web) throws Exception {
            web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.csrf().disable();
            http.authorizeRequests()
                    .antMatchers("/admin/**").authenticated()
                    .and()
                    .formLogin().loginPage("/login").failureUrl("/login?error")
                    .usernameParameter("username").passwordParameter("password")
                    .and()
                    .logout().logoutSuccessUrl("/login?logout");
        }

    }


}
