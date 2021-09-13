package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.product;
import sopvn.crmsystem.model.quote;
import sopvn.crmsystem.repository.productRepository;
import sopvn.crmsystem.repository.quoteRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;
import sopvn.crmsystem.view.productView;

@Controller
public class SalesProduct {
	@Autowired productRepository products;
	@Autowired quoteRepository quotes;
	
	@RequestMapping(Mappings.PRODUCT_MANAGEMENT)
	public String Index(Model model) {
		List<product> productList = products.findAll();
		model.addAttribute("products", productList);
		List<quote> quoteList = quotes.findByQuoteStatusTrue();
		model.addAttribute("quotes", quoteList);
		return ViewNames.PRODUCT_MANAGEMENT;
	}
	
	// find 
	@RequestMapping(value = Mappings.PRODUCT_GET, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody product getProduct(@RequestBody int id)
	{
		return products.findById(id);
	}
	//create
	@RequestMapping(value = Mappings.PRODUCT_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody productView Create(@RequestBody product p)
	{
		p.setQuote(quotes.findById(p.getQuoteId()));
		product saved = products.save(p);
		
		//generate view
		productView view = new productView();
		view.setProduct_id(saved.getProduct_id());
		view.setProductDetail(saved.getProductDetail());
		view.setProductName(saved.getProductName());
		view.setProductPrice(saved.getProductPrice());
		view.setProductQuantity(saved.getProductQuantity());
		view.setProductQuote(saved.getQuote().getQuoteName());
		view.setProductStatus(saved.getProductStatus());
		
		return view;
		
		
		
	}
	//delete
	@RequestMapping(value = Mappings.PRODUCT_DELETE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody product Delete(@RequestBody int id)
	{
		try {
			product deleted = getProduct(id);
			products.deleteById(deleted.getProduct_id());
			return deleted;
		} catch (Exception e) {
			//return null if not delete
			return new product();
		}
	}
	//edit
	@RequestMapping(value = Mappings.PRODUCT_EDIT, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody productView Edit(@RequestBody product p)
	{
		try {
			product edited = getProduct(p.getProduct_id());			
			edited.setProductDetail(p.getProductDetail());
			edited.setProductQuantity(p.getProductQuantity());
			edited.setProductStatus(p.getProductStatus());
			edited.setQuote(quotes.findById(p.getQuoteId()));
			edited.setQuoteId(p.getQuoteId());
			products.save(edited);
			
			//generate view
			productView view = new productView();
			view.setProduct_id(edited.getProduct_id());
			view.setProductDetail(edited.getProductDetail());
			view.setProductName(edited.getProductName());
			view.setProductPrice(edited.getProductPrice());
			view.setProductQuantity(edited.getProductQuantity());
			view.setProductQuote(edited.getQuote().getQuoteName());
			view.setProductStatus(edited.getProductStatus());
			
			return view;
			
		} catch (Exception e) {
			return new productView();
		}
	}
	
}
