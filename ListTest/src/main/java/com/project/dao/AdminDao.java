package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.project.dto.AdminVO;
import com.project.util.DBManager;

public class AdminDao {

	private AdminDao() {
	}
	
	private static AdminDao instance = new AdminDao();
	
	public static AdminDao getInstance() {
		return instance;
	}
	
	//관리자 로그인 메소드
		public int userCheck(String userid, String pwd) {
			int result =-1;
			String sql = "select adm_pswd from admin_info where adm_id=?";
			
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = DBManager.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, userid);
				rs = ps.executeQuery();
				if(rs.next()){
					if(rs.getString("adm_pswd")!=null && rs.getString("adm_pswd").equals(pwd)) {
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
		
		//아이디로 해당 계정 정보 가져오는 메소드
		public AdminVO getInfo(String userid) {
			AdminVO aVo = null;
			String sql = "select * from admin_info where adm_id=?";
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = DBManager.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, userid);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					aVo = new AdminVO();
					aVo.setAdm_name(rs.getString("adm_name"));
					aVo.setAdm_id(rs.getString("adm_id"));
					aVo.setAdm_type(rs.getInt("adm_type"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				of(con,ps,rs);
			}
			return aVo;
		}
			
		//비밀번호 초기화
		public int updatePswd(AdminVO aVo) {
			int re = -1;
			String sql = "update admin_info set adm_pswd=? where adm_id=?";
			Connection con = null;
			PreparedStatement ps = null;
			try {
				con = DBManager.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, aVo.getAdm_pswd());
				ps.setString(2, aVo.getAdm_id());
				re = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				of(con,ps,null);
			}
			return re;	
		}
		
		//관리자 id check
		public int idcheck(String id, String email) {
			int r = -1;
			
			String sql="select adm_id from admin_info where adm_id = ? and adm_eamil = ?";
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = DBManager.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, email);
				rs = ps.executeQuery();
				
				if(rs.next()){
						if(rs.getString("adm_id")!=null && rs.getString("adm_id").equals(id)) {
							r = 1;
						}else {
							r = 0;
						}
					}else {
						r = -1;
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					of(con,ps,rs);
				}
					
			return r;
		}
		
		//회원정보변경
		public int updateAdm(AdminVO aVo) {
			int re = -1;
			String sql = "update admin_info set adm_email=?,adm_name=?, adm_pswd=?,adm_local=?,adm_country=? where adm_id=?";
			Connection con = null;
			PreparedStatement ps = null;
			try {
				con = DBManager.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, aVo.getAdm_email());
				ps.setString(2, aVo.getAdm_name());
				ps.setString(3, aVo.getAdm_pswd());
				ps.setString(4, aVo.getAdm_local());
				ps.setString(5, aVo.getAdm_country());
				ps.setString(6, aVo.getAdm_id());
				re = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				of(con,ps,null);
			}
			return re;	
		}
		
		//관리자 추가
		public int insertAdm(AdminVO aVo) {
			int re = -1;
			String sql = "insert into admin_info(adm_id, adm_email, adm_name, adm_pswd,adm_local,adm_country,adm_type) "
					+ " values(?, ?, ?, ?, ?, ?,?)";
			Connection con = null;
			PreparedStatement ps = null;
			try {
				con = DBManager.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, aVo.getAdm_id());
				ps.setString(2, aVo.getAdm_email());
				ps.setString(3, aVo.getAdm_name());
				ps.setString(4, aVo.getAdm_pswd());
				ps.setString(5, aVo.getAdm_local());
				ps.setString(6, aVo.getAdm_country());
				ps.setInt(7, aVo.getAdm_type());
				re = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				of(con,ps,null);
			}
			return re;
		}
		
		//close 해주는 메소드 
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
