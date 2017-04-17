//package prox.util;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//public class RequestContext {
//
//    private static Logger logger = LoggerFactory
//            .getLogger(RequestContext.class);
//
//    private static ThreadLocal<String> usernames = new ThreadLocal<String>();
//
//    private static ThreadLocal<Boolean> isPasswordUpdated = new ThreadLocal<Boolean>();
//
//    public RequestContext() {
//
//    }
//
//    public static String getUsername() {
//        return usernames.get();
//    }
//
//    public static void setUsername(String username) {
//     //   usernames.set(username);
//
//       // logger.debug("RequestContext added username {} to current thread",
//       //         username);
//    }
//
//    public static boolean getIsPasswordUpdated() {
//        return isPasswordUpdated.get();
//    }
//
//    public static void setIsPasswordUpdated(Boolean updated) {
//        isPasswordUpdated.set(updated);
//    }
//
//    public static void init() {
//        usernames.set(null);
//     //   isPasswordUpdated.set(null);
//    }
//
//}