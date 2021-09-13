package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.contact;
import sopvn.crmsystem.model.lead;
import sopvn.crmsystem.repository.contactRepository;
import sopvn.crmsystem.repository.leadRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class SalesContact {
	@Autowired contactRepository contacts;
	@Autowired leadRepository leads;
	@RequestMapping(Mappings.CONTACT_MANAGEMENT)
	public String Index(Model model) {
		List<contact> contact_list = contacts.findAll();
		model.addAttribute("contacts", contact_list);
		return ViewNames.CONTACT_MANAGEMENT;
	}
	//create
	@RequestMapping(value=Mappings.CONTACT_CREATE, method = RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody contact Create(@RequestBody contact c)
	{
		// check if phone exists
				if (contacts.existsByContactPhone(c.getContactPhone())) {
					contact returnContact = new contact();
					returnContact.setContactPhone("Exists");
					return returnContact;
				} else {
					// check if email exists
					if (contacts.existsByContactEmail(c.getContactEmail())) {
						contact returnContact = new contact();
						returnContact.setContactEmail("Exists");
						return returnContact;
					}
					// create
					else {
						return contacts.save(c);
					}
				}
	}
	
	//edit	
	@RequestMapping(value=Mappings.CONTACT_EDIT, method = RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody contact Edit(@RequestBody contact c)
	{
		contact edit = contacts.findById(c.getContact_id());	
		edit.setContactName(c.getContactName());
		edit.setContactAge(c.getContactAge());
		edit.setContactAddress(c.getContactAddress());
		edit.setContactJob(c.getContactJob());		
		return contacts.save(edit);
	}
	
	//delete
	@RequestMapping(value=Mappings.CONTACT_DELETE, method = RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody contact Delete(@RequestBody int id)
	{
		contact delete = contacts.findById(id);
		try {
			delete.setAccount(null);
			contacts.save(delete);
			contacts.delete(delete);
			return delete;
		} catch (Exception e) {
			contact error = new contact();
			error.setContact_id(0);
			return error;
		}
	}
	//promotion
	@RequestMapping(value=Mappings.CONTACT_PROMOTION, method = RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody contact Promotion(@RequestBody int id)
	{
		lead l = new lead();
		
		contact c = contacts.findById(id);
		l.setLeadName(c.getContactName());
		l.setLeadAddress(c.getContactAddress());
		l.setLeadAge(c.getContactAge());
		l.setLeadJob(c.getContactJob());
		l.setLeadEmail(c.getContactEmail());
		l.setLeadPhone(c.getContactPhone());
		leads.save(l);
		
		try {
			c.setAccount(null);
			contacts.save(c);
			contacts.delete(c);
			return c;
		} catch (Exception e) {
			contact error = new contact();
			error.setContact_id(0);
			return error;
		}
		
	}
	
	
}
