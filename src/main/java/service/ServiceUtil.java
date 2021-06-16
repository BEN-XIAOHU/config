package service;

import bean.YamlConfigs;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import javax.enterprise.context.ApplicationScoped;
import java.io.*;
import java.util.Map;

@ApplicationScoped
public class ServiceUtil {

    @ConfigProperty(name = "service.configFile")
    String file;

    Runtime runtime = Runtime.getRuntime();

    public boolean getServiceConfig() {
        YamlConfigs yamlConfigs = new YamlConfigs();
        System.out.println(file);
        File f = new File(file);
        if (f.exists()) {
            System.out.println("配置文件存在");
            Map<String, Object> yamlToMap = yamlConfigs.getYamlToMap(file);
            Map<String, Object> hikvision = (Map<String, Object>) yamlToMap.get("HikvisionAdapterService");
            Map<String, Object> core = (Map<String, Object>) yamlToMap.get("CoreService");
            System.out.println("海康威视配置" + hikvision.get("status"));
            System.out.println("核心服务配置" + core.get("status"));
            ServiceConfigRun("HikvisionAdapterService", (String) hikvision.get("status"));
            ServiceConfigRun("CoreService", (String) core.get("status"));
        } else {
            System.out.println("配置文件不存在,构建：" + file);
            try {
                yamlConfigs.initYamltoService(file);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public boolean ServiceConfigRun(String name, String status) {
        if (status.equals("open")) {
            //状态为开启的
            if (name.equals("HikvisionAdapterService")) {
                openHikvision();
            } else if (name.equals("CoreService")) {
                openCore();
            }
        } else if (status.equals("close")) {
            Runtime runtime = Runtime.getRuntime();
            if (name.equals("HikvisionAdapterService")) {
                closeHikvision();
            } else if (name.equals("CoreService")) {
                closeCore();
            }
        }
        return true;
    }

    public String ServiceConfigCompare(String name, String status) {
        YamlConfigs yamlConfigs = new YamlConfigs();
        System.out.println(file);
        File f = new File(file);

        if (f.exists()) {
            System.out.println("配置文件存在");
            Map<String, Object> y = yamlConfigs.getYamlToMap(file);

            for (String key : y.keySet()) {
                if (name.equals(key)) {
                    for (Object value : ((Map<String, Object>) y.get(key)).values()) {
                          System.out.println(((Map<String,Object>)y.get(key)).values());
                        System.out.println(value);
                        System.out.println(status);
                        System.out.println(!value.toString().equals(status));
                        if (!value.toString().trim().equals(status)) {
                            System.out.println(key + ":" + value);
                            System.out.println(name + ":" + status);
                            //不相同需要按状态进行同步
                            return (String) value;
                        }
                    }
                }

            }
        }
        return "null";
    }

    public boolean HikvisionRestart() {
        System.out.println("开启重启Hikvision");

        closeHikvision();
        openHikvision();

        return true;
    }

    public boolean CoreRestart() {
        System.out.println("开始重启Core服务");
        closeCore();
        openCore();

        return true;
    }

    public void openHikvision() {
        System.out.println("开始启动Hikvision服务");

        try {
            System.out.println("启动命令：java -jar /home/quarkus-app/quarkus-run.jar");
            Process process = runtime.exec("java -jar /home/quarkus-app/quarkus-run.jar");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Hikvision服务失败");
        }
        System.out.println("启动Hikvision服务成功");
    }

    public void openCore() {
        System.out.println("开始启动核心服务");
        System.out.println("启动命令：dotnet /root/publish/CoreService.dll");
        try {
            Process process = runtime.exec("dotnet /root/publish/CoreService.dll");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("核心服务启动成功");
    }

    public boolean closeHikvision() {
        try {
            String pid = null;
            System.out.println("开始关闭Hikvision服务");
            pid = exec("ps -ef | grep quarkus-run.jar|grep -v grep  | awk '{print $2}'");
            runtime.exec("kill -15 " + pid);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Hikvision关闭失败");
        }
        System.out.println("Hikvision关闭成功");
        return true;
    }

    public boolean closeCore() {
        try {
            String pid = null;
            System.out.println("开始关闭核心服务");
            pid = exec("ps -ef | grep CoreService|grep -v grep  | awk '{print $2}'");
            runtime.exec("kill -15 " + pid);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("核心关闭失败");
        }
        System.out.println("核心关闭成功");
        return true;
    }

    public boolean ServiceConfigSync(String name, String status) {

        if (status.equals("open")) {
            //状态为开启的
            if (name.equals("HikvisionAdapterService")) {
                HikvisionRestart();
            } else if (name.equals("CoreService")) {
                CoreRestart();
            }
        } else if (status.equals("close")) {
            if (name.equals("HikvisionAdapterService")) {
                closeHikvision();
            } else if (name.equals("CoreService")) {
                closeCore();
            }
        }
        return true;
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
