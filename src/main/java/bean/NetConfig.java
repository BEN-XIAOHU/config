package bean;

public class NetConfig {
    private String renderer;
    private String version;
    private NetCards ethernets;

    public String getRenderer() {
        return renderer;
    }

    public void setRenderer(String renderer) {
        this.renderer = renderer;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public NetCards getEthernets() {
        return ethernets;
    }

    public void setEthernets(NetCards ethernets) {
        this.ethernets = ethernets;
    }
}
