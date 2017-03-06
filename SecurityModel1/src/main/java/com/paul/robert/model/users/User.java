package com.paul.robert.model.users;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name="users")
@JsonIgnoreProperties(ignoreUnknown=true)
public class User implements UserDetails, CredentialsContainer {
	
	private static final long serialVersionUID = 1069958132736171825L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Getter @Setter
	private Long id; 
	@Getter @Setter
	@Column(name="user_name")
	private String username;
	@Getter @Setter
	private String subject;
	@Getter @Setter
	private String sid; 
	
	@Getter @Setter
	private String password;
	@Getter @Setter
	@Column(name="is_enabled")
	private boolean enabled = true;
	@Getter @Setter
	@Column(name="is_account_non_expired")
	private boolean accountNonExpired = false;
	@Getter @Setter
	@Column(name="is_account_non_locked")
	private boolean accountNonLocked = true;
	@Getter @Setter
	@Column(name="is_credential_non_expired")
	private boolean credentialsNonExpired = false;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinTable(name="user_roles", 
			   joinColumns={@JoinColumn(name="user_id", referencedColumnName="id")}, 
			   inverseJoinColumns={@JoinColumn(name="role_id", referencedColumnName="id")})
	@Getter @Setter
	private Collection<Role> authorities = new ArrayList<>();

	@Override
	public void eraseCredentials() {
		//In Spring the default User class simply sets the password to null
		this.password = null;
	} 

	//TODO: Org Team Assignments
	
}