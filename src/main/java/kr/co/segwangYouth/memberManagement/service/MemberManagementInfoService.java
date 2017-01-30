package kr.co.segwangYouth.memberManagement.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.segwangYouth.memberManagement.mapper.MemberManagementInfoMapper;


@Service
public class MemberManagementInfoService {
	
	@Autowired 
	private MemberManagementInfoMapper mapper;
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectMemberDetail(String memberSeq) throws SQLException {
    	
    	Map<String, Object> selectDetail= new HashMap();
    
    	Map<String,String> memberDetailInfo = mapper.selectMemberDetail(memberSeq); // 청년 상세조회
    	List<Map> familyRelations = mapper.selectFamilyRelations(memberSeq); // 청년 상세조회
    	selectDetail.put("memberDetailInfo", memberDetailInfo);
    	selectDetail.put("familyRelations", familyRelations);
    	
		return selectDetail;
    }	

}
