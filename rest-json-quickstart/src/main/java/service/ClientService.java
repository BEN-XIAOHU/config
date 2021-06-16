package service;

import bean.*;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;
import org.jboss.resteasy.annotations.jaxrs.PathParam;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@RegisterRestClient
public interface ClientService {



        @POST
        @Path("/mobile-login/{name}")
        @Produces(MediaType.APPLICATION_JSON)
        @Consumes(MediaType.APPLICATION_JSON)
        ClientToken t1(@PathParam("name") String user, Password password);


        @GET
        @Path("/mobile-login-tokens")
        @Produces(MediaType.APPLICATION_JSON)
        @Consumes(MediaType.APPLICATION_JSON)
        ClientToken t2(@HeaderParam("RefreshToken")String refreshToken);

        @GET
        @Path("/hubs/me")
        @Produces(MediaType.APPLICATION_JSON)
        @Consumes(MediaType.APPLICATION_JSON)
        CloudArg t3(@HeaderParam("AccessToken")String accessToken);


        @GET
        @Path("/me/accounts")
        @Produces(MediaType.APPLICATION_JSON)
        @Consumes(MediaType.APPLICATION_JSON)
        CloudArg t4(@HeaderParam("AccessToken")String accessToken);

        @GET
        @Path("/hubs/time")
        String getCloudTime();

        @PUT
        @Path("/hubs/me/init-information")
        @Consumes(MediaType.APPLICATION_JSON)
        void initInfo(@HeaderParam("AccessToken")String accessToken,HubInfo hubInfo);

        @PUT
        @Path("/hubs/me/running-information")
        @Consumes(MediaType.APPLICATION_JSON)
        void RunInfo(@HeaderParam("AccessToken")String accessToken, HubInfoRun hubInfoRun);
}
