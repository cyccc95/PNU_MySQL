package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.CallableStatement;

public class SqlConnection {
	private Connection con;
	private PreparedStatement psmt;
	private Statement stmt;
	private ResultSet rs;
	private CallableStatement cs;
	
	static Scanner sc = new Scanner(System.in);
	
	private String 학과번호;
	private String 학과명;
	private String 전화번호;
	
	public SqlConnection() {
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
		try {
//			String query = "insert into 학과 (학과번호, 학과명, 전화번호) values (?,?,?)";
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, "05");
//			psmt.setString(2, "기계공학과");
//			psmt.setString(3, "022-200-8000");
//			psmt.executeUpdate();
			
			System.out.println("입력할 학과");
			System.out.print("학과번호 : "); 학과번호 = sc.next();
			System.out.print("학과명 : "); 학과명 = sc.next();
			System.out.print("전화번호 : "); 전화번호 = sc.next();
			
			// CallableStatement로 insert프로시저 호출
			cs = con.prepareCall("{ call insert학과(?,?,?) }");
			cs.setString(1, 학과번호);
			cs.setString(2, 학과명);
			cs.setString(3, 전화번호);
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void delete() {
		try {
//			String 학과번호 = "05";
//			String query = "delete from 학과 where 학과번호=" + 학과번호;
//			stmt = con.createStatement();
//			stmt.executeUpdate(query);

			System.out.print("삭제할 학과번호 : "); 학과번호 = sc.next();
			cs = con.prepareCall("{ call delete학과(?) }");
			cs.setString(1, 학과번호);
			cs.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void update() {
		try {
//			String 학과번호 = "05";
//			String query = "update 학과 set 전화번호=?" + " where 학과번호=" + 학과번호;
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, "022-200-7777");
//			psmt.executeUpdate();
			
			System.out.print("업데이트할 학과번호 : "); 학과번호 = sc.next();
			System.out.print("업데이트할 전화번호 : "); 전화번호 = sc.next();
			cs = con.prepareCall("{ call update학과(?,?) }");
			cs.setString(1, 전화번호);
			cs.setString(2, 학과번호);
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void select() {
		try {
//			String 학과번호 = "05";
//			String query = "select * from 학과 where 학과번호=" + 학과번호;
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(query);
			System.out.print("선택할 학과번호 : "); 학과번호 = sc.next();
			cs = con.prepareCall("{ call select학과(?) }");
			cs.setString(1, 학과번호);
			rs = cs.executeQuery();
			while(rs.next()) {
				System.out.printf("%-3s %-10s %-15s\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void show() {
		try {
//			String query = "select * from 학과";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(query);
			
			cs = con.prepareCall("{ call show학과() }");
			rs = cs.executeQuery();
			System.out.println("전체 학과");
			while(rs.next()) {
				System.out.printf("%-3s %-10s %-15s\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
		SqlConnection scon = new SqlConnection();
		int choice;
		while(true) {
			System.out.println("MySQL Java CRUD Operation");
			System.out.println("1. Insert");
			System.out.println("2. Update");
			System.out.println("3. Delete");
			System.out.println("4. Select");
			System.out.println("5. Show");
			System.out.println("6. Exit");
			System.out.print("Enter a choice : ");
			choice = sc.nextInt();
			System.out.println("----------------------------");
			switch(choice) {
				case 1 :
					scon.insert();
					break;
				case 2 :
					scon.update();
					break;
				case 3 :
					scon.delete();
					break;
				case 4 :
					scon.select();
					break;
				case 5 :
					scon.show();
					break;
				case 6 :
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
					break;
				default :
					System.out.println("잘못된 입력입니다.");
					break;
			}
			System.out.println("----------------------------");
		}
	}
}
