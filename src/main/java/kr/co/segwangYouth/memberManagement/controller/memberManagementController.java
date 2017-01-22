package kr.co.segwangYouth.memberManagement.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.segwangYouth.memberManagement.service.MemberManagementService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class memberManagementController{
	private static final Logger logger = LoggerFactory.getLogger(memberManagementController.class);
	
	@Autowired
	private MemberManagementService service;
	
	
	@RequestMapping(value = "/memberManagement", method = RequestMethod.GET)
	public String memberManagement(Model model) throws Exception{
			logger.info("POST METHOD");
			
			Map selectList = (Map) service.selectList(null);
			model.addAttribute("selectList",selectList);
		return "memberManagement/memberManagement";
	}	

	
	@RequestMapping(value = "/memberManagement", method = RequestMethod.POST)
	public String memberManagementSearch(Model model,
			@RequestParam HashMap<String, String>searchMap
			) throws Exception{
			logger.info("POST METHOD");
			System.out.println(searchMap);
			
//			Map searchMappram =  new HashMap();
//			searchMappram = searchMap;
			
			//TODO: client에서 server로 param을 전달 할 때마다 공통적으로 사용 될
			// requestMap을 Map형태로 변환하는 모듈이필요하다.
			Map selectList = (Map) service.selectList(searchMap);
			model.addAttribute("selectList",selectList);
			
		return "memberManagement/memberManagement";
	}	
	
}
