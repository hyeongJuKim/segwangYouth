package kr.co.segwangYouth.memberManagement.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.segwangYouth.common.mapper.CommonMapper;
import kr.co.segwangYouth.memberManagement.mapper.MemberManagementMapper;


@Service
public class MemberManagementService {
	
	@Autowired 
	private MemberManagementMapper mapper;
	
	@Autowired
	public CommonMapper commonMapper;
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectList(Map map) throws SQLException {
    	
    	Map<String, Object> selectList = new HashMap();
    
    	List<Map> codeListAA = commonMapper.selectCodeList("AA");	// 직책 코드 조회
    	List<Map> villageAllList = commonMapper.selectVillageAllList();	// 마을 목록 조회
    	List<Map> memberList = mapper.selectMemberList(map);	// 청년 조회
    	List<Map> memberCount = mapper.selectMemberCount();	// 마을 현황 조회
    	List<Map> statistics = mapper.selectStatistics();	// 남녀 통계
    	
    	selectList.put("codeListAA", codeListAA); // 직급코드 조회
    	selectList.put("villageAllList", villageAllList); // 마을장 조회
    	selectList.put("memberList", memberList); // 청년 조회
    	selectList.put("memberCount", memberCount); // 미을 현황 조회
    	selectList.put("statistics", statistics); // 남녀 통계
    	
		return selectList;
    }

    @SuppressWarnings("unchecked")
	public Map<String,Object> selectMemberManagementDetail(String memberSeq) throws Exception {
    	
    	Map<String,Object> memberDetail = new HashMap();	
    	
    	Map<String,String>memberDetailInfo = mapper.selectMemberDetailInfo(memberSeq);
    	List<Map> familyRelations= mapper.selectFamilyRelations(memberSeq);
    	
    	memberDetail.put("memberDetailInfo", memberDetailInfo);
    	memberDetail.put("familyRelations", familyRelations);
    	
    	return memberDetail;
    }
    
    
}
