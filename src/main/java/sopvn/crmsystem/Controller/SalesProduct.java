package sopvn.crmsystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesProduct {
	
	@RequestMapping("product")
	public String Index() {
		return "sales-product";
	}
}
