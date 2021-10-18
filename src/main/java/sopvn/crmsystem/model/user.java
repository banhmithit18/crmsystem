package sopvn.crmsystem.model;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "employee")
@EntityListeners(AuditingEntityListener.class)
public class user {
	private int user_id;
	private String userFullname;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private String username;
	private String password;
	private String userType;
	private boolean userStatus;

	// join service calendar
	private Set<servicecalendar> servicecalendar;

	// join service calendar
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	public Set<servicecalendar> getServicecalendar() {
		return servicecalendar;
	}

	public void setServicecalendar(Set<servicecalendar> servicecalendar) {
		this.servicecalendar = servicecalendar;
	}

	private List<contract> contract;

	// join contract;
	@OneToMany(mappedBy = "user")
	public List<contract> getContract() {
		return contract;
	}

	public void setContract(List<contract> contract) {
		this.contract = contract;
	}

	@Column(name = "user_status", nullable = true)
	public boolean getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(boolean userStatus) {
		this.userStatus = userStatus;
	}

	@Column(name = "user_type", nullable = true)
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Column(name = "password", nullable = true)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "username", nullable = true)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "user_address", nullable = true)
	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	@Column(name = "user_email", nullable = true)
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "user_phone", nullable = true)
	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	@Column(name = "user_fullname", nullable = true)
	public String getUserFullname() {
		return userFullname;
	}

	public void setUserFullname(String userFullname) {
		this.userFullname = userFullname;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int id) {
		this.user_id = id;
	}

}
