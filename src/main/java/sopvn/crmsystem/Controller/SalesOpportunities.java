package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.opportunity;
import sopvn.crmsystem.repository.opportunityRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class SalesOpportunities {
@Autowired opportunityRepository opportunities;
	@RequestMapping(Mappings.OPPORTUNITY_MANAGEMENT)
	public String Index(Model model) {
		List<opportunity> opportunityList = opportunities.findAll();
		model.addAttribute("opportunities",opportunityList);
		return ViewNames.OPPORTUNITY_MANAGEMENT;
	}
	// find 
	@RequestMapping(value = Mappings.OPPORTUNITY_GET, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody opportunity getOpportunity(@RequestBody int id)
	{
		return opportunities.findById(id);
	}
	//create
	@RequestMapping(value = Mappings.OPPORTUNITY_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody opportunity Create(@RequestBody opportunity op)
	{
		return opportunities.save(op);
	}
	//delete
	@RequestMapping(value = Mappings.OPPORTUNITY_DELETE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody opportunity Delete(@RequestBody int id)
	{
		try {
			opportunity deleted = getOpportunity(id);
			opportunities.deleteById(deleted.getOpportunity_id());
			return deleted;
		} catch (Exception e) {
			//return null if not delete
			return new opportunity();
		}
	}
	//edit
	@RequestMapping(value = Mappings.OPPORTUNITY_EDIT, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody opportunity Edit(@RequestBody opportunity op)
	{
		try {
			opportunity edited = getOpportunity(op.getOpportunity_id());
			edited.setOpportunityDetail(op.getOpportunityDetail());
			return opportunities.save(edited);
			
		} catch (Exception e) {
			return new opportunity();
		}
	}
}
