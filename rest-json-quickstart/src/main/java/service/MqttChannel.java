package service;

import bean.*;
import com.hivemq.client.mqtt.datatypes.MqttQos;
import com.hivemq.client.mqtt.mqtt5.Mqtt5AsyncClient;
import com.hivemq.client.mqtt.mqtt5.Mqtt5Client;
import controller.ServiceController;
import io.quarkus.runtime.StartupEvent;
import io.quarkus.scheduler.Scheduled;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;
import javax.inject.Inject;
import java.io.*;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author wangjinxin
 * @version 1.0
 * @date 2020/06/19 16:38
 */
@ApplicationScoped
public class MqttChannel {

    private static final Logger logger = LoggerFactory.getLogger(MqttChannel.class);

    private Mqtt5AsyncClient hubChannel;

    private Mqtt5AsyncClient hubChannelLocal;

    private User user=new User();

    ClientToken clientToken;

    @ConfigProperty(name = "user.file")
    String file;

    @Inject
    @RestClient
    ClientService clientService;

    @Inject
    ServiceController serviceController;

    void onStart(@Observes StartupEvent ev) {
          logger.info("Mqtt conneter starting");
          MQTTStart();
    }

    public void MQTTStart() {
        File f = new File(file);
        logger.info(file);
        if (f.exists()) {
            read();
            logger.info("User exist==============" + user.username + "=========" + user.password);
            Password password = new Password();
            password.setPassword(user.password);
            System.out.println(user.username);
            clientToken = clientService.t1(user.username, password);
            logger.info("get token"+clientToken);
            CloudArg cloud = clientService.t3(clientToken.getAccessToken());
            CloudArg cloudArg = clientService.t4(clientToken.getAccessToken());

            if (clientToken!=null){
                logger.info("response info" );
            clientService.initInfo(clientToken.getAccessToken(), OSHIUntil.getHubInfo());
            }
//        try {
//            txt = new FileWriter(f);
//            txt.write();
//            txt.write();
//            txt.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

            build(cloud.getId());
            connect(cloudArg.getId(), clientService.t1(user.username, password).getAccessToken(), cloud.getProjectId(), cloud.getId());
            logger.info("本地连接开始");
            buildLocal();
            connectLocal(cloud.getProjectId(), cloud.getId());
        }

    }
    public Mqtt5AsyncClient getHubChannel() {
        return hubChannel;
    }

    private void build(String hubId) {
        hubChannel = Mqtt5Client.builder()
                .identifier(hubId)
                .serverHost("www2.homepluscloud.com")
                .serverPort(8800)
                .sslWithDefaultConfig()
                .automaticReconnectWithDefaultConfig()
                .buildAsync();
    }

    private void buildLocal() {
        logger.info("本地mqtt连接开始构建");
        hubChannelLocal = Mqtt5Client.builder()
                .identifier("ConfigurationServiceToCloud")
                .serverHost("127.0.0.1")
                .serverPort(1883)
                .automaticReconnectWithDefaultConfig()
                .buildAsync();
    }

    private void connect(String accountId,String accessToken,String projectId,String hubId) {
        System.out.println("hubid: "+hubId+" projectId: "+projectId+" acciybtud: "+accountId+" accessToken: "+accessToken);
        hubChannel.connectWith()
                .simpleAuth()
                .username(accountId)
                .password(accessToken.getBytes())
                .applySimpleAuth()
                .keepAlive(30)
                .send()
                .whenComplete((mqtt5ConnAck, throwable) -> {
                    if (throwable != null) {
                        // handle failure
                        logger.info("hubChannel connect fail !");
                    } else {
                        // setup subscribes or start publishing
                        hubChannelSubscribe(projectId,hubId);
                        logger.info("hubChannel connect success !");
                    }
                });
    }
    private void connectLocal(String projectId,String hubId) {
        logger.info("本地mqtt连接开始连接");
        hubChannelLocal.connectWith()
                .keepAlive(30)
                .send()
                .whenComplete((mqtt5ConnAck, throwable) -> {
                    if (throwable != null) {
                        // handle failure
                        logger.info("hubChannelLocal connect fail !");
                    } else {
                        // setup subscribes or start publishing
                        hubChannelSubscribeTolocal(projectId,hubId);
                        logger.info("hubChannelLocal connect success !");
                    }
                });
    }

    private void hubChannelSubscribe(String projectId,String hubId) {
        hubChannel.subscribeWith()
                .topicFilter("projects/"+projectId+"/hubs/"+hubId)
                .qos(MqttQos.AT_LEAST_ONCE)
                .callback(mqtt5Publish -> {
                    logger.info("message come from Cloud");
                  //  System.out.println("Received message on topic " + mqtt5Publish.getTopic() + ": " +
                          //  new String(mqtt5Publish.getPayloadAsBytes(), StandardCharsets.UTF_8));
                    hubChannelpublishToLocal(mqtt5Publish.getPayloadAsBytes(), projectId, hubId);
                })
                .send();
    }

    private void hubChannelSubscribeTolocal(String projectId,String hubId) {
        logger.info("本地mqtt连接开始订阅");
        hubChannelLocal.subscribeWith()
                .topicFilter("hub-communication")
                .qos(MqttQos.AT_LEAST_ONCE)
                .callback(mqtt5Publish -> {
                    logger.info("message come from local");
                   // System.out.println("Local Received message on topic " + mqtt5Publish.getTopic() + ": " +
                        //    new String(mqtt5Publish.getPayloadAsBytes(), StandardCharsets.UTF_8));
                    hubChannelpublish(mqtt5Publish.getPayloadAsBytes(),projectId,hubId);
                })
                .send();
    }

    private void hubChannelpublish(byte[] message,String projectId,String hubId){
        hubChannel.publishWith()
                .topic("hub-communication")
                .payload(message)
                .send()
                .whenComplete((publish, throwable) -> {
                    if (throwable != null) {
                        logger.info("hubChannel publish fail !");
                    } else {
                        logger.info("hubChannel publish success !");
                    }
                });
    }

    private void hubChannelpublishToLocal(byte[] message,String projectId,String hubId){

        hubChannelLocal.publishWith()
                .topic("projects/"+projectId+"/hubs/"+hubId)
                .payload(message)
                .send()
                .whenComplete((publish, throwable) -> {
                    if (throwable != null) {
                        logger.info("hubChannelLocal publish fail !");
                    } else {
                        logger.info("hubChannelLocal publish success !");
                    }
                });
    }

    @Scheduled(every = "60s",delay = 6,delayUnit = TimeUnit.SECONDS)
    public void RunInfoResponse() {
        HubInfoRun hubInfoRun=OSHIUntil.getHubInfoRun();
        List<ServiceStatus> serviceStatuses=serviceController.getServiceList();
        if (clientToken!=null){
            logger.info("start response running parameter (minutes) ");
            clientService.RunInfo(clientToken.getAccessToken(),hanlerSericeStringToCloud(hubInfoRun,serviceStatuses));
        }

    }

    @Scheduled(every = "25m",delay = 6,delayUnit = TimeUnit.SECONDS)
    public void RefreshToken() {
       logger.info("Refresh token");
       clientToken=clientService.t2(clientToken.getAccessToken());
        logger.info("Refresh token success");
    }

    public HubInfoRun  hanlerSericeStringToCloud(HubInfoRun hubInfoRun,List<ServiceStatus> serviceUtils) {
        StringBuilder name = new StringBuilder();
        StringBuilder version = new StringBuilder();
        StringBuilder status = new StringBuilder();
        StringBuilder updateTime = new StringBuilder();
        if (serviceUtils != null && serviceUtils.size() > 0) {
            for (int i = 0; i < serviceUtils.size(); i++) {
                if (i < serviceUtils.size() - 1) {
                    System.out.println("服务名称"+serviceUtils.get(i).getName());
                    name.append(serviceUtils.get(i).getName() + "##");
                    version.append(serviceUtils.get(i).getVersion() + "##");
                    status.append(serviceUtils.get(i).getStatus() + "##");
                    updateTime.append(serviceUtils.get(i).getTime() + "##");
                } else {
                    name.append(serviceUtils.get(i).getName());
                    version.append(serviceUtils.get(i).getVersion());
                    status.append(serviceUtils.get(i).getStatus());
                    updateTime.append(serviceUtils.get(i).getTime());
                }
            }
        }
        hubInfoRun.setHubServiceName(name.toString());
        hubInfoRun.setHubServiceStatus(status.toString());
        hubInfoRun.setHubServiceUpdateTime(updateTime.toString());
        hubInfoRun.setHubServiceVersion(version.toString());
        return hubInfoRun;
    }

    public void read() {
        FileReader fr;
        try {
            fr = new FileReader(file);
            BufferedReader br = new BufferedReader(fr);
            try {
                String line = br.readLine();
                user.setUsername(line.toString().substring(0,line.lastIndexOf(":")));
                user.setPassword(line.toString().substring(line.toString().indexOf(':')+1,line.toString().indexOf('.')));
//System.out.print(line);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
    }
}

