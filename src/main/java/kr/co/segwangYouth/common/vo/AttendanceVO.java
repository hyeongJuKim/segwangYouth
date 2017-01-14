package kr.co.segwangYouth.common.vo;

import java.util.Date;

public class AttendanceVO {
	
	private int attendanceSeq;
	private int memberSeq;
	private String thenVillageCode;
	private String worshipCode; 
	private String attendanceYn;
	private String remark;
	private Date registTs;
	private Date updateTs;
	
	public int getAttendanceSeq() {
		return attendanceSeq;
	}
	public void setAttendanceSeq(int attendanceSeq) {
		this.attendanceSeq = attendanceSeq;
	}
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getThenVillageCode() {
		return thenVillageCode;
	}
	public void setThenVillageCode(String thenVillageCode) {
		this.thenVillageCode = thenVillageCode;
	}
	public String getWorshipCode() {
		return worshipCode;
	}
	public void setWorshipCode(String worshipCode) {
		this.worshipCode = worshipCode;
	}
	public String getAttendanceYn() {
		return attendanceYn;
	}
	public void setAttendanceYn(String attendanceYn) {
		this.attendanceYn = attendanceYn;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getRegistTs() {
		return registTs;
	}
	public void setRegistTs(Date registTs) {
		this.registTs = registTs;
	}
	public Date getUpdateTs() {
		return updateTs;
	}
	public void setUpdateTs(Date updateTs) {
		this.updateTs = updateTs;
	}
	
}
