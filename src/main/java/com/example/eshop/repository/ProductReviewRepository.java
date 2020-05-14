package com.example.eshop.repository;

import com.example.eshop.model.ProductReveiw;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductReviewRepository extends JpaRepository<ProductReveiw,Integer> {


    ProductReveiw findByUserid(int i);

    List<ProductReveiw> findByProductid(int i);

    int countByProductid(int i);

}
