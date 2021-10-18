package sopvn.crmsystem.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sopvn.crmsystem.model.servicecalendar;
import sopvn.crmsystem.repository.caseRepository;
import sopvn.crmsystem.repository.servicecalendaRepository;
import sopvn.crmsystem.repository.userRepository;
import sopvn.crmsystem.util.Mappings;
import sopvn.crmsystem.view.serviceCalendarView;

@Controller
public class ServiceCalendar {
	@Autowired
	caseRepository cases;
	@Autowired
	servicecalendaRepository servicecalendars;
	@Autowired
	userRepository users;

	// get service
	@RequestMapping(value = Mappings.SERVICE_CALENDAR_TALBE, method = RequestMethod.POST, consumes = {
			"application/json" })
	public @ResponseBody List<serviceCalendarView> serviceCalendarTable(@RequestBody int id) {

		sopvn.crmsystem.model.cases c = cases.findById(id);
		List<serviceCalendarView> list_service_calendar = new ArrayList<serviceCalendarView>();
		for (int i = 0; i < c.getServicecalendar().size(); i++) {
			serviceCalendarView view = new serviceCalendarView();
			view.setServiceCalendarId(c.getServicecalendar().get(i).getServicecalendar_id());
			String date = c.getServicecalendar().get(i).getAssignedDate().toString();
			view.setAssignedDate(date);
			view.setUserFullname(c.getServicecalendar().get(i).getUser().getUserFullname());
			list_service_calendar.add(view);
		}
		return list_service_calendar;
	}
	//add service calendar
	@RequestMapping(value= Mappings.SERVICE_CALENDAR_CREATE, method = RequestMethod.POST, consumes = { "application/json" })
	public @ResponseBody serviceCalendarView Add(@RequestBody servicecalendar sc)
	{
		//set 
		sc.setCases(cases.findById(sc.getCaseId()));
		sc.setServiceName(sc.getCases().getCaseName());
		sc.setServiceDetail(sc.getCases().getCaseDetail());
		sc.setUser(users.findById(sc.getUserId()));
		//save
		try {
			servicecalendar save = servicecalendars.save(sc);
			serviceCalendarView returned = new serviceCalendarView();
			returned.setServiceCalendarId(save.getServicecalendar_id());
			returned.setAssignedDate(save.getAssignedDate().toString());
			returned.setUserFullname(save.getUser().getUserFullname());
			return returned;		
			
		} catch (Exception e) {
 			serviceCalendarView failed = new serviceCalendarView();
			failed.setServiceCalendarId(0);
			return failed;
		}
	}
	// delete lead opportunity
	@RequestMapping(value = Mappings.SERVICE_CALENDAR_DELETE, method = RequestMethod.POST, consumes = {
			"application/json" })
	public @ResponseBody servicecalendar Delete(@RequestBody int id) {

		servicecalendar deleted = servicecalendars.findById(id);
		//save data to return if delete success
		servicecalendar deletedReturn = deleted;
		try {
			//set to null to avoid conflict
			deleted.setCases(null);
			deleted.setUser(null);
			servicecalendars.save(deleted);
			//delete
			servicecalendars.deleteById(deleted.getServicecalendar_id());
			return deletedReturn;

		} catch (Exception e) {
			servicecalendar failed = new servicecalendar();
			failed.setServicecalendar_id(0);
			return failed;
		}
	}

}
