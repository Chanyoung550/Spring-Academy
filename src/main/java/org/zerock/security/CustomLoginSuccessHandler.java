package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.warn("Login Success");
		List<String> rolesNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(authority -> {
			rolesNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + rolesNames);
		if(rolesNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/security/admin");
			return;
		} else if(rolesNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/security/member");
			return;
		}
		response.sendRedirect("/");
	}
}