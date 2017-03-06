package com.paul.robert.repository.users;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paul.robert.model.users.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

}
