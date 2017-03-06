package com.paul.robert.repository.users;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paul.robert.model.users.User;

public interface UserRepository extends JpaRepository<User, Long> {

	public User findByUsername(String userName);
	
}
