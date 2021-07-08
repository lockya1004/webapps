package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.dto.ProdVO;
import com.project.util.DBManager;

public class ProdDao {

	private ProdDao() {
	}
	
	private static ProdDao instance = new ProdDao();
	
	public static ProdDao getInstance() {
		return instance;
	}
	
	//리스트 출력
	public List<ProdVO> listProd(String id, int type,String keyword, int page,int per_cnt){
		List<ProdVO> list = new ArrayList<ProdVO>();
		
		if(keyword == null) {
			keyword="";
		}
		int startNum = (page-1)*per_cnt;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql="";
		try {
			con = DBManager.getConnection();
			
			if(type==1) {
				sql="select * from (select @rownum :=@rownum+1 as rownum, serial_num,prod_nm,prod_pswd,comp_nm,prod_date,prod_local,get_countryko(prod_country) prod_country,reg_date "
						+ "from prod_info a, (select @rownum :=0) tmp "
						+ "where serial_num like concat('%',?,'%') or prod_nm like concat('%',?,'%') or prod_date like concat('%',STR_TO_DATE(?, '%Y-%m-%d'),'%') "
						+ "or prod_local like concat('%',?,'%') or get_countryko(prod_country) like concat('%',?,'%') "
						+ " order by reg_date asc) b "
						+ " order BY b.rownum desc LIMIT ?,?";
				
				ps = con.prepareStatement(sql);
				
				ps.setString(1, keyword);
				ps.setString(2, keyword);
				ps.setString(3, keyword);
				ps.setString(4, keyword);
				ps.setString(5, keyword);
				ps.setInt(6, startNum);
				ps.setInt(7, per_cnt);
				rs = ps.executeQuery();
			}else {
				sql="select * from (select @rownum :=@rownum+1 as rownum,serial_num,prod_nm,prod_pswd,comp_nm,prod_date,prod_local,get_countryko(prod_country) prod_country,reg_date "
						+ "from prod_info a, (select @rownum :=0) tmp "
						+ "where reg_id = ? "
						+ "and (serial_num like concat('%',?,'%') or prod_nm like concat('%',?,'%') or prod_date like concat('%',STR_TO_DATE(?, '%Y-%m-%d'),'%') "
						+ "or prod_local like concat('%',?,'%') or get_countryko(prod_country) like concat('%',?,'%') ) "
						+ "order by reg_date asc)b "
						+ " order BY b.rownum desc LIMIT ?,?";
						
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, keyword);
				ps.setString(3, keyword);
				ps.setString(4, keyword);
				ps.setString(5, keyword);
				ps.setString(6, keyword);
				ps.setInt(6, startNum);
				ps.setInt(7, per_cnt);
				rs = ps.executeQuery();
			}
			
			while(rs.next()) {
				ProdVO pVo = new ProdVO();
				
				pVo.setIndex(rs.getInt("rownum"));
				pVo.setSerial_num(rs.getString("serial_num"));
				pVo.setProd_nm(rs.getString("prod_nm"));
				pVo.setProd_date(rs.getString("prod_date"));
				pVo.setComp_nm(rs.getString("comp_nm"));
				pVo.setProd_local(rs.getString("prod_local"));
				pVo.setProd_country(rs.getString("prod_country"));
				pVo.setReg_date(rs.getTimestamp("reg_date"));
				list.add(pVo);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			of(con,ps,rs);
		}
		return list;
	}
	
	public ProdVO Prod_view(String serial_num){
		ProdVO pVo = new ProdVO();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			String sql="select * from prod_info where serial_num= ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, serial_num);
			rs = ps.executeQuery();
			
			if(rs.next()) {				
				pVo.setSerial_num(rs.getString("serial_num"));
				pVo.setProd_nm(rs.getString("prod_nm"));
				pVo.setProd_date(rs.getString("prod_date"));
				pVo.setComp_nm(rs.getString("comp_nm"));
				pVo.setProd_local(rs.getString("prod_local"));
				pVo.setProd_country(rs.getString("prod_country"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			of(con,ps,rs);
		}
		return pVo;
	}
	
	//총 제품등록 개수
		public int get_prod_cnt(String id, int type,String keyword) {
			int cnt = 0;
			
			if(keyword == null) {
				keyword="";
			}
			
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql="";
			try {
				con = DBManager.getConnection();
				
				if(type==1) {
					sql="select count(*) cnt "
							+ "from prod_info "
							+ "where serial_num like concat('%',?,'%') or prod_nm like concat('%',?,'%') or prod_date like concat('%',STR_TO_DATE(?, '%Y-%m-%d'),'%') "
							+ "or prod_local like concat('%',?,'%') or get_countryko(prod_country) like concat('%',?,'%') "
							+ "order by reg_date desc";
					
					ps = con.prepareStatement(sql);
					
					ps.setString(1, keyword);
					ps.setString(2, keyword);
					ps.setString(3, keyword);
					ps.setString(4, keyword);
					ps.setString(5, keyword);
				
					rs = ps.executeQuery();
				}else {
					sql="select count(*) cnt "
							+ "from prod_info "
							+ "where reg_id = ? "
							+ "and (serial_num like concat('%',?,'%') or prod_nm like concat('%',?,'%') or prod_date like concat('%',STR_TO_DATE(?, '%Y-%m-%d'),'%') "
							+ "or prod_local like concat('%',?,'%') or get_countryko(prod_country) like concat('%',?,'%') ) "
							+ "order by reg_date desc";
							
					ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ps.setString(2, keyword);
					ps.setString(3, keyword);
					ps.setString(4, keyword);
					ps.setString(5, keyword);
					ps.setString(6, keyword);
					rs = ps.executeQuery();
				}
							
				if(rs.next()) {
					cnt=rs.getInt("cnt");
				}
				System.out.println(cnt);
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				of(con,ps,rs);
			}
			return cnt;
			
		}
	
	
	//제품등록
	public int insertProd(ProdVO pVo) {
		int re = -1;
		String sql="insert into prod_info (serial_num,prod_nm,prod_pswd,comp_nm,prod_date,prod_local,prod_country,reg_id) "
				+ " values(?, ?, ?, ?, ?, ?, ?, ?) ";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pVo.getSerial_num());
			ps.setString(2, pVo.getProd_nm());
			ps.setString(3, pVo.getProd_pswd());
			ps.setString(4, pVo.getComp_nm());
			ps.setString(5, pVo.getProd_date());
			ps.setString(6, pVo.getProd_local());
			ps.setString(7, pVo.getProd_country());
			ps.setString(8, pVo.getReg_id());
			
			re = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			of(con,ps,null);
		}
		return re;
	}
	
	//비밀번호 초기화 or 비번 변경
	public int updatePswd(ProdVO aVo) {
		int re = -1;
		String sql = "update prod_info set prod_pswd=? where serial_num=?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, aVo.getProd_pswd());
			ps.setString(2, aVo.getSerial_num());
			re = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			of(con,ps,null);
		}
		return re;	
	}
	
	//관리자가 해당 제품 등록정보 변경
	public int updateProd_info(ProdVO aVo) {
		int re = -1;
		String sql = "update prod_info set prod_nm=?, comp_nm=?,prod_date=?,prod_local=?,prod_country=? where serial_num=?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, aVo.getProd_nm());
			ps.setString(2, aVo.getComp_nm());
			ps.setString(3, aVo.getProd_date());
			ps.setString(4, aVo.getProd_local());
			ps.setString(5, aVo.getProd_country());
			ps.setString(6, aVo.getSerial_num());
			re = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			of(con,ps,null);
		}
		return re;	
	}
	
	//사용자 체크
	public int userCheck(String userid, String pwd) {
		int result =-1;
		String sql = "select prod_pswd from prod_info where serial_num=?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("prod_pswd")!=null && rs.getString("prod_pswd").equals(pwd)) {
					result = 1;
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			of(con,ps,rs);
		}
		return result;
	}
	
	
	
/////close 해주는 메소드 
		private void of(Connection con, PreparedStatement ps, ResultSet rs) {

			try {
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
}
