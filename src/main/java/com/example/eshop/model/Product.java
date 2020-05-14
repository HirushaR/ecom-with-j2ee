package com.example.eshop.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    private String description;
    private String details;
    private String category;
    private String image;
    private double price;
    private Date created_date = new Date();
    private int quantity;
    @ManyToMany( cascade = CascadeType.ALL)
    @JoinTable(name = "prod_tag",
     joinColumns = {@JoinColumn(name = "product_id",updatable = false)},
     inverseJoinColumns = {@JoinColumn(name = "tag_id", updatable = false)})
    //private Set<Tag> tags = new HashSet<>();
    private List<Tag> tags = new ArrayList<>();

    public Product(String name, String description, String details) {
        this.name = name;
        this.description = description;
        this.details = details;
    }

    public Product()
    {}


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
