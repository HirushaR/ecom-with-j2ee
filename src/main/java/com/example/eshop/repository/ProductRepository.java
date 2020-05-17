package com.example.eshop.repository;

import com.example.eshop.model.Category;
import com.example.eshop.model.Product;
import com.example.eshop.model.Tag;
import com.example.eshop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {


   // Product findById(int i );

    List<Product> findByPriceGreaterThan(double i);

    List<Product> findTop3ByPriceLessThan(double i);

    List<Product> findByCategory(Category category);

    List<Product> findByUser(User user);

    //List<Product> findByCategory(String s);

    List<Product> findTop10ById(int id);

    List<Product> findTop3ByCategory(Category category);

    List<Product> findAllByCategory(Category category);

    List<Product> findAllByNameContains(String name);

}
