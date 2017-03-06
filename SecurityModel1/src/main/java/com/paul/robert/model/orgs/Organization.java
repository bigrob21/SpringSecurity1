package com.paul.robert.model.orgs;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Table(name="")
@Entity
@JsonIgnoreProperties(ignoreUnknown=true)
public class Organization {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Getter @Setter
	private Long id; 
	@Getter @Setter
	@Column(name="name")
	private String name;

	@JsonIgnore
	@Getter @Setter
	@ManyToOne(fetch=FetchType.LAZY)
	private Organization parent;
	
	@JsonIgnore
	@Getter @Setter
	@OneToMany(mappedBy="parent", fetch=FetchType.LAZY)
	private List<Organization> children = new ArrayList<>();
	
	
}
