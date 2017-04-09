package prox.security;

import prox.model.Account;
import prox.repository.AccountRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.Collection;

@Service
public class AccountUserDetailsService implements UserDetailsService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private AccountRepository accountRepository;


    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException, AccessDeniedException {
        logger.debug("> loadUserByUsername {}", username);

        Account account = accountRepository.findByUsernameAndEnabled(username);
        if (account == null) {
            // Not found...
            throw new UsernameNotFoundException(
                    "User " + username + " not found.");
        }
        Collection<? extends GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();

        UserDetails userDetails = new UserDetails(account.getUsername(),
                account.getPassword(), grantedAuthorities);

        String url = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getRequestURI();


        logger.debug("< loadUserByUsername {}", username);
        return userDetails;
    }

}
