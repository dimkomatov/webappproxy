package prox.filter;

import prox.util.RequestContext;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;


@Component
public class RequestContextInitializationFilter extends GenericFilterBean {

  //  private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws IOException, ServletException {
     //   logger.debug("> doFilter");

        RequestContext.init();
        chain.doFilter(req, resp);
    //    logger.debug("< doFilter");
    }

}