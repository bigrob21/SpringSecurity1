package com.paul.robert.model.users;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
@Table
@Entity
public class Role implements GrantedAuthority {
	
	private static final long serialVersionUID = 5779746141664037691L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id; 
	@Column(name="name")
	private String authority; 
		
}
