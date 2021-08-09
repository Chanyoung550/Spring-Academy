package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberAuthMapper;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberAuthMapper authMapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;


	@Transactional
	@Override
	public void join(MemberVO member) {
		log.info("MemberService:join()");
		
		String encPw = pwencoder.encode(member.getUserpw());
		member.setUserpw(encPw);
		
		mapper.insert(member);
		// 디폴트로 ROLE_USER 부여 : 추후 권한 부여에 대한 기능 검토 필요
		AuthVO auth = new AuthVO();
		auth.setUserid(member.getUserid());
		auth.setAuth("ROLE_USER");
		authMapper.insert(auth);
	}

	@Override
	public String idCheck(String userid) {
		return mapper.idCheck(userid);
	}
}