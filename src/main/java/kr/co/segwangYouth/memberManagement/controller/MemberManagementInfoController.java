package kr.co.segwangYouth.memberManagement.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.segwangYouth.memberManagement.service.MemberManagementInfoService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class MemberManagementInfoController{
//	private static final Logger logger = LoggerFactory.getLogger(MemberManagementInfoController.class);
	Logger logger = Logger.getLogger(MemberManagementInfoController.class);
	
	@Autowired
	private MemberManagementInfoService service;
	
	@RequestMapping(value = "/memberManagementInfo", method = RequestMethod.POST)
	public String memberManagementInfoPut(
			Model model, @RequestParam HashMap<String,String>detailMap) throws Exception{
			logger.info("memberManagementInfoPut Controller Start");
		
		service.updateMemberInfo(detailMap);
		Map selectDetail = service.selectMemberDetail(detailMap.get("memberSeq"));
		
		model.addAttribute("selectDetail",selectDetail);
		
		return "memberManagement/memberManagementInfo";
	}
			
			
	
	
}
