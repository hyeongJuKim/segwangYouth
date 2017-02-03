package kr.co.segwangYouth.memberManagement.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.segwangYouth.common.mapper.CommonMapper;
import kr.co.segwangYouth.memberManagement.mapper.MemberManagementInfoMapper;


@Service
public class MemberManagementInfoService {
	
	@Autowired 
	private MemberManagementInfoMapper mapper;
	
	@Autowired
	public CommonMapper commonMapper;

	
	/**
	 * 회원정보 수정화면
	 * @param memberSeq
	 * @return
	 * @throws SQLException
	 */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectMemberDetail(String memberSeq) throws SQLException {
    	
    	Map<String, Object> selectDetail= new HashMap();
    
    	List<Map> villageAllList = commonMapper.selectVillageAllList();	// 마을 목록 조회
    	List<Map> codeListAA = commonMapper.selectCodeList("AA");	// 직책 코드 조회
    	List<Map> codeListAE = commonMapper.selectCodeList("AE");	// 세례 코드 조회
    	
    	Map<String,String> memberDetailInfo = mapper.selectMemberDetail(memberSeq); // 청년 상세조회
    	List<Map> familyRelations = mapper.selectFamilyRelations(memberSeq); // 청년 가족관계
    	
    	selectDetail.put("villageAllList", villageAllList);
    	selectDetail.put("codeListAA", codeListAA);
    	selectDetail.put("codeListAE", codeListAE);
    	selectDetail.put("memberDetailInfo", memberDetailInfo);
    	selectDetail.put("familyRelations", familyRelations);
    	
		return selectDetail;
    }	
    
	public int updateMemberInfo(Map map) throws SQLException {
		int result = 0;
		
		System.out.println(map);
		result = mapper.updateMemberInfo(map);
		
		return result;
	}


}
