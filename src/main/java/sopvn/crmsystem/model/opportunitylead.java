package sopvn.crmsystem.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "opportunitylead")
@EntityListeners(AuditingEntityListener.class)
public class opportunitylead {
	private int opportunitylead_id;
	private int leadId;
	private int opportunityId;

	private opportunity opportunity;
	private lead lead;

	// join opportunity
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "opportunity_id", referencedColumnName = "opportunity_id")
	@OnDelete(action = OnDeleteAction.CASCADE)
	public opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(opportunity opportunity) {
		this.opportunity = opportunity;
	}

	// join lead
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "lead_id", referencedColumnName = "lead_id")
	@OnDelete(action = OnDeleteAction.CASCADE)
	public lead getLead() {
		return lead;
	}

	public void setLead(lead lead) {
		this.lead = lead;
	}

	@Column(name = "opportunity_id", nullable = true, insertable = false, updatable = false)
	public int getOpportunityId() {
		return opportunityId;
	}

	public void setOpportunityId(int opportunityId) {
		this.opportunityId = opportunityId;
	}

	@Column(name = "lead_id", nullable = true,insertable = false, updatable = false)
	public int getLeadId() {
		return leadId;
	}

	public void setLeadId(int leadId) {
		this.leadId = leadId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getOpportunitylead_id() {
		return opportunitylead_id;
	}

	public void setOpportunitylead_id(int opportunitylead_id) {
		this.opportunitylead_id = opportunitylead_id;
	}

}
