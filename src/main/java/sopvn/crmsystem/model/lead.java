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
@Table(name = "lead")
@EntityListeners(AuditingEntityListener.class)
public class lead {
	private int lead_id;
	private String leadName;
	private int leadAge;
	private String leadJob;
	private String leadEmail;
	private String leadAddress;
	private String leadPhone;
	
	List<opportunitylead> opportunitylead;
	Set<campaignmember> campaignmember;
	Set<account> account;
		


	public lead(int i) {
		lead_id = i;
	}
	public lead() {
		
	}

	//join account
	@OneToMany(mappedBy="lead",fetch = FetchType.EAGER)
	public Set<account> getAccount() {
		return account;
	}

	public void setAccount(Set<account> account) {
		this.account = account;
	}

	//join campaignmember
	
	@OneToMany(mappedBy="lead",fetch = FetchType.EAGER)
	public Set<campaignmember> getCampaignmember() {
		return campaignmember;
	}

	public void setCampaignmember(Set<campaignmember> campaignmember) {
		this.campaignmember = campaignmember;
	}
	
	//join opportunity lead
	@OneToMany(mappedBy = "lead", fetch = FetchType.EAGER)
	public List<opportunitylead> getOpportunitylead() {
		return opportunitylead;
	}

	public void setOpportunitylead(List<opportunitylead> opportunitylead) {
		this.opportunitylead = opportunitylead;
	}

	@Column(name = "lead_phone", nullable = true)
	public String getLeadPhone() {
		return leadPhone;
	}

	public void setLeadPhone(String leadPhone) {
		this.leadPhone = leadPhone;
	}


	@Column(name = "lead_address", nullable = true)
	public String getLeadAddress() {
		return leadAddress;
	}

	public void setLeadAddress(String leadAddress) {
		this.leadAddress = leadAddress;
	}


	@Column(name = "lead_email", nullable = true)
	public String getLeadEmail() {
		return leadEmail;
	}

	public void setLeadEmail(String leadEmail) {
		this.leadEmail = leadEmail;
	}


	@Column(name = "lead_job", nullable = true)
	public String getLeadJob() {
		return leadJob;
	}

	public void setLeadJob(String leadJob) {
		this.leadJob = leadJob;
	}


	@Column(name = "lead_age", nullable = true)
	public int getLeadAge() {
		return leadAge;
	}

	public void setLeadAge(int age) {
		this.leadAge = age;
	}


	@Column(name = "lead_name", nullable = true)
	public String getLeadName() {
		return leadName;
	}

	public void setLeadName(String leadName) {
		this.leadName = leadName;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getLead_id() {
		return lead_id;
	}

	public void setLead_id(int id) {
		this.lead_id = id;
	}

}


