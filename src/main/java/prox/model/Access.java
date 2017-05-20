package prox.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name="access")
public class Access extends TransactionalEntity {

    private static final int serialVersionUID = 1;
    private Date time;
    private Float elapse;
    private String remotehost;
    private String country;
    private String city;
    private String code;
    private Integer bytes;
    private String method;
    private String url;
    private String url_0;
    private String rfc931;
    private String hierarchy_peerhost;
    private String hierarchy_peerhost_1;
    private String type;

    public Access() {
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Float getElapse() {
        return elapse;
    }

    public void setElapse(Float elapse) {
        this.elapse = elapse;
    }

    public String getRemotehost() {
        return remotehost;
    }

    public void setRemotehost(String remotehost) {
        this.remotehost = remotehost;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getBytes() {
        return bytes;
    }

    public void setBytes(Integer bytes) {
        this.bytes = bytes;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUrl() {
        return url;
    }

    public String getUrl_0() {
        return url_0;
    }

    public void setUrl_0(String url_0) {
        this.url_0 = url_0;
    }

    public String getHierarchy_peerhost_1() {
        return hierarchy_peerhost_1;
    }

    public void setHierarchy_peerhost_1(String hierarchy_peerhost_1) {
        this.hierarchy_peerhost_1 = hierarchy_peerhost_1;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRfc931() {
        return rfc931;
    }

    public void setRfc931(String rfc931) {
        this.rfc931 = rfc931;
    }

    public String getHierarchy_peerhost() {
        return hierarchy_peerhost;
    }

    public void setHierarchy_peerhost(String hierarchy_peerhost) {
        this.hierarchy_peerhost = hierarchy_peerhost;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}