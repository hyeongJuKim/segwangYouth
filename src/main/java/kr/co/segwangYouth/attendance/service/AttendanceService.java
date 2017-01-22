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
	
	
    public Map selectList() throws SQLException {
    	
    	Map<String, Object> selectList = new HashMap();
    	
		return selectList;
    }
	
}
