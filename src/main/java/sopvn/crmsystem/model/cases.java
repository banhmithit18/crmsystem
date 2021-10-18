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
@Table(name = "cases")
@EntityListeners(AuditingEntityListener.class)
public class cases {
	private int case_id;
	private String caseName;
	private String caseDetail;
	private String caseStatus;
	private int invoiceId;
	private int userId;
	
	
	private List<servicecalendar> servicecalendar;
	
	//join service calendar
		@OneToMany(mappedBy="cases", fetch = FetchType.EAGER)
		public List<servicecalendar> getServicecalendar() {
			return servicecalendar;
		}

		public void setServicecalendar(List<servicecalendar> servicecalendar) {
			this.servicecalendar = servicecalendar;
		}

	
	private invoice invoice;	
	//join invoice
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "invoice_id", referencedColumnName = "invoice_id", insertable = false, updatable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(invoice invoice) {
		this.invoice = invoice;
	}

	@Column(name = "user_id", nullable = true)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Column(name = "invoice_id", nullable = true)
	public int getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}


	@Column(name = "case_status", nullable = true)
	public String getCaseStatus() {
		return caseStatus;
	}

	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}


	@Column(name = "case_detail", nullable = true)
	public String getCaseDetail() {
		return caseDetail;
	}

	public void setCaseDetail(String caseDetail) {
		this.caseDetail = caseDetail;
	}


	@Column(name = "case_name", nullable = true)
	public String getCaseName() {
		return caseName;
	}

	public void setCaseName(String caseName) {
		this.caseName = caseName;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCase_id() {
		return case_id;
	}

	public void setCase_id(int id) {
		this.case_id = id;
	}

}

