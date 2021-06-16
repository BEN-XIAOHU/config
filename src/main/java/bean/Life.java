package bean;

import org.eclipse.microprofile.rest.client.inject.RestClient;
import service.ClientService;
import service.ServiceUtil;
import controller.TestController;
import io.quarkus.runtime.ShutdownEvent;
import io.quarkus.runtime.StartupEvent;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.jboss.logging.Logger;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;
import javax.inject.Inject;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@ApplicationScoped
public class Life {
    private static final Logger LOGGER = Logger.getLogger("ListenerBean");

    @ConfigProperty(name = "service.configFile")
    String file;

    @Inject
    @RestClient
    ClientService clientService;

    @Inject
    ServiceUtil serviceUtil;
    //为什么不选择注入方式调用方法不行？
    void onStart(@Observes StartupEvent ev) {
        LOGGER.info("The application is starting...");
        LOGGER.info("time sync from \"timedatectl set-timezone Asia/Shanghai\"");
        exec("timedatectl set-timezone Asia/Shanghai");
        LOGGER.info("isSync:"+exec("timedatectl|grep synchronized|cut -f2 -d:").trim());
        System.out.println(file);
        System.out.println("检查服务配置，启动配置了启动的服务，默认全部启动");
        System.out.println();
        serviceUtil.getServiceConfig();

//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        String timeStamp=clientService.getCloudTime();
//        long longTimeStamp = new Long(timeStamp);
//        System.out.println(timeStamp);
//        System.out.println(simpleDateFormat.format(new Date(longTimeStamp)));
//        String commond="date -s "+"\""+simpleDateFormat.format(new Date(longTimeStamp))+"\"";
//        System.out.println("执行的命令"+commond);
//        try {
//            Process process=Runtime.getRuntime().exec("date -s "+commond);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

    }

    void onStop(@Observes ShutdownEvent ev) {
        LOGGER.info("The application is stopping...");

    }

    public String exec(String cmd) {
        try {
            String[] cmdA = {"/bin/sh", "-c", cmd};
            Process process = Runtime.getRuntime().exec(cmdA);
            LineNumberReader br = new LineNumberReader(new InputStreamReader(
                    process.getInputStream()));
            StringBuffer sb = new StringBuffer();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
