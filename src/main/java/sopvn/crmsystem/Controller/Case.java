package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.cases;
import sopvn.crmsystem.model.user;
import sopvn.crmsystem.repository.caseRepository;
import sopvn.crmsystem.repository.invoiceRepository;
import sopvn.crmsystem.repository.userRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class Case {

	@Autowired
	caseRepository cases;
	@Autowired
	invoiceRepository invoices;
	@Autowired
	userRepository users;

	@RequestMapping(Mappings.CASE_MANAGEMENT)
	public String Index(Model model) {
		List<sopvn.crmsystem.model.cases> list_case = cases.findAll();
		model.addAttribute("cases", list_case);
		List<user> list_user = users.findAll();
		model.addAttribute("users",list_user);
		return ViewNames.CASE_MANAGEMENT;
	}

	// create
	@RequestMapping(value = Mappings.CASE_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody cases Create(@RequestBody cases c) {
		// check if invoice exists
		try {
			if (invoices.existsById(c.getInvoiceId())) {
				c.setInvoice(invoices.findById(c.getInvoiceId()));
				return cases.save(c);
			} else {
				cases failed = new cases();
				failed.setInvoiceId(0);
				return failed;
			}
		} catch (Exception ex) {
			cases failed = new cases();
			failed.setCase_id(0);
			return failed;
		}
	}

	// edit
	@RequestMapping(value = Mappings.CASE_EDIT, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody cases Edit(@RequestBody sopvn.crmsystem.model.cases c) {
		sopvn.crmsystem.model.cases edit = cases.findById(c.getCase_id());
		edit.setCaseDetail(c.getCaseDetail());
		edit.setCaseStatus(c.getCaseStatus());
		return cases.save(edit);
	}

	// delete
	@RequestMapping(value = Mappings.CASE_DELETE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody cases Delete(@RequestBody int id) {
		sopvn.crmsystem.model.cases delete = cases.findById(id);
		delete.setInvoiceId(0);
		delete.setInvoice(null);
		try {
			cases.delete(delete);
			return delete;

		} catch (Exception e) {
			cases failed = new cases();
			failed.setCase_id(0);
			return failed;
		}
	}

}
