package bean;

import java.io.Serializable;

public class ServiceStatus implements Serializable {
    public String name;
    public String status;
    public String version;
    public String time;
    public Integer restartTimes;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getRestartTimes() {
        return restartTimes;
    }

    public void setRestartTimes(Integer restartTimes) {
        this.restartTimes = restartTimes;
    }

    @Override
    public String toString() {
        return "ServiceStatus{" +
                "name='" + name + '\'' +
                ", status='" + status + '\'' +
                ", version='" + version + '\'' +
                ", time='" + time + '\'' +
                ", restartTimes=" + restartTimes +
                '}';
    }
}
