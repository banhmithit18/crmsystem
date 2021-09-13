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
@Table(name = "`order`")
@EntityListeners(AuditingEntityListener.class)
public class order {
	private int order_id;
	private int accountId;
	private int userId;
	private int productId;
	private int quantity;
	private double total;
	private boolean orderStatus;
	private int invoiceId;
	

	public order(int i) {
		order_id = i;
	}
	public order()
	{
		
	}

	@Column(name = "invoice_id", nullable = true)
	public int getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	
	private account account;
	private product product;
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

	

	
	//join product
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_id", referencedColumnName = "product_id", insertable = false, updatable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public product getProduct() {
		return product;
	}

	public void setProduct(product product) {
		this.product = product;
	}

	//join account
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	public account getAccount() {
		return account;
	}

	public void setAccount(account account) {
		this.account = account;
	}

	@Column(name = "order_status", nullable = true)
	public boolean getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(boolean orderStatus) {
		this.orderStatus = orderStatus;
	}


	@Column(name = "total", nullable = true)
	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}


	@Column(name = "quantity", nullable = true)
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	


	@Column(name = "product_id", nullable = true)
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}


	@Column(name = "user_id", nullable = true)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Column(name = "account_id", nullable = true)
	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int id) {
		this.order_id = id;
	}

}

