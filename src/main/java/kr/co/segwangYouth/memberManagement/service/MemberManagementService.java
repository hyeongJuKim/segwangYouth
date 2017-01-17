package kr.co.segwangYouth.memberManagement.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.segwangYouth.memberManagement.mapper.MemberManagementMapper;


@Service
public class MemberManagementService {
	
//	@Autowired
//	private SqlSessionTemplate sqlSession;	
	
	@Autowired 
	private MemberManagementMapper mapper;
	
    public Map selectList() throws Exception {
    	
    	Map<String, Object> selectList = new HashMap();
    
    	List<Map> memberList = mapper.selectMemberList();
    	List<Map> codeListAA = mapper.selectCodeList("AA");
    	List<Map> codeListAC = mapper.selectCodeList("AC");
    	List<Map> memberCount = mapper.selectMemberCount();	// 미을 전체 조회
    	
    	selectList.put("codeListAA", codeListAA); // 직급코드 조회
    	selectList.put("codeListAC", codeListAC); // 직급코드 조회
    	selectList.put("memberCount", memberCount); // 청년 통계
    	selectList.put("memberList", memberList); // 청년 조회
    	
		return selectList;
    }
	
}
