package sopvn.crmsystem.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.account;
import sopvn.crmsystem.model.email;
import sopvn.crmsystem.model.lead;
import sopvn.crmsystem.repository.accountRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;

@Controller
public class Marketing {
	@Autowired
	accountRepository accounts;
	@Autowired
	JavaMailSender emailSender;

	@RequestMapping(Mappings.MARRKETING_MANAGEMENT)
	public String Index(Model model) {
		List<account> account_list = accounts.findAllAccount();
		model.addAttribute("accounts", account_list);
		return ViewNames.MARKETING_MANAGEMENT;
	}

	@RequestMapping(value = Mappings.ACCOUNT_EMAIL, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody String Send(@RequestBody email email) {
		// Create a Simple MailMessage.
		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(email.getReceiver());
		message.setSubject(email.getSubject());
		message.setText(email.getContent());
		
        this.emailSender.send(message);

		return "Email Sent!";
	}

}