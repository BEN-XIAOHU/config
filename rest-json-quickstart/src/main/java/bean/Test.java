package bean;

import com.sun.management.OperatingSystemMXBean;

import java.io.File;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.lang.management.ManagementFactory;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Test {
    private static final int CPUTIME=500;
    private static final int PERCENT=100;
    private static final int  FAULTLENGTH=10;



    public static void main(String[] args) throws InterruptedException {
            String c="22";
            String a="";
            String[] b=new String[] {c,a};
        System.out.println(Arrays.toString(b));
//        String a;
//        char c='e';
//        c= (char) (c-32);
//        System.out.println(c);

//        User user=new User();
//        System.out.println(user);

//        List<ServiceStatus> serviceStatuses=new ArrayList<>();
//        ServiceStatus service1=new ServiceStatus();
//        service1.setName("HikvisionAdapterService");
//        service1.setStatus("close");
//        service1.setVersion("0.1");
//        service1.setRestartTimes(0);
//        service1.setTime(getTime());
//        System.out.println(service1);
//        serviceStatuses.add(service1);
//        System.out.println(serviceStatuses);
//        service1=new ServiceStatus();
//        service1.setName("ConfigurationService");
//        service1.setStatus("close");
//        service1.setVersion("0.0");
//        service1.setRestartTimes(0);
//        service1.setTime(getTime());
//
//        System.out.println(service1);
//        serviceStatuses.add(service1);
//
//        System.out.println(serviceStatuses);
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        Long l=new Long("1623390077300");
//        System.out.println(simpleDateFormat.format(new Date(l)));


//    User user=new User();
//    user.setUsername("hub_likongyanfabu1");
//    user.setPassword("2bzjv36e88hh4390");
//        TestController testController=new TestController();
//        try {
//            System.out.println(testController.test1(user));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        Object a="open";
//        if (!a.toString().equals("open"))
//        {
//            System.out.println(11);
//        }
//        String a="null";
//        System.out.println(!a.equals("null"));

//        YamlConfigs yamlConfigs=new YamlConfigs();
//        String file="E:\\test\\test.yaml";
//        Map<String,Object> y=yamlConfigs.getYamlToMap(file);
//        for (String key : y.keySet()) {
//            System.out.println(key);
//            for (Object value :  ((Map<String,Object>)y.get(key)).values()){
//                System.out.println(value);
//            }
//
//
//        }
//        yamlConfigs.updateYaml("Hikvision.status","close",file);
//        System.out.println(y);
//        YamlConfigs yamlConfigs=new YamlConfigs();
//        try {
//            yamlConfigs.initYamltoService("E:\\test\\test.yaml");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        File file=new File("E:\\test\\test.yaml");
//        System.out.println(file.exists());
        //ServiceUtil.getServiceConfig();
//        Date date = new Date();
//        SystemInfo systemInfo=new SystemInfo();
//        CentralProcessor processor = systemInfo.getHardware().getProcessor();
//        System.out.println(processor.getProcessorIdentifier().getName());

        // 使用 toString() 函数显示日期时间
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        String time=simpleDateFormat.format(date);
//        System.out.println(time);
//        SystemInfo si = new SystemInfo();
//
//        HardwareAbstractionLayer hal = si.getHardware();
//        OperatingSystem os = si.getOperatingSystem();
//
//        System.out.println(os);
//        HostInfo hostInfo=new HostInfo();
//        //System.out.println(os.getVersion());
//        System.out.println(os.getBitness());
//        System.out.println(os.getFileSystem());
//        System.out.println(os.getFamily());
//        System.out.println(os);

//        List<Host> ip = Util.getLocalIPList();
//        System.out.println("本机Ip为："+ip);
//        System.out.println(getCpuRatioForWindows());
//        System.out.println(getMemery());
//        System.out.println(getDisk());



    }
    //获取内存使用率
    public static String getMemery(){
        OperatingSystemMXBean osmxb = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
        // 总的物理内存+虚拟内存
        long totalvirtualMemory = osmxb.getTotalSwapSpaceSize();
        // 剩余的物理内存
        long freePhysicalMemorySize = osmxb.getFreePhysicalMemorySize();
        Double compare=(Double)(1-freePhysicalMemorySize*1.0/totalvirtualMemory)*100;
        String str="内存已使用:"+compare.intValue()+"%";
        return str;
    }

    //获取文件系统使用率
    public static List<String> getDisk() {
        // 操作系统
        List<String> list=new ArrayList<String>();
        for (char c = 'A'; c <= 'Z'; c++) {
            String dirName = c + ":/";
            File win = new File(dirName);
            if(win.exists()){
                long total=(long)win.getTotalSpace();
                long free=(long)win.getFreeSpace();
                Double compare=(Double)(1-free*1.0/total)*100;
                String str=c+":盘  已使用 "+compare.intValue()+"%";
                list.add(str);
            }
        }
        return list;
    }

    //获得cpu使用率
    public static String getCpuRatioForWindows() {
        try {
            String procCmd = System.getenv("windir") + "//system32//wbem//wmic.exe process get Caption,CommandLine,KernelModeTime,ReadOperationCount,ThreadCount,UserModeTime,WriteOperationCount";
            // 取进程信息
            long[] c0 = readCpu(Runtime.getRuntime().exec(procCmd));
            Thread.sleep(CPUTIME);
            long[] c1 = readCpu(Runtime.getRuntime().exec(procCmd));
            if (c0 != null && c1 != null) {
                long idletime = c1[0] - c0[0];
                long busytime = c1[1] - c0[1];
                return "CPU使用率:"+Double.valueOf(PERCENT * (busytime)*1.0 / (busytime + idletime)).intValue()+"%";
            } else {
                return "CPU使用率:"+0+"%";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return "CPU使用率:"+0+"%";
        }
    }


    //读取cpu相关信息
    private static long[] readCpu(final Process proc) {
        long[] retn = new long[2];
        try {
            proc.getOutputStream().close();
            InputStreamReader ir = new InputStreamReader(proc.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            String line = input.readLine();
            if (line == null || line.length() < FAULTLENGTH) {
                return null;
            }
            int capidx = line.indexOf("Caption");
            int cmdidx = line.indexOf("CommandLine");
            int rocidx = line.indexOf("ReadOperationCount");
            int umtidx = line.indexOf("UserModeTime");
            int kmtidx = line.indexOf("KernelModeTime");
            int wocidx = line.indexOf("WriteOperationCount");
            long idletime = 0;
            long kneltime = 0;
            long usertime = 0;
            while ((line = input.readLine()) != null) {
                if (line.length() < wocidx) {
                    continue;
                }
                // 字段出现顺序：Caption,CommandLine,KernelModeTime,ReadOperationCount,
                // ThreadCount,UserModeTime,WriteOperation
                String caption =substring(line, capidx, cmdidx - 1).trim();
                String cmd = substring(line, cmdidx, kmtidx - 1).trim();
                if (cmd.indexOf("wmic.exe") >= 0) {
                    continue;
                }
                String s1 = substring(line, kmtidx, rocidx - 1).trim();
                String s2 = substring(line, umtidx, wocidx - 1).trim();
                System.out.println(s2);
                if (caption.equals("System Idle Process") || caption.equals("System")) {
                    if (s1.length() > 0)
                        idletime += Long.valueOf(s1).longValue();
                    if (s2.length() > 0)
                        idletime += Long.valueOf(s2).longValue();
                    continue;
                }
                if (s1.length() > 0)
                    kneltime += Long.valueOf(s1).longValue();
                if (s2.length() > 0)
                    usertime += Long.valueOf(s2).longValue();
            }
            retn[0] = idletime;
            retn[1] = kneltime + usertime;
            return retn;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                proc.getInputStream().close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 由于String.subString对汉字处理存在问题（把一个汉字视为一个字节)，因此在 包含汉字的字符串时存在隐患，现调整如下：
     * @param src 要截取的字符串
     * @param start_idx 开始坐标（包括该坐标)
     * @param end_idx 截止坐标（包括该坐标）
     * @return
     */
    private static String substring(String src, int start_idx, int end_idx) {
        byte[] b = src.getBytes();
        String tgt = "";
        for (int i = start_idx; i <= end_idx; i++) {
            tgt += (char) b[i];
        }
        return tgt;
    }

    public static String getMACAddress(InetAddress ia)throws Exception{
        //获得网络接口对象（即网卡），并得到mac地址，mac地址存在于一个byte数组中。
        byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();

        //下面代码是把mac地址拼装成String
        StringBuffer sb = new StringBuffer();

        for(int i=0;i<mac.length;i++){
            if(i!=0){
                sb.append("-");
            }
            //mac[i] & 0xFF 是为了把byte转化为正整数
            String s = Integer.toHexString(mac[i] & 0xFF);
            System.out.println("--------------");
            System.err.println(s);
            sb.append(s.length()==1?0+s:s);
        }

        //把字符串所有小写字母改为大写成为正规的mac地址并返回
        return sb.toString().toUpperCase();
    }
    public static String getTime()
    {
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return simpleDateFormat.format(date);
    }
}
