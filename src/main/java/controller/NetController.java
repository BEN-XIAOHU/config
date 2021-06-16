package controller;

import bean.HostNetCfg;
import bean.MSG;
import bean.OSHIUntil;
import bean.YamlConfigs;
import org.apache.commons.lang3.StringUtils;
import oshi.SystemInfo;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.hardware.NetworkIF;
import oshi.software.os.OperatingSystem;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.*;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Path("/hub/network")
public class NetController {
    MSG msg=new MSG();

    @GET
    @Path("/")
    public HostNetCfg getnet ()throws Exception{
        HostNetCfg hostNetCfg=new HostNetCfg();
        YamlConfigs configs = new YamlConfigs();
        String netcig=exec("ls /etc/netplan").trim();
        String file="/etc/netplan/"+netcig;
        Map<String, Object> yamlToMap = configs.getYamlToMap(file);
        SystemInfo si = new SystemInfo();

        HardwareAbstractionLayer hal = si.getHardware();
        List<NetworkIF> networkIFs=hal.getNetworkIFs();
        OperatingSystem os = si.getOperatingSystem();
        String usedev=networkIFs.get(0).getDisplayName();
        System.out.println(usedev);
        if (yamlToMap==null)
        {
            configs.initYaml(usedev,file);
            Runtime run = Runtime.getRuntime();
            Process process=run.exec("netplan apply");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
            yamlToMap = configs.getYamlToMap(file);
        }
        //一层层获取map
        Map<String, Object> network=(Map<String,Object>)yamlToMap.get("network");
        if (network==null)
        {
            configs.initYaml(usedev,file);
            yamlToMap = configs.getYamlToMap(file);
            Runtime run = Runtime.getRuntime();
            Process process=run.exec("netplan apply");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
            network=(Map<String,Object>)yamlToMap.get("network");
        }

        Map<String, Object> ethernets=(Map<String,Object>)network.get("ethernets");
        if (ethernets==null){
            configs.initYaml(usedev,file);
            Runtime run = Runtime.getRuntime();
            Process process=run.exec("netplan apply");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
            yamlToMap = configs.getYamlToMap(file);

            network=(Map<String,Object>)yamlToMap.get("network");
            ethernets=(Map<String,Object>)network.get("ethernets");
        }

        //Map<String, Object> dev1=(Map<String,Object>)ethernets.get("ens33");
        Map<String, Object> dev1=(Map<String,Object>)ethernets.get(usedev);
        if (dev1==null){
            configs.initYaml(usedev,file);
            Runtime run = Runtime.getRuntime();
            Process process=run.exec("netplan apply");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
            yamlToMap = configs.getYamlToMap(file);
            network=(Map<String,Object>)yamlToMap.get("network");
            ethernets=(Map<String,Object>)network.get("ethernets");
            dev1=(Map<String,Object>)ethernets.get(usedev);
        }

        if ( dev1.get("dhcp4")==null){
            configs.initYaml(usedev,file);
            Runtime run = Runtime.getRuntime();
            Process process=run.exec("netplan apply");
            printMessage(process.getInputStream());
            printMessage(process.getErrorStream());
            yamlToMap = configs.getYamlToMap(file);
            network=(Map<String,Object>)yamlToMap.get("network");
            ethernets=(Map<String,Object>)network.get("ethernets");
            dev1=(Map<String,Object>)ethernets.get(usedev);
        }

        Map<String, Object> nameservers=(Map<String,Object>)dev1.get("nameservers");
        System.out.println("ens33 dhcp开启状态:"+dev1.get("dhcp4"));
        hostNetCfg.hubDhcp=(Boolean)dev1.get("dhcp4");
//        if ((dev1.get("dhcp4").toString().equals("false"))||(dev1.get("dhcp4").toString().equals("no"))) {
//
//            String[] ip4 = dev1.get("addresses").toString().replaceAll("\\[", "").replaceAll("\\]", "").split("/");//有问题空指针
//            System.out.println(" ip4地址：" + ip4[0]);
//            hostNetCfg.ip=ip4[0];
//            int ip = 0xFFFFFFFF << (32 - Integer.parseInt(ip4[1]));
//            String binaryStr = Integer.toBinaryString(ip);
//            StringBuffer buffer = new StringBuffer();
//
//            for (int j = 0; j < 4; j++) {
//                int beginIndex = j * 8;
//                buffer.append(Integer.parseInt(binaryStr.substring(beginIndex, beginIndex + 8), 2)).append(".");
//            }
//            hostNetCfg.netmask=buffer.substring(0, buffer.length() - 1);
//            hostNetCfg.gateway=(String) dev1.get("gateway4");
//            hostNetCfg.dns=nameservers.get("addresses").toString();
//            System.out.println("ip4子网掩码：" + buffer.substring(0, buffer.length() - 1));
//            System.out.println("网关地址：" + dev1.get("gateway4"));
//            System.out.println("DNS：" + nameservers.get("addresses").toString());
//        }
//        else {
        int ip=0;
        for (int i=0;i<networkIFs.get(0).getSubnetMasks().length;i++) {
            ip = 0xFFFFFFFF << (32 - (networkIFs.get(0).getSubnetMasks()[i]));
        }
        String binaryStr = Integer.toBinaryString(ip);
        StringBuffer buffer = new StringBuffer();

        for (int j = 0; j < 4; j++) {
            int beginIndex = j * 8;
            buffer.append(Integer.parseInt(binaryStr.substring(beginIndex, beginIndex + 8), 2)).append(".");
        }

        hostNetCfg.setHubIp(StringUtils.strip(Arrays.toString(networkIFs.get(0).getIPv4addr()),"[]"));
        hostNetCfg.setHubNetmask(buffer.substring(0, buffer.length() - 1));
        hostNetCfg.setHubGateway(os.getNetworkParams().getIpv4DefaultGateway());
        if (os.getNetworkParams().getIpv4DefaultGateway().equals("")){
            hostNetCfg.setHubGateway(exec("ip route show|grep default' 'via|cut -f3 -d' '").trim());
        }

        System.out.println(exec("nmcli dev show | grep IP4.DNS|cut -f2 -d:").trim());
        String dns[]=exec("nmcli dev show | grep IP4.DNS|cut -f2 -d:").split("\\n");
        hostNetCfg.setHubFirstDns(dns[0].trim());
        hostNetCfg.setHubReserveDns("");
        if (dns.length==2) {
            hostNetCfg.setHubReserveDns(dns[1].trim());
        }
        // hostNetCfg.setDns(Arrays.toString(os.getNetworkParams().getDnsServers()));
        //}
        hostNetCfg.setHubMac(OSHIUntil.printNetworkInterfaces().getMac());
        System.out.println(yamlToMap);
        return hostNetCfg;

    }
    @PUT
    @Path("/dhcp/open")
    @Produces(MediaType.APPLICATION_JSON)
    public MSG checkNet()throws Exception
    {

        boolean a=true;
        YamlConfigs configs =new YamlConfigs();

        SystemInfo si = new SystemInfo();
        HardwareAbstractionLayer hal = si.getHardware();
        List<NetworkIF> networkIFs=hal.getNetworkIFs();
        String usedev=networkIFs.get(0).getDisplayName();
        String netcig=exec("ls /etc/netplan").trim();
        String file="/etc/netplan/"+netcig;
        boolean b=configs.updateYaml("network.ethernets."+usedev+".dhcp4", a, file);
        boolean c=configs.removeYaml("network.ethernets."+usedev+".addresses",file);
        configs.removeYaml("network.ethernets."+usedev+".gateway4",file);
        configs.removeYaml("network.ethernets."+usedev+".nameservers",file);
        Runtime run = Runtime.getRuntime();
        run.exec("netplan apply");
        //返回成功状态码
        msg.setCode("200");
        return msg;
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/dhcp")
    public MSG diyNet(HostNetCfg hostNetCfg)
    {
        String file="/etc/netplan/"+exec("ls /etc/netplan").trim();
        YamlConfigs configs =new YamlConfigs();
        //获取当前网卡名
        SystemInfo si = new SystemInfo();
        HardwareAbstractionLayer hal = si.getHardware();
        List<NetworkIF> networkIFs=hal.getNetworkIFs();
        String usedev=networkIFs.get(0).getDisplayName();
        boolean a=true;
        boolean b=false;
        if (hostNetCfg.getHubDhcp())
        {
            configs.updateYaml("network.ethernets."+usedev+".dhcp4", a, file);
            configs.removeYaml("network.ethernets."+usedev+".addresses",file);
            configs.removeYaml("network.ethernets."+usedev+".gateway4",file);
            configs.removeYaml("network.ethernets."+usedev+".nameservers",file);
            Runtime run = Runtime.getRuntime();
            try {
                run.exec("netplan apply");
            } catch (IOException e) {
                e.printStackTrace();
            }
            //返回成功状态码
            msg.setCode("200");
            return msg;
        }

        boolean c=configs.addYaml("network.ethernets."+usedev+".dhcp4", b, file);
//        String mac=hostNetCfg.getHubMac();
        configs.addYaml("network.ethernets."+usedev+".addresses",new String[] {hostNetCfg.getHubIp()+"/"+calcPrefixLengthByMack(hostNetCfg.getHubNetmask())}, file);
        configs.addYaml("network.ethernets."+usedev+".gateway4", hostNetCfg.getHubGateway(), file);
        Map<String,Object> map=new LinkedHashMap<>();
        //只有一个dns
        if (!hostNetCfg.getHubReserveDns().equals("null")){
            map.put("addresses",new String[] {hostNetCfg.getHubFirstDns(),hostNetCfg.getHubReserveDns()});
        }else {
            map.put("addresses",hostNetCfg.getHubFirstDns());
        }


        configs.addYaml("network.ethernets."+usedev+".nameservers", map, file);
        Runtime run = Runtime.getRuntime();
        try {
            run.exec("netplan apply");
        } catch (IOException e) {
            e.printStackTrace();
        }
        //返回成功状态码
        msg.setCode("200");
        return msg;
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
    public int calcPrefixLengthByMack(String strip) {//输入子网掩码获得长度
        StringBuffer sbf;
        String str;
// String strip = "255.255.255.0"; // 子网掩码
        int inetmask = 0, count = 0; // 子网掩码缩写代码
        String[] ipList = strip.split("\\.");
        for (int n = 0; n < ipList.length; n++) {
            sbf = toBin(Integer.parseInt(ipList[n]));
            str = sbf.reverse().toString();



// 统计2进制字符串中1的个数
            count = 0;
            for (int i = 0; i < str.length(); i++) {
                i = str.indexOf('1', i); // 查找 字符'1'出现的位置
                if (i == -1) {
                    break;
                }
                count++; // 统计字符出现次数
            }
            inetmask += count;
        }
        return inetmask;
    }
    public StringBuffer toBin(int x) {
        StringBuffer result = new StringBuffer();
        result.append(x % 2);
        x /= 2;
        while (x > 0) {
            result.append(x % 2);
            x /= 2;
        }
        return result;
    }

    @GET
    @Path("/dhcp4/init")
    public void initNet ()throws Exception{
        YamlConfigs configs = new YamlConfigs();
        SystemInfo si = new SystemInfo();
        String cfg=exec("ls /etc/netplan").trim();
        HardwareAbstractionLayer hal = si.getHardware();
        List<NetworkIF> networkIFs=hal.getNetworkIFs();
        String usedev=networkIFs.get(0).getDisplayName();
        configs.initYaml(usedev,"/etc/netplan/"+cfg);
        Runtime run = Runtime.getRuntime();
        Process netplan_apply = run.exec("netplan apply");
        printMessage(netplan_apply.getInputStream());
        printMessage(netplan_apply.getErrorStream());
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
