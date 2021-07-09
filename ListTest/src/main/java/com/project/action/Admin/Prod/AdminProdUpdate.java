package com.project.action.Admin.Prod;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.dao.ProdDao;
import com.project.dto.ProdVO;

public class AdminProdUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		ProdVO vo = new ProdVO(); 
		vo.setSerial_num(request.getParameter("usrname"));
		vo.setProd_nm(request.getParameter("prodnm"));
		vo.setProd_pswd(encryptSHA256(request.getParameter("usrname")));
		vo.setProd_date(request.getParameter("proddate"));
		vo.setComp_nm(request.getParameter("compnm"));
		vo.setProd_local(request.getParameter("prodlocal"));
		vo.setProd_country(request.getParameter("prodcontry"));
		
		ProdDao dao = ProdDao.getInstance();
		dao.updateProd_info(vo);
		
		String url="./admin?menu=list.do";
		forward.setRedirect(true);
		forward.setPath(url);
		return forward;
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
