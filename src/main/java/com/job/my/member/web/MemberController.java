package com.job.my.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.job.my.member.service.MemberService;
import com.job.my.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}

	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}

	@RequestMapping("/myPageView")
	public String myPageView(HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "member/myPageView";
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String clippingDo(@RequestBody MemberVO vo, RedirectAttributes re) {
		try {
			MemberVO check = memberService.loginMember(vo);
			System.out.println(check);
			if (check != null) {
				return "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";
	}

	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request, MemberVO vo, RedirectAttributes re) {
		System.out.println(request.getParameter("memPw"));
		vo.setMemPw(passwordEncoder.encode(request.getParameter("memPw")));
		String pwCheck = request.getParameter("pwCheck");
		String memPw = request.getParameter("memPw");
		System.out.println(vo);
		// 아이디 체크
		if (pwCheck.equals(memPw)) {
			try {
				memberService.registMember(vo);
			} catch (Exception e) {
				return "redirect:/registView";
			}
			// RedirectAttributes 리다이렉트시 전송하고 싶은 데이터를 포함시켜서 요청할 수 있음
			re.addFlashAttribute("msg", "회원가입이 정상적으로 처리됐습니다.");
			return "redirect:/loginView";
		} else {
			re.addFlashAttribute("msg", "비밀번호를 확인해주세요.");
			return "redirect:/registView";
		}
	}

	// 로그인
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, boolean remember,  Model model,
			HttpSession session, RedirectAttributes re, HttpServletResponse resp) {

		MemberVO login = memberService.loginMember(vo);
		if (login == null) {
			re.addFlashAttribute("msg", "아이디를 확인해주세요.");
			return "redirect:/loginView";
		}
		// 첫 번째 매개변수(사용자 입력 아직 암호화가 안됨), 두 번째 매개변수(암호화가 된 비밀번호)
		boolean match = passwordEncoder.matches(vo.getMemPw(), login.getMemPw());
		if (!match) {
			re.addFlashAttribute("msg", "비밀번호를 확인해주세요.");
			return "redirect:/loginView";
		}
		session.setAttribute("login", login);
		re.addFlashAttribute("msg", login.getMemNm() + "님 환영합니다.");
		
		if(remember) {
			Cookie cookie = new Cookie("rememberId", vo.getMemId());
			resp.addCookie(cookie); // 응당하븐 객체에 담아서 전달
		}else {
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0); // 유효시간을 0으로 만드는게 쿠키를 삭제하는 방법임
			resp.addCookie(cookie);
		}
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session, RedirectAttributes re) {
		// 세션종료
		session.invalidate();
		re.addFlashAttribute("msg", "로그아웃 되셨습니다.");
		return "redirect:/";
	}

	// 회원정보 수정
	@RequestMapping("/updateDo")
	public String updateDo(MemberVO vo, Model model, HttpSession session, RedirectAttributes re) {

		MemberVO login = memberService.loginMember(vo);
		boolean match = passwordEncoder.matches(vo.getMemPw(), login.getMemPw());
		// 비밀번호 체크
		if (!match) {
			re.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/myPageView";
		} else if (match) {
			try {
				memberService.updateMember(vo);
				vo = memberService.loginMember(vo);
				session.setAttribute("login", vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("msg", "수정됐습니다.");
		}
		
		return "member/myPageView";
	}
}
