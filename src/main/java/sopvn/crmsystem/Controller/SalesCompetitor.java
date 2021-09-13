package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.competitor;
import sopvn.crmsystem.model.lead;
import sopvn.crmsystem.model.opportunity;
import sopvn.crmsystem.repository.competitorRepository;
import sopvn.crmsystem.repository.leadRepository;
import sopvn.crmsystem.repository.opportunityRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class SalesCompetitor {
	@Autowired
	competitorRepository competitors;
	@Autowired
	opportunityRepository opportunities;
	
	@RequestMapping(Mappings.COMPETITOR_MANAGEMNET)
	public String Index(Model model) {
		List<competitor> competitorList = competitors.findAll();
		List<opportunity> opportunityList = opportunities.findAll();
		model.addAttribute("competitors", competitorList);
		model.addAttribute("opportunities",opportunityList);
		return ViewNames.COMPETITOR_MANAGEMNET;
	}
	//create
		@RequestMapping(value = Mappings.COMPETITOR_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
		public @ResponseBody competitor Create(@RequestBody competitor l) {
			return competitors.save(l);
		}
		
		//edit
		@RequestMapping(value= Mappings.COMPETITOR_EDIT, method = RequestMethod.POST, consumes = { "application/json" })
		public @ResponseBody competitor Edit(@RequestBody competitor c) {
			competitor competitorEdit = competitors.findById(c.getCompetitor_id());
			competitorEdit.setCompetitorDetail(c.getCompetitorDetail());
			competitorEdit.setCompetitorField(c.getCompetitorField());
			return competitors.save(competitorEdit);
					
		}
		//delete
		@RequestMapping(value=Mappings.COMPETITOR_DELETE, method = RequestMethod.POST, consumes = {"application/json"})
		public @ResponseBody competitor Delete(@RequestBody int id)
		{
			competitor deleted = competitors.findById(id);
			try {
				competitors.deleteById(deleted.getCompetitor_id());
				
				try {
					competitor l = competitors.findById(id);
					l.setCompetitor_id(0);
					return l;
				}
				catch (Exception e)
				{
					return deleted;
				}
				
				
			} catch (Exception e) {
				return new competitor();
			}
		}
}
