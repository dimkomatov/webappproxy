package prox.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

@Entity
public class Account extends TransactionalEntity {

    @NotNull
    private String username;

    public Account() {
    }

    public Account(String userName, String password, Long linkToBase) {
        super();
        this.setUsername(userName);
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}