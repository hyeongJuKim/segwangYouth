package kr.co.segwangYouth.common.vo;

import java.util.Date;

public class MemberVO {

	private int memberSeq;
	private String memberName;
	private String villageCoe;
	private String memberPosition;
	private Date firstAttendance;
	private Date updateTs;
	private Date registTs;
	
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getVillageCoe() {
		return villageCoe;
	}
	public void setVillageCoe(String villageCoe) {
		this.villageCoe = villageCoe;
	}
	public String getMemberPosition() {
		return memberPosition;
	}
	public void setMemberPosition(String memberPosition) {
		this.memberPosition = memberPosition;
	}
	public Date getFirstAttendance() {
		return firstAttendance;
	}
	public void setFirstAttendance(Date firstAttendance) {
		this.firstAttendance = firstAttendance;
	}
	public Date getUpdateTs() {
		return updateTs;
	}
	public void setUpdateTs(Date updateTs) {
		this.updateTs = updateTs;
	}
	public Date getRegistTs() {
		return registTs;
	}
	public void setRegistTs(Date registTs) {
		this.registTs = registTs;
	}
	
}
