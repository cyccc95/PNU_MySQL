package mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Pnusw06 {

	private Connection con;
	private PreparedStatement psmt;
	private Statement stmt;
	private ResultSet rs;
	private CallableStatement cs;
	
	public Pnusw06() {
		String Driver = "";
		String url="jdbc:mysql://localhost:3306/pnusw06"; 
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
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	}
	
	private void select() {
		
	}
	
	private void selectAll() {
		try {
			cs = con.prepareCall("{ call selectAll() }");
			rs = cs.executeQuery();
			while(rs.next()) {
				System.out.printf("%-5s %-5s %-10s %-10s %-10s %-10s %-10s %.1f\n",
						rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getString(5),rs.getString(6),rs.getString(7),rs.getFloat(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SelectAll 예외 발생");
		}
	}
	
	private void insert() {
		
	}
	
	private void update() {
		
	}
	
	private void delete() {
		
	}
	
	public static void main(String[] args) {
		Pnusw06 scon = new Pnusw06();
		scon.selectAll();
	}

}
