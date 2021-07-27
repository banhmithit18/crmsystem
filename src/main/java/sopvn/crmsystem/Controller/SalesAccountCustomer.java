package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesAccountCustomer {
	@RequestMapping("/account")
	public String Index() {
		return "sales-account-customer";
	}
}
