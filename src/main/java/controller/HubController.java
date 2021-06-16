package controller;

import service.MqttChannel;
import bean.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.quarkus.scheduler.Scheduled;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.reactive.messaging.Channel;
import org.eclipse.microprofile.reactive.messaging.Emitter;
import org.eclipse.microprofile.reactive.messaging.Incoming;
import oshi.SystemInfo;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Path("/hub")
public class HubController {
    @Inject
    @Channel("cpuInfo")
    Emitter<Map> cpuEmitter;

    @Inject
    @Channel("userLogin")
    Emitter<User> emitter;

    @Inject
    @Channel("checkLogin")
    Emitter<String> stringEmitter;

    @ConfigProperty(name = "user.file")
    String file;

    @Inject
    MqttChannel mqttChannel;
    int action=0;

    int i=0;
    //是否收到
    int j=0;
    //重发几次
    int k=0;
    //检测结果
    int check=0;
    Host host=new Host();
    MSG msg=new MSG();
    User user0=new User();
    User user1=new User("null");
    Message message=new Message();
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/ip")
    public Host find ()throws Exception
    {
        return host;
    }

    @Scheduled(every = "3s",delay = 10,delayUnit = TimeUnit.SECONDS)
    public void findIp(){
        OSHIUntil oshiUntil=new OSHIUntil();
        host.setIp(OSHIUntil.printNetworkInterfaces().getIp());
        host.setMac(OSHIUntil.printNetworkInterfaces().getMac());
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/hardware")
    public HubHardWare getHostInfo1 ()throws Exception
    {
        HubHardWare hubHardWare=new HubHardWare();
        HostInfo hostInfo=OSHIUntil.findHostInfo();
        hubHardWare.setHubCpuCore(hostInfo.getCpu().getCount());
        hubHardWare.setHubCpuModel(hostInfo.getCpu().getModel());
        hubHardWare.setHubCpuUsePercent(hostInfo.getCpu().getUsed());
        hubHardWare.setHubOsArch(hostInfo.getOs().getArch());
        hubHardWare.setHubOsVersion(hostInfo.getOs().getVersion());
        hubHardWare.setHubMemoryUsePercent(hostInfo.getMemory().getMemUsedPercent());
        hubHardWare.setHubMemoryTotal(hostInfo.getMemory().getMemTotal());
        hubHardWare.setHubMemoryUsed(hostInfo.getMemory().getMemUsed());
        hubHardWare.setHubDiskTotal(hostInfo.getDisk().getTotal());
        hubHardWare.setHubDiskUsed(hostInfo.getDisk().getUsed());
        hubHardWare.setHubDiskUsePercent(hostInfo.getDisk().getUsePercent());
        return hubHardWare;
    }
    @PUT
    @Path("/reboot")
    @Produces(MediaType.APPLICATION_JSON)
    public MSG remake() throws IOException {
        Runtime.getRuntime().exec("shutdown -r now");
        msg.setCode("200");
        return msg;
    }
    @GET
    @Path("/cpu")
    @Produces(MediaType.APPLICATION_JSON)
    public MSG cpuandmen ()throws Exception
    {
        action=1;
        msg.setCode("200");
        return msg;
    }


    @GET
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/account")
    public User findAccount() throws InterruptedException {
        stringEmitter.send("find");
        Thread.sleep(500);
        if (check==1){
            message.setMessage("true");
        }
        if (check==0) {
            message.setMessage("false");
        }
        if (user1.getUsername().isEmpty())
        {
            user1.setUsername("null");
        }
        return user1;
    }

    @Incoming("checkLoginReturn")
    public void Checkresponse(byte[] bytes) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();

         user1=objectMapper.readValue(bytes, User.class);
        System.out.println(user1);
        if ((!user1.username.isEmpty())&&(!user1.username.equals("null")))
        {
            check=1;
        }else if (user1.username.isEmpty()){
            check=0;
        }

    }


    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/account")
    public MSG add(User user) {
        File f=new File(file);
        try {
            FileWriter txt=new FileWriter(f);
            txt = new FileWriter(f);
            txt.write(user.username+":");
            txt.write(user.password+".");
            txt.close();
        } catch (IOException e) {
           e.printStackTrace();
        }
       // mqttChannel.MqttStart();
        msg.setCode("500");
        user0=user;
        j=1;
        k=0;
        msg.setCode("200");
        return msg;
    }
    @Scheduled(every = "2s",delay = 10,delayUnit = TimeUnit.SECONDS)
    public void sendLogin()
    {
        if (j==1&&k<3){
            System.out.println("未收到成功返回值"+k);
        emitter.send(user0);
        k++;
        }
    }

    @Incoming("loginResponseIn")
    public void response(byte[] bytes) throws IOException {

        String msg=new String(bytes);
        System.out.println(msg);
        if (msg.equalsIgnoreCase("ok"))
        {
            j=0;
            k=0;
            return;
        }
    }


    @Scheduled(every = "5s",delay = 10,delayUnit =TimeUnit.SECONDS)
    public void cpuaction()
    {
        if (action==1) {
            try {
                SystemInfo systemInfo=new SystemInfo();
                Map<String,String> map=new HashMap<>();
                map.put("cpu",OSHIUntil.printlnCpuInfo(systemInfo).getUsed());
                map.put("mem",OSHIUntil.MemInfo().getMemUsedPercent());
                cpuEmitter.send(map);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        i++;
        if(i>=(10*60/5))
        {
            i=0;
            action=0;
        }
    }

}
