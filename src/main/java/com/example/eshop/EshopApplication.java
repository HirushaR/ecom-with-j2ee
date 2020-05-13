package com.example.eshop;

import com.example.eshop.model.Product;
import com.example.eshop.model.Tag;
import com.example.eshop.repository.ProductRepository;
import com.example.eshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories(basePackageClasses = UserRepository.class)
@SpringBootApplication
public class EshopApplication implements CommandLineRunner {

    @Autowired
    private ProductRepository productRepository;

    public static void main(String[] args) {
        SpringApplication.run(EshopApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
//        Product product = new Product("huawei nova 5t ","this is a Huwawei nova 5t","Brand new phone with a charger");
//        Tag tag1 = new Tag("phone");
//        Tag tag2 = new Tag("huawei");
//
//        product.getTags().add(tag1);
//        product.getTags().add(tag2);
//
//        tag1.getProducts().add(product);
//        tag2.getProducts().add(product);
//
//        this.productRepository.save(product);
    }
}
