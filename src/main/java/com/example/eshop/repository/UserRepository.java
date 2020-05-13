package com.example.eshop.repository;

import com.example.eshop.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service
public interface UserRepository extends JpaRepository<User,Integer> {


    Optional<User> findByUserName(String username);
}
