package com.example.eshop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "cart")
public class Cart {
    @Id
    private int id;
    @Column(name = "product_id")
    private int procuctId;
    @Column(name = "user_id")
    private int userId;
    private int quantity;
    private Date created_at = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProcuctId() {
        return procuctId;
    }

    public void setProcuctId(int procuctId) {
        this.procuctId = procuctId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
