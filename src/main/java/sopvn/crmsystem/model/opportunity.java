package sopvn.crmsystem.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity

@Table(name = "opportunity")
@EntityListeners(AuditingEntityListener.class)
public class opportunity {
	private int opportunity_id;
	private String opportunityName;
	private String opportunityDetail;
	
	List<opportunitycompetitor> opportunitycompetitor;
	List<opportunitylead> opportunitylead;
	List<campaign> campaign;
	
	//join campaign
	@OneToMany(mappedBy = "opportunity")
	@JsonIgnore
	public List<campaign> getCampaign() {
		return campaign;
	}

	public void setCampaign(List<campaign> campaign) {
		this.campaign = campaign;
	}
	
	//join opportunitycompetitor
	@OneToMany(mappedBy = "opportunity")
	@JsonIgnore
	public List<opportunitycompetitor> getOpportunitycompetitor() {
		return opportunitycompetitor;
	}

	public void setOpportunitycompetitor(List<opportunitycompetitor> opportunitycompetitor) {
		this.opportunitycompetitor = opportunitycompetitor;
	}
	
	//join opportunitylead
	@OneToMany(mappedBy = "opportunity")
	@JsonIgnore
	public List<opportunitylead> getOpportunitylead() {
		return opportunitylead;
	}

	public void setOpportunitylead(List<opportunitylead> opportunitylead) {
		this.opportunitylead = opportunitylead;
	}

	@Column(name = "opportunity_detail", nullable = true)
	public String getOpportunityDetail() {
		return opportunityDetail;
	}

	public void setOpportunityDetail(String opportunityDetail) {
		this.opportunityDetail = opportunityDetail;
	}


	@Column(name = "opportunity_name", nullable = true)
	public String getOpportunityName() {
		return opportunityName;
	}

	public void setOpportunityName(String opportunityName) {
		this.opportunityName = opportunityName;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getOpportunity_id() {
		return opportunity_id;
	}

	public void setOpportunity_id(int id) {
		this.opportunity_id = id;
	}

}

