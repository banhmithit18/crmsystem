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
@Table(name = "quote")
@EntityListeners(AuditingEntityListener.class)

public class quote {
	private int quote_id;
	private String quoteName;
	private String quoteDetail;
	private boolean quoteStatus;
	
	List<product> product;
	
	//join product;
	@OneToMany(mappedBy="quote",fetch = FetchType.EAGER)
	public List<product> getProduct() {
		return product;
	}

	public void setProduct(List<product> product) {
		this.product = product;
	}

	@Column(name = "quote_status", nullable = true)
	public boolean getQuoteStatus() {
		return quoteStatus;
	}

	public void setQuoteStatus(boolean quoteStatus) {
		this.quoteStatus = quoteStatus;
	}


	@Column(name = "quote_detail", nullable = true)
	public String getQuoteDetail() {
		return quoteDetail;
	}

	public void setQuoteDetail(String quoteDetail) {
		this.quoteDetail = quoteDetail;
	}


	@Column(name = "quote_name", nullable = true)
	public String getQuoteName() {
		return quoteName;
	}

	public void setQuoteName(String quoteName) {
		this.quoteName = quoteName;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getQuote_id() {
		return quote_id;
	}

	public void setQuote_id(int id) {
		this.quote_id = id;
	}

}

