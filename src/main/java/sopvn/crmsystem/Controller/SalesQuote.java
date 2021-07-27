package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesQuote {

	@RequestMapping("/quote")
	public String Index() {
		return "sales-quote";
	}
}
