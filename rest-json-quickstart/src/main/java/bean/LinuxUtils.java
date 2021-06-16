package bean;

import com.sun.management.OperatingSystemMXBean;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.lang.management.ManagementFactory;
import java.util.*;

public class LinuxUtils {

    /**
     * java执行linux命令
     */
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

    /**
     * 格式化linux返回
     * 返回一个二维数组
     */
    public List<List<String>> format(String string) {
        List<List<String>> result = new ArrayList<>();
        if (StringUtils.isNotBlank(string)) {
            String[] lines = string.split("\n");
            for (String line : lines) {
                String[] strings = line.split(" ");
                List<String> temp = new ArrayList<>();
                for (String str : strings) {
                    if (StringUtils.isNotBlank(str)) {
                        temp.add(str);
                    }
                }
                result.add(temp);
            }
        }
        return result;
    }

    /**
     * 获取linux下 系统盘使用情况
     */
    public Map<String, Object> getDeskInfo() {
        Map<String, Object> result = new HashMap<>();
        try {
            String info = exec("df");
            List<List<String>> lists = format(info);
            for (List<String> list : lists) {
                if (list.size() >= 6 && "/".equals(list.get(5))) {
                    for (int i = 0; i < list.size(); i++) {
                        // 文件系统名称
                        result.put("diskName", list.get(0));
                        // 总空间
                        result.put("total", list.get(1));
                        // 已用
                        result.put("used", list.get(2));
                        // 可用
                        result.put("available", list.get(3));
                        // 百分比
                        result.put("useRate", list.get(4));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取linux下 内存使用情况
     * mem 为内存
     * swap为交换区
     */
    public Map<String, Object> getRamInfo() {
        Map<String, Object> result = new HashMap<>();
        try {
            String info = exec("free");
            List<List<String>> lists = format(info);
            for (List<String> list : lists) {
                if (StringUtils.isNotBlank(list.get(0)) && list.get(0).toLowerCase().contains("mem")) {
                    Map<String, Object> mem = new HashMap<>();
                    mem.put("total", list.get(1));
                    mem.put("used", list.get(2));
                    mem.put("free", list.get(3));
                    mem.put("shared", list.get(4));
                    mem.put("cache", list.get(5));
                    mem.put("available", list.get(6));
                    mem.put("userate",Double.parseDouble(list.get(6))/Double.parseDouble(list.get(1)));
                    result.put("mem", mem);
                } else if (StringUtils.isNotBlank(list.get(0)) && list.get(0).toLowerCase().contains("swap")) {
                    Map<String, Object> swap = new HashMap<>();
                    swap.put("total", list.get(1));
                    swap.put("used", list.get(2));
                    swap.put("free", list.get(3));
                    result.put("swap", swap);
                }
            }
        } catch (
                Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取linux下 CPU使用情况 (使用top -b -n 1 实现,亲测不是十分准确,暂未使用)
     */
    public Map<String, Object> getCPUInfoByTop() {
        Map<String, Object> result = new HashMap<>();
        try {
            String info = exec("top -b -n 1 | sed -n '3p'");
            String[] strings = info.split(":")[1].split(",");
            for (String string : strings) {
                if (StringUtils.isNotBlank(string) && string.toLowerCase().contains("id")) {
                    String free = string.replace("id", "").trim();
                    result.put("free", free);
                    System.out.println(free);
                    String used = String.valueOf((10000 - Double.parseDouble(free) * 100) / 100);
                    result.put("used", used);
                }
            }
        } catch (
                Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取linux下 CPU使用情况 通过采集两次/proc/stat 计算CPU差值对比实现
     * 参考:
     * https://www.cnblogs.com/shihaiming/p/7048264.html
     * https://www.cnblogs.com/gisblogs/p/3985393.html
     */
    public Map<String, Object> getCPUInfo() {
        Map<String, Object> result = new HashMap<>();
        try {
            String info = exec("cat /proc/stat");
            List<String> cpu1 = format(info).get(0);
            // 间隔时间 推荐设置在 200 - 5000 毫秒之间 (小了不准 大了太慢)
            Thread.sleep(2000);
            info = exec("cat /proc/stat");
            List<String> cpu2 = format(info).get(0);
            // 用初中数学优化了一下网上的算法
            float total = Float.parseFloat(cpu2.get(1)) - Float.parseFloat(cpu1.get(1)) +
                    Float.parseFloat(cpu2.get(2)) - Float.parseFloat(cpu1.get(2)) +
                    Float.parseFloat(cpu2.get(3)) - Float.parseFloat(cpu1.get(3));
            float totalidle = total + Float.parseFloat(cpu2.get(4)) - Float.parseFloat(cpu1.get(4));
            float useRate = (total / totalidle) * 100;
            result.put("cpu:useRate", useRate);
        } catch (
                Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    //lsb_release -a
   // @Scheduled(every = "10s")
    public void ubuntu1() {
//        String info = exec("cat /proc/cpuinfo | grep 'model name'|uniq");
//        System.out.println("cpu型号"+info);

        OperatingSystemMXBean osmxb = (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
        // 物理内存（内存条）

        System.out.println("操作系统架构:" + exec("uname -m"));
        System.out.println("操作系统名称:" + exec("uname -s"));
        //uname -r
        System.out.println("操作系统发行号:" + exec("uname -r").trim());
        //uname -v
        System.out.println("操作系统版本:" + exec("lsb_release -a |grep Description | cut -f2 -d:|uniq"));

        System.out.println("cpu型号" + exec("cat /proc/cpuinfo | grep name | cut -f2 -d: |uniq"));
        long physicalMemorySize = osmxb.getTotalPhysicalMemorySize();
        System.out.println("物理内存：" + physicalMemorySize / 1024.0 / 1024.0);
        // 剩余的物理内存
        long freePhysicalMemorySize = osmxb.getFreePhysicalMemorySize();
        System.out.println("总  的  内 存" + Math.round(physicalMemorySize / 1024.0 / 1024.0));
        System.out.println("总  的  内 存" + Math.round(physicalMemorySize / 1024.0 / 1024.0));
        System.out.println("使用的内存" + Math.round((physicalMemorySize - freePhysicalMemorySize) / 1024.0 / 1024.0));
        Double compare = (Double) (1 - freePhysicalMemorySize * 1.0 / physicalMemorySize) * 100;
        String str = "内存已使用:" + compare.intValue() + "%";
        System.out.println(str);
        long time = System.currentTimeMillis();
        LinuxUtils linuxUtils = new LinuxUtils();
        //获取df
        System.out.println(linuxUtils.getDeskInfo());
        //获得free命令的信息
        System.out.println(linuxUtils.getRamInfo());

        System.out.println(linuxUtils.getCPUInfo());
        //System.out.println(linuxUtils.getCPUInfoByTop());
        System.out.println("消耗时间:" + (System.currentTimeMillis() - time) / 1000.0 + "秒");
        System.out.println("----------------------------------------------");
        System.out.println("子网掩码：" + exec("ifconfig | grep netmask|cut -f4 -d\\t").trim());
        //System.out.println("cpu使用率："+OSUtils.cpuUsage());
        //System.out.println("内存使用信息:"+OSUtils.memoryUsage());
        //System.out.println("磁盘使用信息:"+OSUtils.disk());
        System.out.println("网关：" + exec(" ip route show|grep default' 'via|cut -f3 -d' '").trim());

        System.out.println("dns服务：" + exec("cat /etc/resolv.conf|grep nameserver|cut -f2 -d' '").trim());

        System.out.println("服务情况："+exec("service --status-all").replace("+","active").replace("-","inactive"));

      //  获取一个请求 获得参数后 线程沉睡10分钟 再将参数设为空
        //                一个5秒schld 空方法
        }

public void ubuntu3(){
    OperatingSystemMXBean osmxb = (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
    // 物理内存（内存条）
    long physicalMemorySize = osmxb.getTotalPhysicalMemorySize();
    System.out.println("物理内存：" + physicalMemorySize / 1024.0 / 1024.0);
    // 剩余的物理内存
    long freePhysicalMemorySize = osmxb.getFreePhysicalMemorySize();
    System.out.println("总  的  内 存" + Math.round(physicalMemorySize / 1024.0 / 1024.0));
    System.out.println("总  的  内 存" + Math.round(physicalMemorySize / 1024.0 / 1024.0));
    System.out.println("使用的内存" + Math.round((physicalMemorySize - freePhysicalMemorySize) / 1024.0 / 1024.0));
    Double compare = (Double) (1 - freePhysicalMemorySize * 1.0 / physicalMemorySize) * 100;
    String str = "内存已使用:" + compare.intValue() + "%";
    System.out.println(str);
    long time = System.currentTimeMillis();
    LinuxUtils linuxUtils = new LinuxUtils();
    //获取df
    System.out.println(linuxUtils.getDeskInfo());
    //获得free命令的信息
    System.out.println(linuxUtils.getRamInfo());

    System.out.println(linuxUtils.getCPUInfo());
    //System.out.println(linuxUtils.getCPUInfoByTop());
    System.out.println("消耗时间:" + (System.currentTimeMillis() - time) / 1000.0 + "秒");
}

    //@Scheduled(every = "2s")
    public String ubuntu2() {
        String data = "";
        try {
            Runtime rt = Runtime.getRuntime();
            Process p = rt.exec("df -hl");
            BufferedReader in = null;
            try {
                in = new BufferedReader(new InputStreamReader(p.getInputStream()));
                String str = null;
                String[] strArray = null;
                int line = 0;
                while ((str = in.readLine()) != null) {
                    line++;
                    if (line != 2) {
                        continue;
                    }
                    int m = 0;
                    strArray = str.split(" ");
                    for (String para : strArray) {
                        if (para.trim().length() == 0)
                            continue;
                        ++m;
                        if (para.endsWith("G") || para.endsWith("Gi")) {
                            // 目前的服务器
                            if (m == 2) {
//                                System.out.println("总"+para);
                                data = data + "总" + para;
                            }
                            if (m == 3) {
//                                System.out.println("已使用"+para);
                                data = data + "已使用" + para;
                            }
                        }
                        if (para.endsWith("%")) {
                            if (m == 5) {
//                                System.out.println("使用 "+para);
                                data = data + "使用 " + para;
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                in.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }




}
