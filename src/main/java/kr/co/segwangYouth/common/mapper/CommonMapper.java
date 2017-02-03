package kr.co.segwangYouth.common.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMapper {

    public List<Map> selectCodeList(String classCode);
    
    public List<Map> selectVillageAllList();
    
	 
}
