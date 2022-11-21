package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Sqlconnection {
	Connection con;
	
	public Sqlconnection() {
		String Driver = "";
		String url="jdbc:mysql://localhost:3306/test03"; 
	    String userid="root";
	    String pwd="tiger";
	    
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	System.out.println("드라이버 로드 성공");
	    } catch (ClassNotFoundException e) {
	    	e.printStackTrace();
	    }
	    
	    try {
	    	System.out.println("데이터베이스 연결 준비...");
	    	con = DriverManager.getConnection(url, userid, pwd);
	    	System.out.println("데이터베이스 연결 성공");
	    } catch (SQLException e	) {
	    	e.printStackTrace();
	    }
	}
	private void insert() {
		String query = "insert into 학과 (학과번호, 학과명, 전화번호) values (?,?,?)";
		try {
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, "05");
			psmt.setString(2, "기계공학과");
			psmt.setString(3, "022-200-8000");
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void delete(String 학과번호) {
		String query = "delete from 학과 where 학과번호=" + 학과번호;
		try {
			Statement stmt = con.createStatement();
			stmt.executeUpdate(query);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void update(String 학과번호) {
		String query = "update 학과 set 전화번호=?" + " where 학과번호=" + 학과번호;
		try {
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, "022-200-7777");
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void select(String 학과번호) {
		String query = "select * from 학과 where 학과번호=" + 학과번호;
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				System.out.printf("%-3s %-10s %-15s\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void getQuery() {
		String query = "select * from 학과";
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("제목줄");
			while(rs.next()) {
				System.out.printf("%-3s %-10s %-15s\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
		Sqlconnection sc = new Sqlconnection();
//		sc.insert();
//		sc.delete("05");
//		sc.update("04");
		sc.select("04");
		sc.getQuery();
	}
}
