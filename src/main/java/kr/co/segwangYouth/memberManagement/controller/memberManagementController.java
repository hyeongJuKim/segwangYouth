package kr.co.segwangYouth.memberManagement.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.segwangYouth.memberManagement.service.MemberManagementService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class memberManagementController {
	private static final Logger logger = LoggerFactory.getLogger(memberManagementController.class);
	
	@Autowired
	MemberManagementService service;
	
	
	@RequestMapping(value = "/memberManagement", method = RequestMethod.GET)
	public String memberManagement(Model model) throws Exception{
		
			Map selectList = (Map) service.selectList();
			model.addAttribute("selectList",selectList);
			
		return "memberManagement/memberManagement";
	}	
	
}
