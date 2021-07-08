package com.project.controller.action.Admin.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.action.Action;
import com.project.controller.action.ActionForward;


public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String url="/index.jsp";
		forward.setRedirect(false);
		forward.setPath(url);
		return forward;
		
	}
		
}

