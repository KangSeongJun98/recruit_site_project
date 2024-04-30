package com.job.my.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.my.member.dao.IMemberDAO;
import com.job.my.member.vo.MemberVO;


@Service
public class MemberService {
	// Autowired 어노테이션은 자동 의존성 주입을 위해 사용
	// 클래스 필드, 생성자, 메소드에 어노테이션을 표시함으로써
	// 스프링에게 해당 타입을 자동으로 주입하도록 지시
	@Autowired
	IMemberDAO dao;

	// 회원가입
	public void registMember(MemberVO vo) throws Exception {
		int result = dao.registMember(vo);
		if (result == 0) {
			throw new Exception();
		}
	}

	// 회원조회
	public MemberVO loginMember(MemberVO vo) {
		return dao.loginMember(vo);
	}
	
	// 회원 수정
	public void updateMember(MemberVO vo) throws Exception {
		int result = dao.updateMember(vo);
		if (result == 0) {
			throw new Exception();
		}
	}
}
