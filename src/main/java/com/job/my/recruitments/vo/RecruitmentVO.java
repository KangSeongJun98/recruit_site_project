package com.job.my.recruitments.vo;

public class RecruitmentVO {
	private int recruitmentNo;
	private String recruitmentTitle;
	private String recruitmentUrl;
	private String companyNm;
	private String industryCode;
	private String industryName;
	private String companyLocation;
	private String locationCode;
	private String jobMidCode;
	private String educationLevel;
	private String educationCode;
	private String experienceLevel;
	private String experienceCode;
	private String salary;
	private String postingDate;
	private String expirationDate;
	public int getRecruitmentNo() {
		return recruitmentNo;
	}
	public void setRecruitmentNo(int recruitmentNo) {
		this.recruitmentNo = recruitmentNo;
	}
	public String getRecruitmentTitle() {
		return recruitmentTitle;
	}
	public void setRecruitmentTitle(String recruitmentTitle) {
		this.recruitmentTitle = recruitmentTitle;
	}
	public String getRecruitmentUrl() {
		return recruitmentUrl;
	}
	public void setRecruitmentUrl(String recruitmentUrl) {
		this.recruitmentUrl = recruitmentUrl;
	}
	public String getCompanyNm() {
		return companyNm;
	}
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}
	public String getIndustryCode() {
		return industryCode;
	}
	public void setIndustryCode(String industryCode) {
		this.industryCode = industryCode;
	}
	public String getIndustryName() {
		return industryName;
	}
	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}
	public String getCompanyLocation() {
		return companyLocation;
	}
	public void setCompanyLocation(String companyLocation) {
		this.companyLocation = companyLocation;
	}
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}
	public String getJobMidCode() {
		return jobMidCode;
	}
	public void setJobMidCode(String jobMidCode) {
		this.jobMidCode = jobMidCode;
	}
	public String getEducationLevel() {
		return educationLevel;
	}
	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}
	public String getEducationCode() {
		return educationCode;
	}
	public void setEducationCode(String educationCode) {
		this.educationCode = educationCode;
	}
	public String getExperienceLevel() {
		return experienceLevel;
	}
	public void setExperienceLevel(String experienceLevel) {
		this.experienceLevel = experienceLevel;
	}
	public String getExperienceCode() {
		return experienceCode;
	}
	public void setExperienceCode(String experienceCode) {
		this.experienceCode = experienceCode;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getPostingDate() {
		return postingDate;
	}
	public void setPostingDate(String postingDate) {
		this.postingDate = postingDate;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	@Override
	public String toString() {
		return "RecruitmentVO [recruitmentNo=" + recruitmentNo + ", recruitmentTitle=" + recruitmentTitle
				+ ", recruitmentUrl=" + recruitmentUrl + ", companyNm=" + companyNm + ", industryCode=" + industryCode
				+ ", industryName=" + industryName + ", companyLocation=" + companyLocation + ", locationCode="
				+ locationCode + ", jobMidCode=" + jobMidCode + ", educationLevel=" + educationLevel
				+ ", educationCode=" + educationCode + ", experienceLevel=" + experienceLevel + ", experienceCode="
				+ experienceCode + ", salary=" + salary + ", postingDate=" + postingDate + ", expirationDate="
				+ expirationDate + "]";
	}
	
}
