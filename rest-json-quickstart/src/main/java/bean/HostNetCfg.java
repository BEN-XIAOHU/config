package bean;

public class HostNetCfg {
    public String hubIp;
    public String hubGateway;
    public String hubNetmask;
    public String hubFirstDns;
    public String hubReserveDns;
    public Boolean hubDhcp;
    public String hubMac;

    public String getHubIp() {
        return hubIp;
    }

    public void setHubIp(String hubIp) {
        this.hubIp = hubIp;
    }

    public String getHubGateway() {
        return hubGateway;
    }

    public void setHubGateway(String hubGateway) {
        this.hubGateway = hubGateway;
    }

    public String getHubNetmask() {
        return hubNetmask;
    }

    public void setHubNetmask(String hubNetmask) {
        this.hubNetmask = hubNetmask;
    }

    public String getHubFirstDns() {
        return hubFirstDns;
    }

    public void setHubFirstDns(String hubFirstDns) {
        this.hubFirstDns = hubFirstDns;
    }

    public String getHubReserveDns() {
        return hubReserveDns;
    }

    public void setHubReserveDns(String hubReserveDns) {
        this.hubReserveDns = hubReserveDns;
    }

    public Boolean getHubDhcp() {
        return hubDhcp;
    }

    public void setHubDhcp(Boolean hubDhcp) {
        this.hubDhcp = hubDhcp;
    }

    public String getHubMac() {
        return hubMac;
    }

    public void setHubMac(String hubMac) {
        this.hubMac = hubMac;
    }
}
