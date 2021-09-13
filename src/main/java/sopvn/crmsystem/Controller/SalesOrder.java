package sopvn.crmsystem.Controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.invoice;
import sopvn.crmsystem.model.order;
import sopvn.crmsystem.repository.accountRepository;
import sopvn.crmsystem.repository.invoiceRepository;
import sopvn.crmsystem.repository.orderRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.util.ViewNames;
import sopvn.crmsystem.view.orderView;

@Controller
public class SalesOrder {
	@Autowired orderRepository orders;
	@Autowired accountRepository accounts;
	@Autowired invoiceRepository invoices;

	@RequestMapping(Mappings.ORDER_MANAGEMENT)
	public String Index(Model model) {
		List<order> orderList = orders.findAll();
		model.addAttribute("orders", orderList);
		return ViewNames.ORDER_MANAGEMENT;
	}
	//create
	@RequestMapping(value= Mappings.ORDER_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody order Create(@RequestBody order o)
	{
		try {
			o.setAccount(accounts.findById(o.getOrder_id()));
	
			//get current date
			java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			//create invoice
			invoice i = createInvoice(new invoice(date));
			if(i.getInvoice_id() !=  0)
			{
				o.setInvoiceId(i.getInvoice_id());
				o.setInvoice(i);
				return orders.save(o);
			}
			else
			{
				return new order(0);
			}
			

		}
		catch(Exception ex){
			return new order(0);
		}
	}
	// get order list by account id
	@RequestMapping(value= Mappings.ORDER_HISTORY, method = RequestMethod.POST, consumes = {"application/json"})
	public @ResponseBody List<orderView> getOrder(@RequestBody int accountID)
	{
		List<orderView> order_list_view = new ArrayList<orderView>();
		List<order> order_list= orders.findByAccountId(accountID);
		for (order order : order_list) {
			orderView view = new orderView();
			view.setName(order.getProduct().getProductName());
			view.setQuantity(order.getQuantity());
			view.setTotal(order.getTotal());
			view.setDate(order.getInvoice().getInvoiceDate());
			order_list_view.add(view);
			
		}
		return order_list_view;
	}
	public invoice createInvoice (invoice i)
	{
		try {
	
			return invoices.save(i);
			
		}
		catch(Exception ex){
			ex.printStackTrace();
			return new invoice(0);
		}
	}
	
	
}
