package com.project.action.Admin.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="./admin?menu=login.do";
		ActionForward forward = new ActionForward();
		HttpSession se = request.getSession();
		request.setAttribute("message", "로그아웃 되었습니다.");		
		se.invalidate();
		forward.setRedirect(false);
		forward.setPath(url);
		return forward;
		
	}

}
