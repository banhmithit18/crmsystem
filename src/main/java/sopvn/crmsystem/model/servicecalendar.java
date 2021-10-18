package sopvn.crmsystem.model;

import java.sql.Date;

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
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "servicecalendar")
@EntityListeners(AuditingEntityListener.class)
public class servicecalendar {
	private int servicecalendar_id;
	private int userId;
	private String serviceName;
	private String serviceDetail;
	private int caseId;
	private Date assignedDate;
	
	
	//join user
	private user user;
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = true, updatable = true)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public user getUser() {
		return user;
	}

	public void setUser(user user) {
		this.user = user;
	}
	
	
	private cases cases;
	
	//join case
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "case_id", referencedColumnName = "case_id", insertable = true, updatable = true)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public cases getCases() {
		return cases;
	}

	public void setCases(cases cases) {
		this.cases = cases;
	}

	@Column(name = "assigned_date", nullable = true)
	public Date getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(Date assignedDate) {
		this.assignedDate = assignedDate;
	}


	@Column(name = "case_id", nullable = true,insertable = false, updatable = false)
	public int getCaseId() {
		return caseId;
	}

	public void setCaseId(int caseId) {
		this.caseId = caseId;
	}


	@Column(name = "service_detail", nullable = true)
	public String getServiceDetail() {
		return serviceDetail;
	}

	public void setServiceDetail(String serviceDetail) {
		this.serviceDetail = serviceDetail;
	}


	@Column(name = "service_name", nullable = true)
	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	@Column(name = "user_id", nullable = true ,insertable = false, updatable = false)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getServicecalendar_id() {
		return servicecalendar_id;
	}

	public void setServicecalendar_id(int id) {
		this.servicecalendar_id = id;
	}
	

}

