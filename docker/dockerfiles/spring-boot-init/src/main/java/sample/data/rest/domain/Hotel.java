
package sample.data.rest.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.NaturalId;

@Entity
public class Hotel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne(optional = false)
	@NaturalId
	private City city;

	@Column(nullable = false)
	@NaturalId
	private String name;

	@Column(nullable = false)
	private String address;

	@Column(nullable = false)
	private String zip;

	protected Hotel() {
	}

	public Hotel(City city, String name) {
		this.city = city;
		this.name = name;
	}

	public City getCity() {
		return this.city;
	}

	public String getName() {
		return this.name;
	}

	public String getAddress() {
		return this.address;
	}

	public String getZip() {
		return this.zip;
	}
}
