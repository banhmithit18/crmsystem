package sopvn.crmsystem.view;

public class productView {
	private int product_id;
	private String productName;
	private String productDetail;
	private int productQuantity;
	private float productPrice;
	private boolean productStatus;
	private String productQuote;
	
	
	
	public productView() {
		super();
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}
	public boolean isProductStatus() {
		return productStatus;
	}
	public void setProductStatus(boolean productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductQuote() {
		return productQuote;
	}
	public void setProductQuote(String productQuote) {
		this.productQuote = productQuote;
	}
	
}
