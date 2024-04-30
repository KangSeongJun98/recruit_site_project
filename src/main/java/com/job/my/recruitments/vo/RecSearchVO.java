package com.job.my.recruitments.vo;


public class RecSearchVO extends PagingVO{
	private String keywords;   /* 검색어 */
	private String eduLv;	   /* 학력 분류 */
	private String locCd; 	   /* 지역 분류 */
	private String orderBy;    /* 정렬 기준 */
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getEduLv() {
		return eduLv;
	}
	public void setEduLv(String eduLv) {
		this.eduLv = eduLv;
	}
	public String getLocCd() {
		return locCd;
	}
	public void setLocCd(String locCd) {
		this.locCd = locCd;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	@Override
	public String toString() {
		return "RecSearchVO [keywords=" + keywords + ", eduLv=" + eduLv + ", locCd=" + locCd + ", orderBy=" + orderBy
				+ "]";
	}
}
