package sopvn.crmsystem.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.lead;
import sopvn.crmsystem.model.opportunity;
import sopvn.crmsystem.model.opportunitylead;
import sopvn.crmsystem.repository.leadRepository;
import sopvn.crmsystem.repository.opportunityRepository;
import sopvn.crmsystem.repository.opportunityleadRepository;
import sopvn.crmsystem.util.Mappings;

@Controller
public class SalesLeadOpportunity {
	@Autowired
	leadRepository leads;
	@Autowired
	opportunityleadRepository opportunityleads;
	@Autowired
	opportunityRepository opportunities;

	// get lead opportunity
	@RequestMapping(value = Mappings.LEAD_OPPORTUNITY_TABLE, method = RequestMethod.POST, consumes = {
			"application/json" })
	public @ResponseBody List<opportunity> leadOpportunityTable(@RequestBody int id) {

		lead l = leads.findById(id);
		List<opportunity> list_opportunity = new ArrayList<opportunity>();
		for (int i = 0; i < l.getOpportunitylead().size(); i++) {
			opportunity op = l.getOpportunitylead().get(i).getOpportunity();
			// change opportunity id to opportunitylead for deleting purpose
			op.setOpportunity_id(l.getOpportunitylead().get(i).getOpportunitylead_id());
			list_opportunity.add(op);
		}
		return list_opportunity;
	}
	//add lead opportunity
	@RequestMapping(value= Mappings.LEAD_OPPORTUNITY_ADD, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody opportunity Add(@RequestBody opportunitylead ol)
	{
		//set lead
		ol.setLead(leads.findById(ol.getLeadId()));
		//set opportunity
		ol.setOpportunity(opportunities.findById(ol.getOpportunityId()));
		//save
		try {
			opportunitylead Created = opportunityleads.save(ol);
			//return opportunity 
			opportunity returnOpportunity = opportunities.findById(Created.getOpportunityId());
			returnOpportunity.setOpportunity_id(Created.getOpportunitylead_id());
			return returnOpportunity;
					
		} catch (Exception e) {
			return new opportunity();
		}
	}
	// delete lead opportunity
	@RequestMapping(value = Mappings.LEAD_OPPORTUNITY_DELETE, method = RequestMethod.POST, consumes = {
			"application/json" })
	public @ResponseBody opportunitylead Delete(@RequestBody int id) {
		//get opportunitylead
		opportunitylead deleted = opportunityleads.findById(id);
		//save data to return if delete success
		opportunitylead deletedReturn = deleted;
		try {
			//set to null to avoid conflict
			deleted.setLead(null);
			deleted.setOpportunity(null);
			opportunityleads.save(deleted);
			//delete
			opportunityleads.deleteById(deleted.getOpportunitylead_id());
			return deletedReturn;

		} catch (Exception e) {
			//return null if cannot delete
			deleted = new opportunitylead();
			return deleted;
		}
	}

}
