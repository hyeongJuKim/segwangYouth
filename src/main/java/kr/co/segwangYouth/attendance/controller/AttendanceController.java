package kr.co.segwangYouth.attendance.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.segwangYouth.attendance.service.AttendanceService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	
	@RequestMapping(value = "/attendance", method = RequestMethod.GET)
	public String attendance(Model model) throws Exception{
		
//			Map selectList = (Map) service.selectList();
//			model.addAttribute("selectList",selectList);
//			
		return "attendance/attendance";
	}	
	
}
