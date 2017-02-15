package kr.co.segwangYouth.memberManagement.controller;

import java.util.HashMap;
import java.util.Map;

import javax.sound.midi.SysexMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.segwangYouth.memberManagement.service.MemberManagementInfoService;
import kr.co.segwangYouth.memberManagement.service.MemberManagementService;

/**
 * 출석 컨트롤러
 *
 */

@Controller
public class MemberManagementController{
	private static final Logger logger = LoggerFactory.getLogger(MemberManagementController.class);
	
	@Autowired
	private MemberManagementService service;
	
	@Autowired
	private MemberManagementInfoService infoService;

	
	/**
	 * 청년 회원 조회
	 */
	@RequestMapping(value = "/members", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberManagementSearch(
			Model model, @RequestParam HashMap<String, String>searchMap) throws Exception{
			logger.info("POST METHOD");
			
			//TODO: client에서 server로 param을 전달 할 때마다 공통적으로 사용 될
			// requestMap을 Map형태로 변환하는 모듈이필요하다.
			Map selectList = (Map) service.selectList(searchMap);
			model.addAttribute("selectList",selectList);
			
		return "memberManagement/memberManagement";
	}	
	
	/**
	 * 청년 상세조회. 모달
	 */
	@RequestMapping(value ="/members/{memberSeq}/modal", method=RequestMethod.GET, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String memberManagementDetail(@PathVariable("memberSeq") String memberSeq) throws Exception{
		
		Map memberDetail = service.selectMemberManagementDetail(memberSeq);
		Gson gson = new Gson();
		String json = gson.toJson(memberDetail);
		
		return json;
	}
	
	
	/**
	 * 청년 회원 조회 상세화면 (상세)
	 * api/members/{memberSeq}
	 */
	@RequestMapping(value = "api/members/{memberSeq}", method = {RequestMethod.GET},produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String memberManagementInfoApi(
			Model model, @PathVariable("memberSeq") String memberSeq
			) throws Exception{
		logger.info("api/members/{memberSeq}");
		
		Gson gson = new Gson();
		String json = gson.toJson(memberSeq);
		
		return json;
	}	
	
	/**
	 * 청년 회원 조회 상세화면 (상세)
	 * members/{memberSeq}
	 */
	@RequestMapping(value = "/members/{memberSeq}", method = {RequestMethod.GET})
	public String memberManagementInfo(
			Model model, @PathVariable("memberSeq") String memberSeq
			) throws Exception{
			logger.info("members Detail");
			
			Map selectDetail = infoService.selectMemberDetail(memberSeq);
			model.addAttribute("selectDetail",selectDetail);
			
			return "memberManagement/memberManagementInfo";
	}	
	
	
}
