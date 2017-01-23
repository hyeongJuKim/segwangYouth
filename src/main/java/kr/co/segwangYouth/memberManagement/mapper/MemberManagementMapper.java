package kr.co.segwangYouth.memberManagement.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberManagementMapper {

    public List<Map> selectMemberList(Map map);
    
    public List<Map> selectCodeList(String classCode);
    
    public List<Map> selectVillageAllList();
    
    public List<Map> selectMemberCount();
    
    public List<Map> selectStatistics();
    
    public Map selectMemberDetail(String memberSeq);
	 
}
