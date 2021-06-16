package bean;

public class CloudArg {
    String id;
    String projectId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return "CloudArg{" +
                "id='" + id + '\'' +
                ", projectId='" + projectId + '\'' +
                '}';
    }
}
