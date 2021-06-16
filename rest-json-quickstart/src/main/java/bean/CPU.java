package bean;

import java.io.Serializable;

public class CPU implements Serializable {
    public Integer cpuId;
    public Integer mhz;
    public String vendor;
    public String model;
    public String user;//用户使用率
    public String sys;//系统使用率
    public String idle;//空闲率
    public String used;//使用率
    public String count;

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public Integer getCpuId() {
        return cpuId;
    }

    public void setCpuId(Integer cpuId) {
        this.cpuId = cpuId;
    }

    public Integer getMhz() {
        return mhz;
    }

    public void setMhz(Integer mhz) {
        this.mhz = mhz;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getSys() {
        return sys;
    }

    public void setSys(String sys) {
        this.sys = sys;
    }

    public String getIdle() {
        return idle;
    }

    public void setIdle(String idle) {
        this.idle = idle;
    }

    public String getUsed() {
        return used;
    }

    public void setUsed(String used) {
        this.used = used;
    }
}
