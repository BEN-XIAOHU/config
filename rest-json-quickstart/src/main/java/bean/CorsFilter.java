package bean;

import javax.ws.rs.ext.Provider;

//@Provider
public class CorsFilter extends org.jboss.resteasy.plugins.interceptors.CorsFilter {
    public CorsFilter() {
        super.setAllowedMethods("OPTIONS, GET, POST, DELETE, PUT, PATCH");
        super.setAllowedHeaders("*");
        super.getAllowedOrigins().add("*");
    }
}