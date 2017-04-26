package prox.dto;

public class UrlCount {
    private String url;

    private Integer urlCount;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getUrlCount() {
        return urlCount;
    }

    public void setUrlCount(Integer urlCount) {
        this.urlCount = urlCount;
    }

    public UrlCount(String url, Integer urlCount) {
        this.url = url;
        this.urlCount = urlCount;
    }
}
