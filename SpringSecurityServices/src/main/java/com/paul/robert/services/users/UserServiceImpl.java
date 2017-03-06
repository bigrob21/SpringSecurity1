package com.paul.robert.services.users;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.paul.robert.domain.User;
import com.paul.robert.repository.users.RoleRepository;
import com.paul.robert.repository.users.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService, RoleService, UserRoleService, UserDetailsService {

	@Inject
	private UserRepository userRepo;
	@Inject
	private RoleRepository roleRepo;
	
	@Override
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userRepo.findByUsername(username);
	}

	@Override
	@Transactional(readOnly=true)
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}

}
