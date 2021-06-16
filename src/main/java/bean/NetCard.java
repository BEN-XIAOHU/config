package bean;

public class NetCard {
    private String dhcp4;
    private String addresses;
    private String gateway4;
    private Dns nameservers;

    public String getDhcp4() {
        return dhcp4;
    }

    public void setDhcp4(String dhcp4) {
        this.dhcp4 = dhcp4;
    }

    public String getAddresses() {
        return addresses;
    }

    public void setAddresses(String addresses) {
        this.addresses = addresses;
    }

    public String getGateway4() {
        return gateway4;
    }

    public void setGateway4(String gateway4) {
        this.gateway4 = gateway4;
    }

    public Dns getNameservers() {
        return nameservers;
    }

    public void setNameservers(Dns nameservers) {
        this.nameservers = nameservers;
    }
}
