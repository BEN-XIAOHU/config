package controller;

import service.ServiceUtil;
import bean.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.quarkus.scheduler.Scheduled;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.reactive.messaging.Channel;
import org.eclipse.microprofile.reactive.messaging.Emitter;
import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.jboss.logging.Logger;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Path("/hub/service")
public class ServiceController {
    MSG msg=new MSG();
    private final Logger log=Logger.getLogger(this.getClass());

    @ConfigProperty(name = "service.configFile")
    String file;

    @Inject
    @Channel("showServiceOut")
    Emitter<ServiceControl> emitter;

    @Inject
    ServiceUtil serviceUtil;

    List<ServiceStatus> serviceStatuses=new ArrayList<>();

    int init=0;

    Map<String,String> map=new HashMap<>();

    public List<ServiceStatus> getServiceList() {
        return serviceStatuses;
    }
    @Scheduled(every = "60s",delay = 10,delayUnit = TimeUnit.SECONDS)
    public void requestShowService() throws InterruptedException {
        if (init==0)
        {

            System.out.println("开始初始化");
            if (serviceStatuses.size()==0){
                ServiceStatus service1=new ServiceStatus();
                service1.setName("HikvisionAdapterService");
                service1.setStatus("close");
                service1.setVersion("0.0.1");
                service1.setRestartTimes(0);
                service1.setTime(getTime());
                serviceStatuses.add(service1);
                ServiceStatus service2=new ServiceStatus();
                service2.setName("CoreService");
                service2.setStatus("close");
                service2.setVersion("0.0.1");
                service2.setRestartTimes(0);
                service2.setTime(getTime());
                serviceStatuses.add(service2);
                map.put(service1.getName(),service1.getTime());
                map.put(service2.getName(),service2.getTime());
                service1=new ServiceStatus();
                service1.setName("ConfigurationService");
                service1.setStatus("close");
                service1.setVersion("0.0.1");
                service1.setRestartTimes(0);
                service1.setTime(getTime());
                serviceStatuses.add(service1);

            }
            init++;
        }
        ServiceControl serviceControl=new ServiceControl();
        serviceControl.setControl("HeartBeat");
        System.out.println("发送："+serviceControl);
        emitter.send(serviceControl);
        System.out.println(serviceStatuses);
    }

    @GET
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ServiceStatus> showService() throws InterruptedException {
        ServiceControl serviceControl=new ServiceControl();
        serviceControl.setControl("HeartBeat");
        System.out.println("发送："+serviceControl);
        emitter.send(serviceControl);
        return serviceStatuses;
    }

    @PUT
    @Path("/config")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public MSG controlService(ServiceStatus[] serviceStatus) throws InterruptedException, IOException {
        System.out.println(serviceStatus.length);
        YamlConfigs yamlConfigs=new YamlConfigs();
        File f=new File(file);
        if (!f.exists()){
            yamlConfigs.initYamltoService(file);}
        for (int i=0;i<serviceStatus.length;i++)
        {

//            configs.updateYaml("network.ethernets."+usedev+".dhcp4", a, file);
            System.out.println("收到的配置信息："+serviceStatus[i]);

            Map<String,Object> y=yamlConfigs.getYamlToMap(file);
            System.out.println(y);
            System.out.println("开始改变配置");
       yamlConfigs.updateYaml(serviceStatus[i].getName()+".status",serviceStatus[i].getStatus(),file);
       System.out.println(y);
        }
        syncCheck();
        msg.setCode("200");
        return msg;
    }


    @PUT
    @Path("/")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public MSG controlService(ServiceStatus serviceStatus) throws InterruptedException, IOException {
        if ("open".equals(serviceStatus.getStatus()))
        {
            if ("HikvisionAdapterService".equals(serviceStatus.getName()))
            {
              serviceUtil.HikvisionRestart();
            }
            else if (serviceStatus.getName().equals("CoreService")){
                serviceUtil.CoreRestart();
                }

        }else if ("close".equals(serviceStatus.status)){
            String pid=null;
            if (serviceStatus.getName().equals("HikvisionAdapterService"))
            {
                serviceUtil.closeHikvision();
            } else if (serviceStatus.getName().equals("CoreService"))
            {
              serviceUtil.closeCore();
            }
            for  ( int  i  =   0 ; i  <  serviceStatuses.size() ; i ++ )  {
                if (serviceStatuses.get(i).getName().equals(serviceStatus.getName())&&!serviceStatuses.get(i).getStatus().equals(serviceStatus.getStatus()))
                {
                    serviceStatuses.get(i).setStatus("close");
                    //serviceStatuses.get(i).setVersion(serviceStatus.getVersion());
                    serviceStatuses.get(i).setTime(getTime());
                }
            }

        }
       // serviceStatusEmitter.send(serviceStatus);
        msg.setCode("200");
        return msg;
    }

    @Scheduled(every = "60s",delay = 1,delayUnit = TimeUnit.MINUTES)
    public void HeartBeat() throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (int i=0;i<serviceStatuses.size()-1;i++)
        {
//            System.out.println("当前记录时间"+serviceStatuses.get(i).time);
            Date d1=new Date();
            String time =df.format(d1);
            Date now=df.parse(time);
//            System.out.println("当前时间"+time);
//            System.out.println("当前时间"+now.getTime());
            Date d2=df.parse(map.get(serviceStatuses.get(i).getName()));
//            System.out.println("最后一次记录时间"+map.get(serviceStatuses.get(i).getName()));
//            System.out.println("最后一次记录时间"+d2.getTime());
            log.info("time check"+now.getTime()+" "+d2.getTime());
            if ((now.getTime()>(d2.getTime()+300000))&&!serviceStatuses.get(i).getStatus().equals("close"))
            {
                log.info(serviceStatuses.get(i).getTime());
                System.out.println("无心跳，状态设为关闭");
                serviceStatuses.get(i).setTime(getTime());
                serviceStatuses.get(i).setStatus("close");
            }


            //拿到启动的时间做对比,如果没有到三分钟就不再启动。到达三分钟就再启动，重启三次之后设置为异常。

        }
        syncCheck();
    }


    @Incoming("showServiceIn")
    public void accept(byte[] cmd) throws IOException {
        log.info("showServiceIn"+"haertbeat");
        ObjectMapper objectMapper = new ObjectMapper();
        ServiceStatus service = null;
        service  = objectMapper.readValue(cmd, ServiceStatus.class);
        System.out.println(service);
        map.put(service.getName(),getTime());
        for  ( int  i  =   0 ; i  <  serviceStatuses.size() ; i ++ )  {
            if (serviceStatuses.get(i).getName().equals(service.getName())&&!serviceStatuses.get(i).getStatus().equals(service.getStatus()))
            {
                serviceStatuses.get(i).setStatus(service.getStatus());
                serviceStatuses.get(i).setVersion(service.getVersion());
                serviceStatuses.get(i).setRestartTimes(0);
                //我获取到状态已经改变的命令后再赋予时间
                serviceStatuses.get(i).setTime(getTime());
            }
        }
        log.info(serviceStatuses);
    }
    public String getTime()
    {
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return simpleDateFormat.format(date);
    }

    private  void syncCheck()
    {
        log.info("sync check start");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date d1=new Date();
        String time =df.format(d1);
        try {
            Date now=df.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        for (int i=0;i<serviceStatuses.size()-1;i++) {
            String status = "null";
            //比较运行中的状态和配置的状态是否一致
            if ((!serviceStatuses.get(i).getStatus().equals("exception")) && (!serviceStatuses.get(i).getStatus().equals("opening"))) {
                status = serviceUtil.ServiceConfigCompare(serviceStatuses.get(i).name, serviceStatuses.get(i).getStatus());
                log.info("fix to "+status);
            }

            if (!status.equals("null")) {

                if (status.equals("close")) {
                    serviceUtil.ServiceConfigSync(serviceStatuses.get(i).name, status);
                }
                System.out.println("是否是open"+status.equals("open"));
                if (status.equals("open")) {
                    if (serviceStatuses.get(i).getRestartTimes() == 3) {
                        log.info(serviceStatuses.get(i).getName() + "重启次数到达3次，服务异常,不再重启");
                        serviceStatuses.get(i).setStatus("exception");
                        continue;
                    }
                    //时间超过三分钟，启动次数在0-3
                    try {
                        System.out.println(df.parse(serviceStatuses.get(i).getTime()).getTime()+"-----------"+df.parse(df.format(new Date())).getTime()+"-------"+new Date().getTime());
                        if (df.parse(serviceStatuses.get(i).getTime()).getTime() + 180000 < df.parse(df.format(new Date())).getTime() || serviceStatuses.get(i).getRestartTimes() >= 3) {
                            continue;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    System.out.println("进行同步");
                    System.out.println(serviceStatuses.get(i).getName() + "第" + serviceStatuses.get(i).getRestartTimes() + "次重启");
                    serviceUtil.ServiceConfigSync(serviceStatuses.get(i).name, status);
                    serviceStatuses.get(i).setStatus("opening");
                    serviceStatuses.get(i).setRestartTimes(serviceStatuses.get(i).getRestartTimes() + 1);

                }

            }
        }
    }

    private static void printMessage(final InputStream input) {
        new Thread(new Runnable() {
            public void run() {
                Reader reader = new InputStreamReader(input);
                BufferedReader bf = new BufferedReader(reader);
                String line = null;
                try {
                    while ((line = bf.readLine()) != null) {
                        System.out.println(line);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}
