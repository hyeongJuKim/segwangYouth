package kr.co.segwangYouth.memberManagement.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.segwangYouth.memberManagement.mapper.MemberManagementMapper;


@Service
public class MemberManagementService {
	
	@Autowired 
	private MemberManagementMapper mapper;
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectList(Map map) throws SQLException {
    	
    	Map<String, Object> selectList = new HashMap();
    
    	List<Map> codeListAA = mapper.selectCodeList("AA");	// 직책 코드 조회
    	List<Map> villageAllList = mapper.selectVillageAllList();	// 마을 목록 조회
    	List<Map> memberList = mapper.selectMemberList(map);	// 청년 조회
    	List<Map> memberCount = mapper.selectMemberCount();	// 미을 현황 조회
    	List<Map> statistics = mapper.selectStatistics();	// 남녀 통계
    	
    	selectList.put("codeListAA", codeListAA); // 직급코드 조회
    	selectList.put("villageAllList", villageAllList); // 마을장 조회
    	selectList.put("memberList", memberList); // 청년 조회
    	selectList.put("memberCount", memberCount); // 미을 현황 조회
    	selectList.put("statistics", statistics); // 남녀 통계
    	
		return selectList;
    }

    @SuppressWarnings("unchecked")
	public Map selectMemberManagementDetail(String memberSeq) throws Exception {
    	Map<String,String> memberDetail = new HashMap();	
    	memberDetail = mapper.selectMemberDetail(memberSeq);
    	
    	return memberDetail;
    }
    
    
}
