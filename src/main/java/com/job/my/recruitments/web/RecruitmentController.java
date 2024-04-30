package com.job.my.recruitments.web;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.my.clipping.service.ClippingService;
import com.job.my.clipping.vo.ClippingVO;
import com.job.my.member.service.MemberService;
import com.job.my.member.vo.MemberVO;
import com.job.my.recruitments.service.RecruitmentService;
import com.job.my.recruitments.vo.RecSearchVO;
import com.job.my.recruitments.vo.RecruitmentVO;

@Controller
public class RecruitmentController {
	@Autowired
	RecruitmentService service;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ClippingService clippingService;
	
	
	
	@RequestMapping("/recruitmentView")
	public String boardView(RecSearchVO vo, Model model, ClippingVO clippingVO,
			@ModelAttribute("recSearchVO") RecSearchVO recSearchVO, HttpSession session){
		ArrayList<RecruitmentVO>recList =  service.getRecruitment(vo);
		model.addAttribute("recList", recList);
		if (session.getAttribute("login") != null) {
			MemberVO memberVO =(MemberVO) session.getAttribute("login");
			clippingVO.setMemId(memberVO.getMemId());
			ArrayList<ClippingVO> clippingList = clippingService.getClipping(clippingVO);
			model.addAttribute("clippingList", clippingList);
			System.out.println("체크: " +clippingList);
		}
		return "home";
	}
	
	
	@RequestMapping("/recommendView")
	public String recommendView(@CookieValue("res") String res, RecruitmentVO vo, 
			ClippingVO clippingVO, Model model, HttpSession session) {
		System.out.println("쿠키값: "+res);
		String[]noList = res.split(",");
		ArrayList<RecruitmentVO> recommendList = new ArrayList<RecruitmentVO>();
		for(String no: noList) {
			RecruitmentVO newVo = new RecruitmentVO();
			newVo.setRecruitmentNo(Integer.parseInt(no));
			newVo = service.getRecommend(newVo);
			recommendList.add(newVo);
			System.out.println("no 값: "+newVo);
		}
		if (session.getAttribute("login") != null) {
			MemberVO memberVO =(MemberVO) session.getAttribute("login");
			clippingVO.setMemId(memberVO.getMemId());
			ArrayList<ClippingVO> clippingList = clippingService.getClipping(clippingVO);
			model.addAttribute("clippingList", clippingList);
			System.out.println("팝업창 클리핑 리스트:: " +clippingList);
		}
		model.addAttribute("recommendList", recommendList);
		return "myPage/recommendView";
	}
}
