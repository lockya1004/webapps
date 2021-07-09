package com.project.action.Admin.Prod;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.dao.ProdDao;
import com.project.dto.CountryVO;
import com.project.dto.ProdVO;

public class AdminProdUpdateForm implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String url="./product/insert_form.jsp";
		ProdDao dao = ProdDao.getInstance();
		List<CountryVO> list= dao.get_country_ko();
		String serial = request.getParameter("serial");
		
		ProdVO pvo = dao.Prod_view(serial);
		request.setAttribute("mode", "u");
		request.setAttribute("country_list",list);
		request.setAttribute("view", pvo);
		 
		forward.setRedirect(false);
		forward.setPath(url);
		return forward;
	}
	
	
}
