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
@Table(name = "product")
@EntityListeners(AuditingEntityListener.class)
public class product {
	private int product_id;
	private String productName;
	private String productDetail;
	private int productQuantity;
	private boolean productStatus;
	private int quoteId;
	private float productPrice;
	

	@Column(name = "product_price", nullable = true)
	public float getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}

	
	private List<order> order;
	private quote quote;
	
	//join quote
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "quote_id", referencedColumnName = "quote_id", insertable = false, updatable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public quote getQuote() {
		return quote;
	}

	public void setQuote(quote quote) {
		this.quote = quote;
	}

	//join order
	@OneToMany(mappedBy="product",fetch = FetchType.EAGER )
	public List<order> getOrder() {
		return order;
	}

	public void setOrder(List<order> order) {
		this.order = order;
	}

	@Column(name = "quote_id", nullable = true)
	public int getQuoteId() {
		return quoteId;
	}

	public void setQuoteId(int quoteId) {
		this.quoteId = quoteId;
	}


	@Column(name = "product_status", nullable = true)
	public boolean getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(boolean productStatus) {
		this.productStatus = productStatus;
	}


	@Column(name = "product_quantity", nullable = true)
	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}


	@Column(name = "product_detail", nullable = true)
	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}


	@Column(name = "product_name", nullable = true)
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int id) {
		this.product_id = id;
	}

}

