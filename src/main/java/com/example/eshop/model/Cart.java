package com.example.eshop.model;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

// entity is indentifier object
@Entity
@Table(name = "cart")
public class Cart {
    @Id
    private int id;


    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "user_id",nullable = false)
    private User user;




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
