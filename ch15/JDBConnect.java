package edu;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	public CallableStatement cs;
	
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("[JDBConnect] 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[JDBConnect] 연결 중 예외 발생");
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();

			System.out.println("[JDBConnect] 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[JDBConnect] 자원 해제 중 예외 발생");
			
		}
	}
}
