package controller;

import service.ClientService;
import service.MessageService;
import bean.*;
import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/test")
public class TestController {
    private final Logger log = Logger.getLogger(this.getClass());
    @Inject
    @RestClient
    ClientService clientService;

    Password password=new Password();

    @GET
    @Path("/token")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ClientToken test1 (User user)throws Exception{
        log.info("test1");
        log.info(user.username+user.password);
        password.setPassword(user.password);
        log.info(clientService.t1(user.username,password));
        return clientService.t1(user.username,password);
    }

    @GET
    @Path("/Retoken")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public ClientToken test2 (User user)throws Exception{
        log.info("test2");
        log.info(user.username+user.password);
        password.setPassword(user.password);

        return clientService.t2(clientService.t1(user.username,password).getRefreshToken());
    }

    @GET
    @Path("/cloud/hub")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public CloudArg test3 (User user)throws Exception{
        System.out.println(user);
        log.info("test3");
        log.info(user.username+user.password);
        password.setPassword(user.password);
        return  clientService.t3(clientService.t1(user.username,password).getAccessToken());
    }

    @GET
    @Path("/cloud/account")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public CloudArg test4 (User user)throws Exception{
        System.out.println(user);
        log.info("test4");
        log.info(user.username+user.password);
        password.setPassword(user.password);
        return  clientService.t4(clientService.t1(user.username,password).getAccessToken());
    }

    @GET
    @Path("/cloud/r")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public void test5 (User user)throws Exception{
        log.info("test4");
        log.info(user.username+user.password);
        password.setPassword(user.password);
        CloudArg cloud=clientService.t3(clientService.t1(user.username,password).getAccessToken());
        CloudArg cloudArg=clientService.t4(clientService.t1(user.username,password).getAccessToken());
        MessageService messageService=new MessageService();
       // messageService.con(cloud.getId(),cloud.getProjectId(),cloudArg.getId(),clientService.t1(user.username,password).getAccessToken());
    }
}
