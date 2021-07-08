package com.porject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.action.Action;
import com.project.controller.action.ActionForward;
import com.project.controller.action.Admin.Login.LoginAction;
import com.project.controller.action.Admin.Login.LoginProcAction;
import com.project.controller.action.Admin.Login.LogoutAction;
import com.project.controller.action.Admin.Prod.AdminListAction;
import com.project.controller.action.Admin.Prod.AdminProdInsertForm;

@WebServlet("/admin")
public class AdminListServlet extends HttpServlet implements Servlet{

	private static final long serialVersionUID = 1L;

	
	public AdminListServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String command = request.getParameter("menu");
	  getAction(command,request,response);
	  
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		
	
	}	
	
	public void getAction(String command,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("login.do")) {
			action=new LoginAction();
			 try {
				 forward=action.execute(request, response );
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 
		}else if(command.equals("list.do")) {
			action = new AdminListAction();
			try{
				 forward = action.execute(request, response); // redirect, forward인지 값을 반환
			 }catch(Exception e){
				 e.printStackTrace();
			 }
		}else if(command.equals("loginProc.do")) {
				action=new LoginProcAction();
			 try {
				 forward=action.execute(request, response );
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		}else if(command.equals("logout.do")) {
			action = new LogoutAction();
			try {
				 forward=action.execute(request, response );
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		}else if(command.equals("prodform.do")) {
			action = new AdminProdInsertForm();
			try {
				 forward=action.execute(request, response );
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		}
		
		 if(forward.isRedirect()){ // 센드리다이렉트 방식
			 response.sendRedirect(forward.getPath());
		 }else{ // 포워드
			 RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			 dispatcher.forward(request, response);
		 }
	
	}
	
}
