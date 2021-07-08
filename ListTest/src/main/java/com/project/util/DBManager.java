package com.project.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	private static DBManager ins = new DBManager();

	public static DBManager getins() {
		return ins;
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc_maria");// 바라보는 거... server.xml에 있는 resouce의 name의
																			// 이름과 동일하게 맞춰줘야 함.
			conn = ds.getConnection();
			
			// 커넥션 풀 : 다수의 사람들이 방문할 수 있도록 해준다.
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("connection 오류");
		}
		return conn;
	}
	
	// 수동 커밋 ( commit-저장되지 않은 모든 데이터를 데이터베이스에 저장하고 현재의 트랜잭션을 종료하라는 명령
		public static void commit(Connection con) {
			if (con != null) {
				try {
					con.commit();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		// 수동 롤백(Rollback- 트랜잭션의 실패로 작업을 취소하고 이전 상태로 되돌리는 데이터제어어)
		public static void rollback(Connection con) {
			try {
				con.rollback();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	// select을 수행한 후 리소스 해제를 위한 메소드
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DML(insert, update, delete)을 수행한 후 리소스 해제를 위한 메소드
	public static void close(Connection conn, Statement stmt) {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
