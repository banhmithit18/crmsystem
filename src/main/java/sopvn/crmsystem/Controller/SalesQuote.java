package sopvn.crmsystem.Controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.quote;
import sopvn.crmsystem.repository.quoteRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;


@Controller
public class SalesQuote {
@Autowired quoteRepository quotes;

	@RequestMapping(Mappings.QUOTE_MANAGEMENT)
	public String Index(Model model) {
		List<quote> quotesList = quotes.findAll();
		model.addAttribute("quotes",quotesList);
		return ViewNames.QUOTE_MANAGEMENT;
	}
	//find
	@RequestMapping(value = Mappings.QUOTE_GET, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody quote getQuote(@RequestBody int id) {
		return quotes.findById(id);
	}
	//create
	@RequestMapping(value = Mappings.QUOTE_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody quote Create(@RequestBody quote q){
		return quotes.save(q);
	}
	//delete
	@RequestMapping(value = Mappings.QUOTE_DELETE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody quote Delete(@RequestBody int id)
	{
		try {
			quote deleted = getQuote(id);
			quotes.deleteById(deleted.getQuote_id());
			return deleted;
		} catch (Exception e) {
			//return null if not delete
			return new quote();
		}
	}
	//edit
		@RequestMapping(value = Mappings.QUOTE_EDIT, method = RequestMethod.POST, consumes = { "application/json" })
		public @ResponseBody quote Edit(@RequestBody quote q)
		{
			try {
				quote edited = getQuote(q.getQuote_id());
				edited.setQuoteDetail(q.getQuoteDetail());
				edited.setQuoteStatus(q.getQuoteStatus());
				return quotes.save(edited);
				
			} catch (Exception e) {
				return new quote();
			}
		}
	
}
