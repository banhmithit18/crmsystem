package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SalesInvoices {
	@RequestMapping("/invoice")
	public String Index() {
		return "sales-invoice";
	}
	

}
