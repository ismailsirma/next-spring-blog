package com.sirma.blog.repositories;

import com.sirma.blog.models.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long>{
    
}
