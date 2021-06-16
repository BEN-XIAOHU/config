package service;

import com.hivemq.client.mqtt.datatypes.MqttQos;
import com.hivemq.client.mqtt.mqtt5.Mqtt5AsyncClient;
import com.hivemq.client.mqtt.mqtt5.Mqtt5Client;
import org.jboss.logging.Logger;


import javax.enterprise.context.ApplicationScoped;
import java.nio.charset.StandardCharsets;


@ApplicationScoped
public class MessageService {

    private final Logger logger=Logger.getLogger(this.getClass());
//    @Inject
//    @RestClient
//    ClientService clientService;

    public void con(String hubId,String projectId,String accountId,String accessToken){

//        Mqtt5BlockingClient client = Mqtt5Client.builder()
//                .identifier(hubId)
//                .serverHost("homepluscloud.com")
//                .buildBlocking();




        System.out.println("hubid"+hubId+"projectId"+projectId+"acciybtud"+accountId+"accessToken"+accessToken);
       final Mqtt5AsyncClient client = Mqtt5Client.builder()
                .identifier(hubId)//id
                .serverHost("homepluscloud.com")//地址
                .serverPort(8800)//端口
                .sslWithDefaultConfig()
                .automaticReconnectWithDefaultConfig()//客户端自动连接
                .buildAsync();
        client.connectWith().simpleAuth()
                .username(accountId)
                .password(accessToken.getBytes())
                .applySimpleAuth()
                .send()
                .whenComplete((connAck, throwable) -> {
                    if (throwable != null) {
                        logger.info("连接失败");
                    } else {
                        logger.info("连接成功");
                    }
                });
        client.connect().thenAccept(connAck -> System.out.println("connected " + connAck))
                .thenAccept(publishResult -> System.out.println("published " + publishResult))
                .thenCompose(v -> client.disconnect())
                .thenAccept(v -> System.out.println("disconnected"));

        System.out.println("开始订阅");
        client.subscribeWith()
                .topicFilter("projects/"+projectId+"/hubs/"+hubId)
                .qos(MqttQos.EXACTLY_ONCE)
                .callback(publish -> {
                    System.out.println("Received message on topic " + publish.getTopic() + ": " +
                            new String(publish.getPayloadAsBytes(), StandardCharsets.UTF_8));
                    System.out.println("received message: " + publish);
                })
                .send()
                .join()
//                .whenComplete((subAck, throwable) -> {
//                    if (throwable != null) {
//                        logger.info("订阅失败");
//                    } else {
//                        logger.info("订阅成功");
//                    }
//                })
                ;


    }
}
