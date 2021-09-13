package sopvn.crmsystem.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "contact")
@EntityListeners(AuditingEntityListener.class)
public class contact {
	private int contact_id;
	private String contactName;
	private int contactAge;
	private String contactJob;
	private String contactEmail;
	private String contactAddress;
	private String contactPhone;
	private int accountId;

	List<campaignmember> campaignmember;
	private account account;
	
	//join account 
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public account getAccount() {
		return account;
	}

	public void setAccount(account account) {
		this.account = account;
	}

	// join campaignmember
	@OneToMany(mappedBy = "contact",fetch= FetchType.EAGER)
	public List<campaignmember> getCampaignmember() {
		return campaignmember;
	}

	public void setCampaignmember(List<campaignmember> campaignmember) {
		this.campaignmember = campaignmember;
	}

	@Column(name = "account_id", nullable = true)
	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	@Column(name = "contact_phone", nullable = true)
	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	@Column(name = "contact_address", nullable = true)
	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	@Column(name = "contact_email", nullable = true)
	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	@Column(name = "contact_job", nullable = true)
	public String getContactJob() {
		return contactJob;
	}

	public void setContactJob(String contactJob) {
		this.contactJob = contactJob;
	}

	@Column(name = "contact_age", nullable = true)
	public int getContactAge() {
		return contactAge;
	}

	public void setContactAge(int contactAge) {
		this.contactAge = contactAge;
	}

	@Column(name = "contact_name", nullable = true)
	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getContact_id() {
		return contact_id;
	}

	public void setContact_id(int id) {
		this.contact_id = id;
	}

}
