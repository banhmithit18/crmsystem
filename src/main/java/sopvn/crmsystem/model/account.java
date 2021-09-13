package sopvn.crmsystem.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
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
@Table(name = "account")
@EntityListeners(AuditingEntityListener.class)
public class account {
	private int account_id;
	private int leadId;

	private List<contact> contact;
	private lead lead;
	private List<contract> contract;
	private List<order> order;

	public account() {
		
	}
	
	public account(int id) {
		leadId = id;
	}

	//join order
	@OneToMany(mappedBy = "account")
	public List<order> getOrder() {
		return order;
	}

	public void setOrder(List<order> order) {
		this.order = order;
	}
	
	// join contact
	@OneToMany(mappedBy = "account")
	public List<contract> getContract() {
		return contract;
	}

	public void setContract(List<contract> contract) {
		this.contract = contract;
	}

	// join lead
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "lead_id", referencedColumnName = "lead_id", insertable = false, updatable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public lead getLead() {
		return lead;
	}

	public void setLead(lead lead) {
		this.lead = lead;
	}

	// join contact
	@OneToMany(mappedBy = "account")
	public List<contact> getContact() {
		return contact;
	}

	public void setContact(List<contact> contact) {
		this.contact = contact;
	}

	@Column(name = "lead_id", nullable = true)
	public int getLeadId() {
		return leadId;
	}

	public void setLeadId(int leadId) {
		this.leadId = leadId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int id) {
		this.account_id = id;
	}

}
