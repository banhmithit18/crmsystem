package sopvn.crmsystem.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.competitor;
import sopvn.crmsystem.model.opportunity;
import sopvn.crmsystem.model.opportunitycompetitor;
import sopvn.crmsystem.repository.competitorRepository;
import sopvn.crmsystem.repository.opportunityRepository;
import sopvn.crmsystem.repository.opportunitycompetitorRepository;
import sopvn.crmsystem.util.Mappings;

@Controller
public class SalesCompetitorOpportunity {
	@Autowired
	competitorRepository competitors;
	@Autowired
	opportunitycompetitorRepository opportunitycompetitors;
	@Autowired
	opportunityRepository opportunities;

	// get lead opportunity
	@RequestMapping(value = Mappings.COMPETITOR_OPPORTUNITY_TABLE, method = RequestMethod.POST, consumes = {
			"application/json" })
	public @ResponseBody List<opportunity> leadOpportunityTable(@RequestBody int id) {

		competitor c = competitors.findById(id);
		List<opportunity> list_opportunity = new ArrayList<opportunity>();
		for (int i = 0; i < c.getOpportunitycompetitor().size(); i++) {
			opportunity op = c.getOpportunitycompetitor().get(i).getOpportunity();
			// change opportunity id to opportunity competitor for deleting purpose
			op.setOpportunity_id(c.getOpportunitycompetitor().get(i).getOpportunitycompetitor_id());
			list_opportunity.add(op);
		}
		return list_opportunity;
	}
	//add competitor opportunity
	@RequestMapping(value= Mappings.COMPETITOR_OPPORTUNITY_ADD, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody opportunity Add(@RequestBody opportunitycompetitor oc)
	{
		//set lead
		oc.setCompetitor(competitors.findById(oc.getCompetitorId()));
		//set opportunity
		oc.setOpportunity(opportunities.findById(oc.getOpportunityId()));
		//save
		try {
			opportunitycompetitor Created = opportunitycompetitors.save(oc);
			//return opportunity 
			opportunity returnOpportunity = opportunities.findById(Created.getOpportunityId());
			returnOpportunity.setOpportunity_id(Created.getOpportunitycompetitor_id());
			return returnOpportunity;
					
		} catch (Exception e) {
			return new opportunity();
		}
	}
	// delete competitor opportunity
	@RequestMapping(value = Mappings.COMPETITOR_OPPORTUNITY_DELETE, method = RequestMethod.POST, consumes = {
			"application/json" })
	public @ResponseBody opportunitycompetitor  Delete(@RequestBody int id) {
		//get 
		opportunitycompetitor deleted = opportunitycompetitors.findById(id);
		//save data to return if delete success
		opportunitycompetitor deletedReturn = deleted;
		try {
			//set to null to avoid conflict
			deleted.setCompetitor(null);
			deleted.setOpportunity(null);
			opportunitycompetitors.save(deleted);
			//delete
			opportunitycompetitors.deleteById(deleted.getOpportunitycompetitor_id());
			return deletedReturn;

		} catch (Exception e) {
			//return null if cannot delete
			deleted = new opportunitycompetitor();
			return deleted;
		}
	}
}
