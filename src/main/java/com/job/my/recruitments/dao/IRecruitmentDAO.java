package com.job.my.recruitments.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.job.my.recruitments.vo.RecSearchVO;
import com.job.my.recruitments.vo.RecruitmentVO;

@Mapper
public interface IRecruitmentDAO {
	// 채용정보 리스트
	public ArrayList<RecruitmentVO> getRecruitment(RecSearchVO vo);
	// 공고 글 전체 건수
	public int getTotalRowCount(RecSearchVO searchVO);
	// 추천 정보 가져오기
	public RecruitmentVO getRecommend(RecruitmentVO recruitmentVO);
}
