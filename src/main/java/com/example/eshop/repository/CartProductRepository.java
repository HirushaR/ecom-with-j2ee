package com.example.eshop.repository;

import com.example.eshop.model.Cart;
import com.example.eshop.model.CartProduct;
import com.example.eshop.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartProductRepository extends JpaRepository<CartProduct,Integer> {

   List<CartProduct> findByCart(Cart cart);

//   @Query(value = "SELECT * FROM product where id =( SELECT product_id from cart_product where user_id =?)", nativeQuery = true)
//   Product getsum(int id);



}
