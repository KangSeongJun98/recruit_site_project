package com.job.my.clipping.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.job.my.clipping.vo.ClippingVO;

@Mapper
public interface IClippingDAO {
		// 채용정보 스크랩
		public int clipping(ClippingVO vo);
		
		// 스크랩 된 채용정보 가져오기
		public ArrayList<ClippingVO> getClipping(ClippingVO vo);
		
		// 스크랩 삭제
		public int delClipping(ClippingVO vo);

}
