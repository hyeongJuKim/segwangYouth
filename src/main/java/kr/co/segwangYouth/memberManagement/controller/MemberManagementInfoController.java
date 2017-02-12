package kr.co.segwangYouth.memberManagement.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.segwangYouth.memberManagement.service.MemberManagementInfoService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class MemberManagementInfoController{
	Logger logger = Logger.getLogger(MemberManagementInfoController.class);
	
	@Autowired
	private MemberManagementInfoService service;
	
	@RequestMapping(value = "/members/{memberSeq}", method = RequestMethod.PUT, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String membersPut(
			Model model, @PathVariable("memberSeq") String memberSeq
			,@RequestBody HashMap<String,Object>memberForm
			) throws Exception{
		logger.info("memberManagementInfoPut Controller Start");
		
		System.out.println(memberForm);
//		service.updateMemberInfo(detail`Map);
		
//		Map selectDetail = service.selectMemberDetail(detailMap.get("memberSeq"));
//		model.addAttribute("selectDetail",selectDetail);
		
		Gson gson = new Gson();
		String json = gson.toJson(memberSeq);
		
		return json;
//		return "memberManagement/memberManagementInfo";
	}
			
			
	
	
}
