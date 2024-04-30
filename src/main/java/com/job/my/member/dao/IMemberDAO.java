package com.job.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.job.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	// 회원 가입
	public int registMember(MemberVO vo);
	// 회원 수정
	public int updateMember(MemberVO vo);
	// 로그인
	public MemberVO loginMember(MemberVO vo);
}
