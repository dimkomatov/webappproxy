package prox.dto;

public class Url2Count {
    private String url;

    private Integer count1;

    private Integer count2;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getCount1() {
        return count1;
    }

    public void setCount1(Integer count1) {
        this.count1 = count1;
    }

    public Integer getCount2() {
        return count2;
    }

    public void setCount2(Integer count2) {
        this.count2 = count2;
    }

    public Url2Count(String url, Integer count1, Integer count2) {
        this.url = url;
        this.count1 = count1;
        this.count2 = count2;
    }

    public Url2Count(){}
}
