package bean;

import org.apache.commons.lang3.StringUtils;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.hardware.NetworkIF;
import oshi.software.os.FileSystem;
import oshi.software.os.OSFileStore;
import oshi.software.os.OperatingSystem;
import oshi.util.FormatUtil;

import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class OSHIUntil {

    public static HubInfoRun getHubInfoRun() {
        HubInfoRun hubInfoRun=new HubInfoRun();
        HostInfo hostInfo= null;
        try {
            hostInfo = findHostInfo();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        hubInfoRun.setHubCpuUsePercent(hostInfo.getCpu().getUsed());
        hubInfoRun.setHubDiskUsed(hostInfo.getDisk().getUsed());
        hubInfoRun.setHubDiskUsePercent(hostInfo.getDisk().getUsePercent());
        hubInfoRun.setHubMemoryUsed(hostInfo.getMemory().getMemUsed());
        hubInfoRun.setHubMemoryUsePercent(hostInfo.getMemory().getMemUsedPercent());
        return hubInfoRun;
    }


    public static HubInfo getHubInfo() {
        HubInfo hubInfo=new HubInfo();
        HostInfo hostInfo= null;
        try {
            hostInfo = findHostInfo();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        hubInfo.setHubCpuCore(hostInfo.getCpu().getCount());//核数
        hubInfo.setHubCpuModel(hostInfo.getCpu().getModel());
        hubInfo.setHubDiskTotal(hostInfo.getDisk().getTotal());
        hubInfo.setHubOsArch(hostInfo.getOs().getArch());
        hubInfo.setHubOsVersion(hostInfo.getOs().getVersion());
        hubInfo.setHubMacAddress(printNetworkInterfaces().mac);
        hubInfo.setHubMemoryTotal(hostInfo.getMemory().getMemTotal());
        return hubInfo;
    }

    public static  HostInfo findHostInfo() throws InterruptedException {
        SystemInfo si = new SystemInfo();

        //HardwareAbstractionLayer hal = si.getHardware();
        OperatingSystem os = si.getOperatingSystem();

        HostInfo hostInfo=new HostInfo();
        OS os1=new OS();
        os1.setArch(Integer.toString(os.getBitness()));
        os1.setVersion(os.toString());
        hostInfo.setOs(os1);
        hostInfo.setCpu(printlnCpuInfo(si));
        hostInfo.setMemory(MemInfo());
        hostInfo.setDisk(printFileSystem(os.getFileSystem()));

        return hostInfo;
    }
    private static Disk printFileSystem(FileSystem fileSystem) {
       // OSFileStore[] fsArray = fileSystem.getFileStores();3.9
        List<OSFileStore> fsArray=fileSystem.getFileStores();
        long count=0;
        long countfree=0;
        for (OSFileStore fs : fsArray) {
            long usable = fs.getUsableSpace();//可用
            countfree=countfree+usable;
            long total = fs.getTotalSpace();
            count=count+total;
            long used=total-usable;
//            System.out.println("磁盘name:"+fs.getMount());
//            System.out.println("类型："+fs.getType());
//            System.out.println("名字："+fs.getName());
//            System.out.println("总共："+ FormatUtil.formatBytes(total));
//            System.out.println("已使用："+ FormatUtil.formatBytes(used));
//            System.out.println("free："+ FormatUtil.formatBytes(usable));
//            if (total!=0)
//            System.out.println("使用率："+100*used/total+"%");
//            System.out.format(
//                    " %s (%s) [%s] %s of %s free (%.1f%%) is %s "
//                            + (fs.getLogicalVolume() != null && fs.getLogicalVolume().length() > 0 ? "[%s]" : "%s")
//                            + " and is mounted at %s%n",
//                    fs.getName(), fs.getDescription().isEmpty() ? "file system" : fs.getDescription(), fs.getType(),
//                    FormatUtil.formatBytes(usable), FormatUtil.formatBytes(fs.getTotalSpace()), 100d * usable / total,
//                    fs.getVolume(), fs.getLogicalVolume(), fs.getMount());

        }
        Disk disk=new Disk();
        disk.setUsed(FormatUtil.formatBytes(count-countfree));
        disk.setTotal(FormatUtil.formatBytes(count));
        disk.setUsePercent(100*(count-countfree)/count+"%");
//        System.out.println("共计"+FormatUtil.formatBytes(count));
//        System.out.println("空闲"+FormatUtil.formatBytes(count-countfree));
//        System.out.println("空闲"+FormatUtil.formatBytes(countfree));
//        System.out.println("使用率："+100*(count-countfree)/count+"%");
        return disk;
    }
    public static Memory MemInfo(){
        Memory memory1=new Memory();
        System.out.println("----------------主机内存信息----------------");
        SystemInfo systemInfo = new SystemInfo();
        GlobalMemory memory = systemInfo.getHardware().getMemory();
        //总内存
        long totalByte = memory.getTotal();
        //剩余
        long acaliableByte = memory.getAvailable();
//        System.out.println("总内存 = " + formatByte(totalByte));
//        System.out.println("使用" + formatByte(totalByte-acaliableByte));
//        System.out.println("剩余内存 = " + formatByte(acaliableByte));
//        System.out.println("使用率：" + new DecimalFormat("#.##%").format((totalByte-acaliableByte)*1.0/totalByte));
        memory1.setMemUsed(formatByte(totalByte-acaliableByte));
        memory1.setMemTotal(formatByte(totalByte));
        memory1.setMemUsedPercent(new DecimalFormat("#.##%").format((totalByte-acaliableByte)*1.0/totalByte));
        return memory1;
    }

    public static CPU printlnCpuInfo(SystemInfo systemInfo) throws InterruptedException {
        //System.out.println("----------------cpu信息----------------");

        CentralProcessor processor = systemInfo.getHardware().getProcessor();
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        // 睡眠1s
        TimeUnit.SECONDS.sleep(1);
        long[] ticks = processor.getSystemCpuLoadTicks();
        long nice = ticks[CentralProcessor.TickType.NICE.getIndex()] - prevTicks[CentralProcessor.TickType.NICE.getIndex()];
        long irq = ticks[CentralProcessor.TickType.IRQ.getIndex()] - prevTicks[CentralProcessor.TickType.IRQ.getIndex()];
        long softirq = ticks[CentralProcessor.TickType.SOFTIRQ.getIndex()] - prevTicks[CentralProcessor.TickType.SOFTIRQ.getIndex()];
        long steal = ticks[CentralProcessor.TickType.STEAL.getIndex()] - prevTicks[CentralProcessor.TickType.STEAL.getIndex()];
        long cSys = ticks[CentralProcessor.TickType.SYSTEM.getIndex()] - prevTicks[CentralProcessor.TickType.SYSTEM.getIndex()];
        long user = ticks[CentralProcessor.TickType.USER.getIndex()] - prevTicks[CentralProcessor.TickType.USER.getIndex()];
        long iowait = ticks[CentralProcessor.TickType.IOWAIT.getIndex()] - prevTicks[CentralProcessor.TickType.IOWAIT.getIndex()];
        long idle = ticks[CentralProcessor.TickType.IDLE.getIndex()] - prevTicks[CentralProcessor.TickType.IDLE.getIndex()];
        long totalCpu = user + nice + cSys + idle + iowait + irq + softirq + steal;
//        System.out.println("----------------cpu信息----------------");
//        System.out.println("cpu核数:" + processor.getLogicalProcessorCount());
//        System.out.println("cpu系统使用率:" + new DecimalFormat("#.##%").format(cSys * 1.0 / totalCpu));
//        System.out.println("cpu用户使用率:" + new DecimalFormat("#.##%").format(user * 1.0 / totalCpu));
//        System.out.println("cpu当前等待率:" + new DecimalFormat("#.##%").format(iowait * 1.0 / totalCpu));
//        System.out.println("cpu当前使用率:" + new DecimalFormat("#.##%").format(1.0-(idle * 1.0 / totalCpu)));
        CPU cpu=new CPU();
        cpu.setModel(processor.getProcessorIdentifier().getName());
        cpu.setCount(processor.getLogicalProcessorCount()+"");
        cpu.setUsed(new DecimalFormat("#.##%").format(1.0-(idle * 1.0 / totalCpu)));
        return cpu;
    }

    public static Host printNetworkInterfaces() {
        SystemInfo si = new SystemInfo();

        HardwareAbstractionLayer hal = si.getHardware();
        OperatingSystem os = si.getOperatingSystem();
        List<NetworkIF> networkIFs=hal.getNetworkIFs();
        Host host=new Host();
        host.setMac(networkIFs.get(0).getMacaddr());
        host.setIp(StringUtils.strip(Arrays.toString(networkIFs.get(0).getIPv4addr()),"[]"));
        return host;
    }
    public static String formatByte(long byteNumber){
        //换算单位
        double FORMAT = 1024.0;
        double kbNumber = byteNumber/FORMAT;
        if(kbNumber<FORMAT){
            return new DecimalFormat("#.##KB").format(kbNumber);
        }
        double mbNumber = kbNumber/FORMAT;
        if(mbNumber<FORMAT){
            return new DecimalFormat("#.##MB").format(mbNumber);
        }
        double gbNumber = mbNumber/FORMAT;
        if(gbNumber<FORMAT){
            return new DecimalFormat("#.##GB").format(gbNumber);
        }
        double tbNumber = gbNumber/FORMAT;
        return new DecimalFormat("#.##TB").format(tbNumber);
    }
}
