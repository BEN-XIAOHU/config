package bean;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

public class Util {
    public static List<Host> getLocalIPList() {
        List<Host> ipList = new ArrayList<Host>();
        try {
            //返回此计算机上所有网络接口
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            NetworkInterface networkInterface;
            Enumeration<InetAddress> inetAddresses;
            InetAddress inetAddress;
            String ip;

            while (networkInterfaces.hasMoreElements()) {
                networkInterface = networkInterfaces.nextElement();
                //返回该网口绑定的ip地址
                inetAddresses = networkInterface.getInetAddresses();
                while (inetAddresses.hasMoreElements()) {
                    inetAddress = inetAddresses.nextElement();
                    if (inetAddress != null && inetAddress instanceof Inet4Address) { // IPV4
                        Host host=new Host();
                        ip = inetAddress.getHostAddress();
                        host.setIp(ip);
                        try {
                            host.setMac(getMACAddress(inetAddress));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (!host.getIp().equals("127.0.0.1"))
                        ipList.add(host);
                    }
                }
            }
        } catch (SocketException e) {
            e.printStackTrace();
        }
        return ipList;
    }
    public static String getMACAddress(InetAddress ia)throws Exception{
        //获得网络接口对象（即网卡），并得到mac地址，mac地址存在于一个byte数组中。
        byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
        if(mac==null)
            return null;
        //下面代码是把mac地址拼装成String
        StringBuffer sb = new StringBuffer();

        for(int i=0;i<mac.length;i++){
            if(i!=0){
                sb.append("-");
            }
            //mac[i] & 0xFF 是为了把byte转化为正整数
            String s = Integer.toHexString(mac[i] & 0xFF);
            sb.append(s.length()==1?0+s:s);
        }

        //把字符串所有小写字母改为大写成为正规的mac地址并返回
        return sb.toString().toUpperCase();
    }
}
