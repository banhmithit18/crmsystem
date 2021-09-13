package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.account;
import sopvn.crmsystem.model.lead;
import sopvn.crmsystem.model.product;
import sopvn.crmsystem.repository.accountRepository;
import sopvn.crmsystem.repository.leadRepository;
import sopvn.crmsystem.repository.productRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class SalesAccountCustomer {
	@Autowired productRepository products;
	@Autowired accountRepository accounts;
	@Autowired leadRepository leads;
	@RequestMapping(Mappings.ACCOUNT_MANAGEMENT)
	public String Index(Model model) {
		List<product> product_list = products.findByProductStatusTrue();
		model.addAttribute("products", product_list);
		List<account> account_list = accounts.findAllAccount();
		model.addAttribute("accounts", account_list);
		return ViewNames.ACCOUNT_MANAGEMENT;
	}
	//edit
	@RequestMapping(value=Mappings.ACCOUNT_EDIT, method =RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody lead Edit( @RequestBody lead lead)
	{
		try {
		account account = accounts.findByLeadId(lead.getLead_id());	
		//change lead first
		account.setLead(null);
		lead leadEdit = leads.save(lead);
		account.setLead(leadEdit);
		return leadEdit;
		}
		catch(Exception e)
		{
			return new lead(0);
		}
	}
	//delete
	@RequestMapping(value=Mappings.ACCOUNT_DELETE, method =RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody account Delete(@RequestBody int id)
	{
		try {
			account delete = accounts.findById(id);
			delete.setLead(null);
			accounts.delete(delete);
			
				return delete;
			
			
		}catch(Exception e)
		{
			return new account(0);
		}
	}
}
