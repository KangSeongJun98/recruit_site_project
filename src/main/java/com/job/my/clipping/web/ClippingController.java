package com.job.my.clipping.web;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.my.clipping.service.ClippingService;
import com.job.my.clipping.vo.ClippingVO;
import com.job.my.member.vo.MemberVO;

@Controller
public class ClippingController {

	@Autowired
	ClippingService clippingService;
	
	// 스크랩 페이지로 이동
	@RequestMapping("/clippingView")
	public String clippingView(HttpSession session, ClippingVO vo, Model model) {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			return "member/loginView";
		}
		vo.setMemId(login.getMemId());
		ArrayList<ClippingVO> clippingList = clippingService.getClipping(vo);
		model.addAttribute("clippingList", clippingList);
		System.out.println(clippingList);
		return "myPage/clippingView";
	}

	// 스크랩된 정보 조회
	@RequestMapping("/getClipping")
	public String getClipping(ClippingVO vo, Model model, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			return "member/loginView";
		}
		vo.setMemId(login.getMemId());
		ArrayList<ClippingVO> clippingList = clippingService.getClipping(vo);
		model.addAttribute("clippingList", clippingList);

		return "news/clippingView";
	}

	// 채용 스크랩
	@ResponseBody
	@RequestMapping(value = "/clippingDo", method = RequestMethod.POST)
	public String clippingDo(@RequestBody ClippingVO vo, RedirectAttributes re, Model model) {
		try {
			clippingService.clipping(vo);
			 ArrayList<ClippingVO> clippingList = clippingService.getClipping(vo);
			 model.addAttribute("clippingList", clippingList);
			return "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "N";

	}

	// 스크랩된 채용 삭제
	@ResponseBody
	@RequestMapping(value = "/clippingDel", method = RequestMethod.POST)
	public String clippingDel(@RequestBody ClippingVO vo, RedirectAttributes re, Model model) {
		try {
			System.out.println("del 체크: "+ vo);
			clippingService.delClipping(vo);
			return "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "N";
	}
}
