package com.job.my.clipping.vo;

public class ClippingVO {
	private int clippingNo;
	private int recruitmentNo;
	private String memId;
	private String clippingsDate;
	
	public int getClippingNo() {
		return clippingNo;
	}
	public void setClippingNo(int clippingNo) {
		this.clippingNo = clippingNo;
	}
	public int getRecruitmentNo() {
		return recruitmentNo;
	}
	public void setRecruitmentNo(int recruitmentNo) {
		this.recruitmentNo = recruitmentNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getClippingsDate() {
		return clippingsDate;
	}
	public void setClippingsDate(String clippingsDate) {
		this.clippingsDate = clippingsDate;
	}
	@Override
	public String toString() {
		return "ClippingVO [clippingNo=" + clippingNo + ", recruitmentNo=" + recruitmentNo + ", memId=" + memId
				+ ", clippingsDate=" + clippingsDate + "]";
	}
}
