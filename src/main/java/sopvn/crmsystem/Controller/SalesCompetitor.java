package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesCompetitor {
	
	@RequestMapping("/competitor")
	public String Index() {
		return "sales-competitor";
	}
}
