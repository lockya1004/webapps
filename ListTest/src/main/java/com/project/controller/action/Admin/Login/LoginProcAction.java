package com.project.controller.action.Admin.Login;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.controller.action.Action;
import com.project.controller.action.ActionForward;
import com.project.dao.AdminDao;
import com.project.dto.AdminVO;

public class LoginProcAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession se = request.getSession();
		
		if(se.getAttribute("loginUser")==null) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pass");
			//비번 암호화
				pw = encryptSHA256(pw);
	
				AdminDao dao = AdminDao.getInstance();
				
				int r = dao.userCheck(id, pw);
				
				if(r==1) {
					String url="./admin?menu=list.do";
					AdminVO vo = dao.getInfo(id);
					se.setAttribute("loginUser", vo);
					se.setAttribute("ok", "ok");
					forward.setRedirect(true);
					forward.setPath(url);
					return forward;
	
				}else if(r==0) {
					String url="./admin?menu=login.do";
					request.setAttribute("message", "비밀번호가 맞지 않습니다.");	
					forward.setRedirect(false);
					forward.setPath(url);
					return forward;
				}else if(r==-1) {
					String url="./admin?menu=login.do";
					request.setAttribute("message", "존재하지 않는 회원입니다");
					forward.setRedirect(false);
					forward.setPath(url);
					return forward;
					
				}
		}else {
			String url="./admin?menu=list.do";
			forward.setRedirect(true);
			forward.setPath(url);
			return forward;
		}
			
			return null;
		
	}
	
	public String encryptSHA256(String str){
		String sha = "";
		try {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(str.getBytes());
		byte bytedata[] = md.digest();
		StringBuffer sb = new StringBuffer();
		for(int i =0 ; i<bytedata.length;i++) {
			sb.append(Integer.toString((bytedata[i]&0xff)+0x100,16).substring(1));
		}
			
			sha = sb.toString();
		}catch(NoSuchAlgorithmException e) {
			System.out.println("error");
			sha= null;
		}
		return sha;
	}
		
	
}
