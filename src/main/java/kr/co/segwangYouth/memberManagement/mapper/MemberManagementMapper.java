package kr.co.segwangYouth.memberManagement.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberManagementMapper")
public class MemberManagementMapper {
	
    @Autowired
    private SqlSession sqlSession;
 
    
    //TODO: 나중에 검색조건들을 param으로 받아서 사용.
    public List<Map> selectMemberList() {
		 return sqlSession.selectList("selectMemberList");
	}
    
    public List<Map> selectCodeList(String classCode){
    	return sqlSession.selectList("selectCodeList",classCode);
    }
    
    public List<Map> selectMemberCount(){
    	return sqlSession.selectList("selectMemberCount");
    }
    
	 
	 
}