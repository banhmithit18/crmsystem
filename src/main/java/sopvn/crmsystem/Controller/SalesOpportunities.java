package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesOpportunities {

	@RequestMapping("/opportunities")
	public String Index() {
		return "sales-opportunities";
	}
}