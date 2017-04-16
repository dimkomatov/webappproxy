package prox.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.Set;

@Entity
public class Account extends TransactionalEntity {

    @NotNull
    private String username;

    @NotNull
    private String password;

    @NotNull
    private Boolean adminFlag;

    public Account() {

    }

    public Account(String userName, String password, Long linkToBase) {
        super();
        this.setUsername(userName);
        this.setPassword(password);
    }

    public Account (Integer id, String userName, String password, Long linkToBase ) {
        super();
        this.setId(id);
        this.setUsername(userName);
        this.setPassword(password);
    }

    public Account(String username, String password, Date passwd_date, Long linkToBase) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @JsonIgnore
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public Boolean getAdminFlag() {
        return adminFlag;
    }

    public void setAdminFlag(Boolean adminFlag) {
        this.adminFlag = adminFlag;
    }
}