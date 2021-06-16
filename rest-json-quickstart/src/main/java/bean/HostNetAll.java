package bean;

import java.io.Serializable;

public class HostNetAll implements Serializable {
    public String ip;
    public String mac;
    public String name;
    public String type;
    public String gateway4;
    public String PrimaryDns;
    public String SecondDns;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGateway4() {
        return gateway4;
    }

    public void setGateway4(String gateway4) {
        this.gateway4 = gateway4;
    }

    public String getPrimaryDns() {
        return PrimaryDns;
    }

    public void setPrimaryDns(String primaryDns) {
        PrimaryDns = primaryDns;
    }

    public String getSecondDns() {
        return SecondDns;
    }

    public void setSecondDns(String secondDns) {
        SecondDns = secondDns;
    }
}
