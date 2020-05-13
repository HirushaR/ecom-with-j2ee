package com.example.eshop.repository;

import com.example.eshop.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByPriceGreaterThan(double i);

    List<Product> findTop3ByPriceLessThan(double i);

    List<Product> findByCategory(String s);

    List<Product> findTop10ById(int id);

    List<Product> findTop3ByCategory(String phone);
}
