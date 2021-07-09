package com.porject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.action.Admin.Login.LoginAction;
import com.project.action.Admin.Login.LoginProcAction;
import com.project.action.Admin.Login.LogoutAction;
import com.project.action.Admin.Prod.AdminListAction;
import com.project.action.Admin.Prod.AdminProdInsertForm;
import com.project.action.Admin.Prod.AdminProdUpdate;
import com.project.action.Admin.Prod.AdminProdUpdateForm;

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
		}else if(command.equals("produpform.do")) {
			action = new AdminProdUpdateForm();
			try {
				 forward=action.execute(request, response );
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		}else if(command.equals("produp.do")) {
			action = new AdminProdUpdate();
			try {
				 forward=action.execute(request, response );
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		}else if(command.equals("listSearch.do")) {
			action = new AdminListAction();
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
