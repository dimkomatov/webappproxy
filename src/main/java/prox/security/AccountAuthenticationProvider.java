//package prox.security;
//
//import prox.model.Account;
//import prox.repository.AccountRepository;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import java.io.FileReader;
//import java.io.IOException;
//import java.util.Properties;
//
//@Component
//public class AccountAuthenticationProvider
//        extends AbstractUserDetailsAuthenticationProvider {
//
//    private Logger logger = LoggerFactory.getLogger(this.getClass());
//
//    @Autowired
//    private AccountUserDetailsService userDetailsService;
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//
//    @Autowired
//    private AccountRepository accountRepository;
//
//    @Override
//    protected void additionalAuthenticationChecks(UserDetails userDetails,
//                                                  UsernamePasswordAuthenticationToken token)
//            throws AuthenticationException {
//     //   logger.debug("> additionalAuthenticationChecks");
//
//        if (token.getCredentials() == null
//                || userDetails.getPassword() == null) {
//            throw new BadCredentialsException("Credentials may not be null.");
//        }
//
//        if (!passwordEncoder.matches((String) token.getCredentials(),
//                userDetails.getPassword())) {
//            throw new BadCredentialsException("Invalid credentials.");
//        }
//        Account account = accountRepository.findByUsernameAndEnabled(userDetails.getUsername());
//
//        String url = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getRequestURI();
//
//        FileReader reader;
//        Properties props = new Properties();
//        String passwordValidity = "";
//        try {
//            reader = new FileReader("src/main/resources/config/application.properties");
//            props.load(reader);
//            passwordValidity = props.getProperty("password.validity");
//            reader.close();
//        } catch (IOException e) {
//        }
//    }
//
//    @Override
//    protected UserDetails retrieveUser(String username,
//                                       UsernamePasswordAuthenticationToken token)
//            throws AuthenticationException {
//      //  logger.debug("> retrieveUser");
//
//        UserDetails userDetails = userDetailsService
//                .loadUserByUsername(username);
//
//      //  logger.debug("< retrieveUser");
//        return userDetails;
//    }
//
//}
