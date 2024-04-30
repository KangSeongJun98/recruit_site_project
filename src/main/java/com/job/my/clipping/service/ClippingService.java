package com.job.my.clipping.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.my.clipping.dao.IClippingDAO;
import com.job.my.clipping.vo.ClippingVO;

@Service
public class ClippingService {
	@Autowired
	IClippingDAO dao;
	
	// 뉴스 스크랩
	public void clipping (ClippingVO vo) throws Exception {
		int result = dao.clipping(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	// 스크랩된 뉴스 가져오기
		public ArrayList<ClippingVO> getClipping(ClippingVO vo) {
			return dao.getClipping(vo);
		}
		
	// 스크랩 된 뉴스 삭제
	public void delClipping (ClippingVO vo) throws Exception {
		int result = dao.delClipping(vo);
		if(result == 0) {
			throw new Exception();
		}
	}	
}
