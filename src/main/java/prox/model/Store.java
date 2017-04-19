package prox.model;

import javax.persistence.Entity;
import java.util.Date;

@Entity
public class Store extends TransactionalEntity{

    private static final int serialVersionUID = 1;

    private Date time;
    private String action;
    private String filenum;
    private String http_reply_code;
    private String http_date;
    private String http_last_modified;
    private String http_expires;
    private String http_content_type;
    private Float size;
    private String method;
    private String url;

    public Store(){
    }

    public static int getSerialVersionUID() {
        return serialVersionUID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getHttp_reply_code() {
        return http_reply_code;
    }

    public void setHttp_reply_code(String http_reply_code) {
        this.http_reply_code = http_reply_code;
    }

    public String getHttp_date() {
        return http_date;
    }

    public void setHttp_date(String http_date) {
        this.http_date = http_date;
    }

    public String getHttp_last_modified() {
        return http_last_modified;
    }

    public void setHttp_last_modified(String http_last_modified) {
        this.http_last_modified = http_last_modified;
    }

    public String getHttp_expires() {
        return http_expires;
    }

    public void setHttp_expires(String http_expires) {
        this.http_expires = http_expires;
    }

    public String getHttp_content_type() {
        return http_content_type;
    }

    public void setHttp_content_type(String http_content_type) {
        this.http_content_type = http_content_type;
    }

    public Float getSize() {
        return size;
    }

    public void setSize(Float size) {
        this.size = size;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getFilenum() {
        return filenum;
    }

    public void setFilenum(String filenum) {
        this.filenum = filenum;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}