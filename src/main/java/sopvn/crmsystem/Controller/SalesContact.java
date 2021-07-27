package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesContact {
	@RequestMapping("/contact")
	public String Index() {
		return "sales-contact";
	}
}
