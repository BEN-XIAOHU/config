package bean;

import java.io.Serializable;

public class Host implements Serializable {
    public String ip;
    public String mac;

    public Host() {
    }

    public Host(String ip, String mac) {
        this.ip = ip;
        this.mac = mac;
    }

    @Override
    public String toString() {
        return "Host{" +
                "ip='" + ip + '\'' +
                ", mac='" + mac + '\'' +
                '}';
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }
}
