package prox.dto;

public class RhBytes {
    private String remotehost;

    private Integer avgBytes;

    public String getRemotehost() {
        return remotehost;
    }

    public void setRemotehost(String remotehost) {
        this.remotehost = remotehost;
    }

    public Integer getAvgBytes() {
        return avgBytes;
    }

    public void setAvgBytes(Integer avgBytes) {
        this.avgBytes = avgBytes;
    }

    public RhBytes(String remotehost, Integer avgBytes) {
        this.remotehost = remotehost;
        this.avgBytes = avgBytes;
    }

    public RhBytes() {
    }
}
