package com.project.action.Admin.Prod;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;


//관리자가 제품등록 할 수 있도록 하는 action class

public class AdminProdInsert implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//url은 list로 향하는 페이지 위치
		ActionForward forward = new ActionForward();
		String url = "";
		HttpSession hs =request.getSession();
		
		
		 forward.setRedirect(false); 
		 forward.setPath(url);
		 
		return forward;
		
		//dao에서 가져와서 리스트 뿌려주기.
		
	}

}
