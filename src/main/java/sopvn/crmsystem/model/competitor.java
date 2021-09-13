package sopvn.crmsystem.model;

import java.util.List;

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
@Table(name = "competitor")
@EntityListeners(AuditingEntityListener.class)
public class competitor {
	private int competitor_id;
	private String competitorName;
	private String competitorField;
	private String competitorDetail;
	
	List<opportunitycompetitor> opportunitycompetitor;
	
	//join opportunitycompetitor
	@OneToMany(mappedBy = "competitor",fetch = FetchType.EAGER)
	public List<opportunitycompetitor> getOpportunitycompetitor() {
		return opportunitycompetitor;
	}

	public void setOpportunitycompetitor(List<opportunitycompetitor> opportunitycompetitor) {
		this.opportunitycompetitor = opportunitycompetitor;
	}

	@Column(name = "competitor_detail", nullable = true)
	public String getCompetitorDetail() {
		return competitorDetail;
	}

	public void setCompetitorDetail(String competitorDetail) {
		this.competitorDetail = competitorDetail;
	}


	@Column(name = "competitor_field", nullable = true)
	public String getCompetitorField() {
		return competitorField;
	}

	public void setCompetitorField(String competitorField) {
		this.competitorField = competitorField;
	}


	@Column(name = "competitor_name", nullable = true)
	public String getCompetitorName() {
		return competitorName;
	}

	public void setCompetitorName(String competitorName) {
		this.competitorName = competitorName;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCompetitor_id() {
		return competitor_id;
	}

	public void setCompetitor_id(int id) {
		this.competitor_id = id;
	}

}
