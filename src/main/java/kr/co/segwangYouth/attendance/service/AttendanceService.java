package kr.co.segwangYouth.attendance.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AttendanceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
    public Map selectList() throws SQLException {
    	
    	Map<String, Object> selectList = new HashMap();
    	
    	List<Map> codeListAA = sqlSession.selectList("selectCodeList","AA"); // 직급코드 조회
    	List<Map> codeListAC = sqlSession.selectList("selectCodeList","AC"); // 직급코드 조회
    	List<Map> memberList = sqlSession.selectList("selectMemberList");	// 미을 전체 조회
    	List<Map> memberCount = sqlSession.selectList("selectMemberCount");	// 미을 전체 조회
    	
    	selectList.put("codeListAA", codeListAA);
    	selectList.put("codeListAC", codeListAC);
    	selectList.put("memberList", memberList);
    	selectList.put("memberCount", memberCount);
    	
		return selectList;
    }
	
}
