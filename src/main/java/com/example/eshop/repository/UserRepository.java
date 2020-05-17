package com.example.eshop.repository;
import org.springframework.data.jpa.repository.Query;
import com.example.eshop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {

    User findByEmail(String email);
    User findByFirstname(String fnam);
    User findById(int i);

    //@Query(value = "select u.email, r.role from user u inner join user_role ur on (u.id = ur.user_id) inner join role r on (ur.role_id=r.role_id) where u.id=?", nativeQuery = true)
    @Query(value = "SELECT role FROM role where role_id =( SELECT role_id from user_role where user_id =?)", nativeQuery = true)
    String findUserRole(int id);

}
