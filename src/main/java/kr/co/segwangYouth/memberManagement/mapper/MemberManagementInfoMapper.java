package kr.co.segwangYouth.memberManagement.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberManagementInfoMapper {

    public Map selectMemberDetail(String memberSeq);
    
    public List<Map> selectFamilyRelations(String memberSeq);
    
    public int updateMemberInfo(Map map);
	 
}
