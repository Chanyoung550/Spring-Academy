package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	public void insert(MemberVO member);   // 추가됨
	public String idCheck(String userid);
}