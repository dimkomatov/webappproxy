package prox.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Store")
public class Store extends TransactionalEntity{

    private static final int serialVersionUID = 1;

    @NotNull
    private String name;

    public Store(){
    }

    public Store(String name){
        super();
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}