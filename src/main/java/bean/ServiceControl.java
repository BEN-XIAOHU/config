package bean;

public class ServiceControl {
    public String control;

    public String getControl() {
        return control;
    }

    public void setControl(String control) {
        this.control = control;
    }

    @Override
    public String toString() {
        return "ServiceControl{" +
                "control='" + control + '\'' +
                '}';
    }
}
