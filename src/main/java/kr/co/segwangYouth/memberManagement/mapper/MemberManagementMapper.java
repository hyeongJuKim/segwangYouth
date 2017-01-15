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
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
    
	 public List<Map> selectMemberList() {
		 return sqlSession.selectList("selectMemberList");
	}
	 
}