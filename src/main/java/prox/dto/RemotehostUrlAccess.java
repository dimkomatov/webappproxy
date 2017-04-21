package prox.dto;

public class RemotehostUrlAccess {

    private String remotehost;

    private String url;

    public String getRemotehost() {
        return remotehost;
    }

    public void setRemotehost(String remotehost) {
        this.remotehost = remotehost;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public RemotehostUrlAccess(String remotehost, String url) {
        this.remotehost = remotehost;
        this.url = url;
    }

    public RemotehostUrlAccess() {
    }
}
