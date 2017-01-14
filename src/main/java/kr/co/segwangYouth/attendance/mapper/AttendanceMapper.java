package kr.co.segwangYouth.attendance.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("attendanceMapper")
public class AttendanceMapper {
	
    @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
    
	 public List<Map> selectMemberList() {
		 return sqlSession.selectList("selectMemberList");
	}
	 
	 
}