package sample.data.rest.domain;

/**
 * Created by zhongwei on 23/12/2016.
 */
import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;


    @Id
    @GeneratedValue
    private Long id;

    protected String number;

    @Column(name = "name")
    protected String owner;

    protected BigDecimal balance;

    /**
     * Default constructor for JPA only.
     */
    protected Account() {
        balance = BigDecimal.ZERO;
    }

    public Account(String number, String owner) {
        this.number = number;
        this.owner = owner;
        balance = BigDecimal.ZERO;
    }

    public long getId() {
        return id;
    }

    public String getNumber() {
        return number;
    }

    protected void setNumber(String accountNumber) {
        this.number = accountNumber;
    }

    public String getOwner() {
        return owner;
    }

    protected void setOwner(String owner) {
        this.owner = owner;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void withdraw(BigDecimal amount) {
       balance.subtract(amount);
    }

    public void deposit(BigDecimal amount) {
        balance.add(amount);
    }

    @Override
    public String toString() {
        return number + " [" + owner + "]: $" + balance;
    }

}
