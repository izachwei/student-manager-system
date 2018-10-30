package com.wj.seven.controller.filter;

import org.apache.shiro.web.servlet.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter("/*")
public class LoginFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(ServletRequest servletRequest,
                                    ServletResponse servletResponse, FilterChain filterChain)
            throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        String servletPath = ((HttpServletRequest) servletRequest).getServletPath();
        if(servletPath.endsWith(".css")||servletPath.endsWith(".js")||servletPath.endsWith(".jpg")
                ||servletPath.endsWith(".gif")||servletPath.endsWith(".png")||servletPath.endsWith("user/register")||servletPath.endsWith("user/login")||
                servletPath.endsWith("login.jsp")||servletPath.endsWith("showStudent.jsp")){
            filterChain.doFilter(servletRequest,servletResponse);
        }else if(session.getAttribute("user")==null){
            request.getRequestDispatcher("/login.jsp").forward(servletRequest,servletResponse);
        }else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }
}
