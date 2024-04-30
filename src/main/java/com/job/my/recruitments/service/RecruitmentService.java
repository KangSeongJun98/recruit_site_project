package com.job.my.recruitments.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.my.recruitments.dao.IRecruitmentDAO;
import com.job.my.recruitments.vo.RecSearchVO;
import com.job.my.recruitments.vo.RecruitmentVO;

@Service
public class RecruitmentService {
	
	@Autowired
	IRecruitmentDAO dao;
	
	// 채용정보 조회
		public ArrayList<RecruitmentVO> getRecruitment(RecSearchVO vo) {
			//검색조건에 따른 전체 건수 조회
			int total = dao.getTotalRowCount(vo);
			// 전체 건수로 paging 건수 세팅
			vo.setTotalRowCount(total);
			vo.pageSetting();
			return dao.getRecruitment(vo);
		}
	// 추천 정보 가져오기	
		public RecruitmentVO getRecommend(RecruitmentVO vo) {
			return dao.getRecommend(vo);
		}
}
