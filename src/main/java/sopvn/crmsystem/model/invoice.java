package sopvn.crmsystem.model;

import java.sql.Date;
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
@Table(name = "invoice")
@EntityListeners(AuditingEntityListener.class)
public class invoice {
	private int invoice_id;
	private Date invoiceDate;
	
	private List<order> order;
	private List<cases> cases;
	private List<servicecalendar> servicecalendar;
	
	
	public invoice(Date date)
	{
		invoiceDate = date;
	}

	public invoice(int i) {
		invoice_id = 0;
	}
	public invoice() {
		
	}
	//join order
	@OneToMany(mappedBy="invoice")
	public List<order> getOrder() {
		return order;
	}

	public void setOrder(List<order> order) {
		this.order = order;
	}
	
	//join cases
	@OneToMany(mappedBy="invoice")
	public List<cases> getCases() {
		return cases;
	}

	public void setCases(List<cases> cases) {
		this.cases = cases;
	}
	//join servicecalendar
	@OneToMany(mappedBy="invoice")
	public List<servicecalendar> getServicecalendar() {
		return servicecalendar;
	}

	public void setServicecalendar(List<servicecalendar> servicecalendar) {
		this.servicecalendar = servicecalendar;
	}


	
	@Column(name = "invoice_date", nullable = true)
	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getInvoice_id() {
		return invoice_id;
	}

	public void setInvoice_id(int id) {
		this.invoice_id = id;
	}

}
