package bean;

public class OS {
    public String arch;//架构
    public String venderName;//版本名
    public String venderVersion;//发行号
    public String version;//内核号

    public String getArch() {
        return arch;
    }

    public void setArch(String arch) {
        this.arch = arch;
    }

    public String getVenderName() {
        return venderName;
    }

    public void setVenderName(String venderName) {
        this.venderName = venderName;
    }

    public String getVenderVersion() {
        return venderVersion;
    }

    public void setVenderVersion(String venderVersion) {
        this.venderVersion = venderVersion;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }
}
