package com.project.action.Admin.Prod;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.dao.PageInfo;
import com.project.dao.ProdDao;
import com.project.dto.AdminVO;
import com.project.dto.ProdVO;

//관리자 구분에 따라 제품등록 현황리스트 보여주기
public class AdminListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		List<ProdVO> list = null;
		String url= "";
		String filter=request.getParameter("filter");
		String keyword=request.getParameter("keyword");
		int page = 1;
		int per_cnt = 10;
		int listCount=0;
		
		HttpSession hs =request.getSession();
		
		if(request.getParameter("page")!=null){
            page = Integer.parseInt(request.getParameter("page"));
		}

		if(hs.getAttribute("loginUser") == null) {
			url="/index.jsp";
		}else {
			url="/product/admin_list.jsp";
			
			AdminVO vo = (AdminVO) hs.getAttribute("loginUser");
		
			ProdDao pdao=ProdDao.getInstance();
		
			if(filter==""&&keyword==""||filter==null&&keyword==null) {
				list=pdao.listProd(vo.getAdm_id(), vo.getAdm_type(),page,per_cnt);
				listCount=pdao.get_prod_cnt(vo.getAdm_id(), vo.getAdm_type());
			}else {
				list=pdao.listProd_filter(vo.getAdm_id(), vo.getAdm_type(),filter,keyword,page,per_cnt);
				listCount=pdao.get_prod_cnt_filter(vo.getAdm_id(), vo.getAdm_type(),filter,keyword);
			}
			
			//페이지 목록 처리를 위한 계산 작업
	        // 1.전페 페이지 수 계산( (총 게시물 수/페이지 문서 수))
	        int maxPage=(int) Math.ceil((double)listCount/per_cnt);
	       
	        // 2.현재 페이지에서 보여줄 시작 페이지 번호(1,11,21,... 등) 페이지/페이지 번호 수 * 페이지번호 수 +1
	        int startPage=((int)((double)page/5))*5+1;
	        
	        // 3.현재 페이지에서 보여줄 끝 페이지 번호(10,20,30,...등)
	        int endPage=startPage+5-1;
	        
	        // 4. 마지막 페이지가 현재 페이지에서 표시할 최대 페이지 수 (전체 페이지 수) 보다
	        // 클 경우 마지막 페이지 번호를 전체 페이지 번호로 교체
	        if(endPage>maxPage) {
	            endPage=maxPage;
	        }
	       	        
	        // 계산된 페이지 정보들을 PageInfo 객체에 저장
	        PageInfo pageInfo=new PageInfo(page, maxPage, startPage, endPage, listCount);
	        // 페이지 정보 객체(PageInfo) 와 게시물 목록 저장된 객체(ArrayList<ProdVO>) 를 
	        // request 객체의 setAttribute() 메서드로 저장
	        request.setAttribute("pageInfo", pageInfo);
	        request.setAttribute("prod_list", list);
			
		}
	

		 
		 forward.setRedirect(false); 
		 forward.setPath(url);
		 
		return forward;
	}

}
