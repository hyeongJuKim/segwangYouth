package kr.co.segwangYouth.attendance.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AttendanceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
    public List<?> selectList() throws SQLException {
    	
		return sqlSession.selectList("selectMemberList");
    }
	
	
}
