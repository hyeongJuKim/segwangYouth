package kr.co.segwangYouth.memberManagement.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger(MemberManagementInfoController.class);
	
	@Autowired
	private MemberManagementInfoService service;

	
	/**
	 * 청년 회원 조회 상세화면 (상세, 수정)
	 * @param model
	 * @param memberSeq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/memberManagementInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberManagementInfo(
			Model model,
			@RequestParam String memberSeq
			) throws Exception{
		
			System.out.println("memberManagementInfo Controller");
			
			Map selectDetail = service.selectMemberDetail(memberSeq);
			model.addAttribute("selectDetail",selectDetail);
			
			return "memberManagement/memberManagementInfo";
	}	
	
}
