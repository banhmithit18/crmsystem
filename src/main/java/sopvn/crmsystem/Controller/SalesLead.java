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
import sopvn.crmsystem.model.opportunity;
import sopvn.crmsystem.model.product;
import sopvn.crmsystem.repository.accountRepository;
import sopvn.crmsystem.repository.leadRepository;
import sopvn.crmsystem.repository.opportunityRepository;
import sopvn.crmsystem.repository.productRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class SalesLead {
	@Autowired
	leadRepository leads;
	@Autowired
	opportunityRepository opportunities;
	@Autowired
	accountRepository accounts;
	@Autowired productRepository products;
	
	@RequestMapping(Mappings.LEAD_MANAGEMENT)
	public String Index(Model model) {
		List<lead> leadList = leads.findAllLead();
		List<opportunity> opportunityList = opportunities.findAll();
		model.addAttribute("leads", leadList);
		model.addAttribute("opportunities",opportunityList);
		List<product> product_list = products.findByProductStatusTrue();
		model.addAttribute("products", product_list);
		return ViewNames.LEAD_MANAGEMENT;
	}
	//create
	@RequestMapping(value = Mappings.LEAD_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody lead Create(@RequestBody lead l) {
		// check if phone exists
		if (leads.existsByLeadPhone(l.getLeadPhone())) {
			lead returnLead = new lead();
			returnLead.setLeadPhone("Exists");
			return returnLead;
		} else {
			// check if email exists
			if (leads.existsByLeadEmail(l.getLeadEmail())) {
				lead returnLead = new lead();
				returnLead.setLeadEmail("Exists");
				return returnLead;
			}
			// create
			else {
				return leads.save(l);
			}
		}
	}
	//insert into account
	@RequestMapping(value= Mappings.LEAD_PROMOTION, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody account Promotion(@RequestBody int id)
	{
		account a = new account(id);
		a.setLead(leads.findById(id));
		return accounts.save(a);
	}
	
	
	
	//edit
	@RequestMapping(value= Mappings.LEAD_EDIT, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody lead Edit(@RequestBody lead l) {
		lead leadEdit = leads.findByLeadPhone(l.getLeadPhone());
		leadEdit.setLeadName(l.getLeadName());
		leadEdit.setLeadAge(l.getLeadAge());
		leadEdit.setLeadJob(l.getLeadJob());
		leadEdit.setLeadAddress(l.getLeadAddress());
		return leads.save(leadEdit);
				
	}
	//delete
	@RequestMapping(value=Mappings.LEAD_DELETE, method = RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody lead Delete(@RequestBody int id)
	{
		lead deleted = leads.findById(id);
		try {
			leads.deleteById(deleted.getLead_id());
			
			try {
				lead l = leads.findById(id);
				l.setLead_id(0);
				return l;
			}
			catch (Exception e)
			{
				return deleted;
			}
			
			
		} catch (Exception e) {
			return new lead();
		}
	}


}
