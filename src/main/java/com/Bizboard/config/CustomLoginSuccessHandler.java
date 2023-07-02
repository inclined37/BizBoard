package com.Bizboard.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.Bizboard.service.MemberService;
import com.Bizboard.vo.MemberAllData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.Set;

public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    
    @Autowired
    private MemberService memberService;
    
    @Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        String targetUrl = determineTargetUrl(authentication);
        
        // Spring Security 인증 정보에서 사용자 이름을 가져옵니다.
        User user = (User) authentication.getPrincipal();
        String username = user.getUsername();
        // username을 사용하여 추가적인 사용자 데이터를 불러옵니다.

        System.out.println("**********************");
        System.out.println(username);
        System.out.println("**********************");
        MemberAllData result = memberService.getOneMemberData(username);
        // 세션에 사용자 데이터를 저장 - 파일 경로 주소 , 사원번호
        HttpSession session = request.getSession();
        System.out.println("***********");
        System.out.println("파일 경로 주소"+result.getFilePath());
        System.out.println("***********");
        if(result.getFilePath() != null) {
        	session.setAttribute("profileUrl", result.getFilePath()+ File.separator + result.getFileStoredName());        
        }
        session.setAttribute("empno", result.getEmpno());
        session.setAttribute("membername", result.getMembername());
        session.setAttribute("deptno", result.getDeptno());
        session.setAttribute("deptname", result.getDname());

        if (response.isCommitted()) {
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
    }
    
    // 로그인 성공시 권한 마다 다른페이지로 이동
    protected String determineTargetUrl(Authentication authentication) {
        Set<String> authorities = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        if (authorities.contains("ROLE_ADMIN")) {
            return "/admin/main";
        } else if (authorities.contains("ROLE_USER")) {
            return "/member/main";
        } else {
            throw new IllegalStateException();
        }
    }
}
