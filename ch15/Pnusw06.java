package mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Pnusw06 {

	private Connection con;
	private PreparedStatement psmt;
	private Statement stmt;
	private ResultSet rs;
	private CallableStatement cs;
	
	static Scanner sc = new Scanner(System.in);
	
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
		int select = 0;
		while(select != 5) {
			System.out.print("1.학생 2.학과 3.성적 4.강의 5.종료 || 테이블울 선택하세요 : ");
			select = sc.nextInt();
			switch(select) {
				case 1:
					try {
						cs = con.prepareCall("{ call selectTable(" + select + ") }");
						rs = cs.executeQuery();
						System.out.println(String.format("%-8s %-10s %-17s %-10s", "학생번호","학생이름","주소","학과"));
						while(rs.next()) {
							System.out.println(String.format("%-10s %-10s %-15s %-10s",
									rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
						} 
					} catch(SQLException e) {
							e.printStackTrace();
							System.out.println("selectTable 중 예외 발생");
					}
					break;
				case 2:
					try {
						cs = con.prepareCall("{ call selectTable(" + select + ") }");
						rs = cs.executeQuery();
						System.out.println(String.format("%-10s %-10s", "학과", "학과사무실"));
						while(rs.next()) {
							System.out.println(String.format("%-10s %-10s",
									rs.getString(1),rs.getString(2)));
						} 
					} catch(SQLException e) {
							e.printStackTrace();
							System.out.println("selectTable 중 예외 발생");
					}
					break;
				case 3:
					try {
						cs = con.prepareCall("{ call selectTable(" + select + ") }");
						rs = cs.executeQuery();
						System.out.println(String.format("%-10s %-10s %-5s", "학생번호","강좌이름","성적"));
						while(rs.next()) {
							System.out.println(String.format("%-10s %-10s %-5s",
									rs.getInt(1),rs.getString(2),rs.getFloat(3)));
						} 
					} catch(SQLException e) {
							e.printStackTrace();
							System.out.println("selectTable 중 예외 발생");
					}
					break;
				case 4:
					try {
						cs = con.prepareCall("{ call selectTable(" + select + ") }");
						rs = cs.executeQuery();
						System.out.println(String.format("%-10s %-10s", "강좌이름","강의실"));
						while(rs.next()) {
							System.out.println(String.format("%-10s %-10s",
									rs.getString(1),rs.getString(2)));
						} 
					} catch(SQLException e) {
							e.printStackTrace();
							System.out.println("selectTable 중 예외 발생");
					}
					break;
				case 5:
					System.out.println("종료합니다.");
					break;
				default:
					System.out.println("잘못된 입력입니다. 다시 입력하세요.");
					break;
			}
		}
	}
	
	private void selectAll() {
		try {
			cs = con.prepareCall("{ call selectAll() }");
			rs = cs.executeQuery();
			System.out.println(String.format("%-5s %-5s %-12s %-10s %-10s %-10s %-10s %-2s",
					"학생번호","학생이름","주소","학과","학과사무실","강좌이름","강의실","성적"));
			while(rs.next()) {
				System.out.println(String.format("%-7s %-5s %-10s %-10s %-10s %-10s %-10s %.1f",
						rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getString(5),rs.getString(6),rs.getString(7),rs.getFloat(8)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SelectAll 중 예외 발생");
		}
	}
	
	private void insert() {
		int 학생번호;
		String 학생이름, 주소, 학과, 학과사무실, 강좌이름, 강의실;
		Float 성적;
		System.out.println("---입력할 데이터---");
		System.out.print("학생번호 : "); 학생번호 = sc.nextInt();
		System.out.print("학생이름 : "); 학생이름 = sc.next();
		System.out.print("주소 : "); 주소 = sc.next();
		System.out.print("학과 : "); 학과 = sc.next();
		System.out.print("학과사무실: "); 학과사무실 = sc.next();
		System.out.print("강좌이름 : "); 강좌이름 = sc.next();
		System.out.print("강의실 : "); 강의실 = sc.next();
		System.out.print("성적 : "); 성적 = sc.nextFloat();
		
		String input = String.format("{ call insertData(%d, '%s', '%s', '%s', '%s', '%s', '%s', %f) }",
				학생번호, 학생이름, 주소, 학과, 학과사무실, 강좌이름, 강의실, 성적);
		try {
			cs = con.prepareCall(input);
			cs.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert 중 예외 발생");
		}
	}
	
	private void update() {
		
	}
	
	private void delete() {
		
	}
	
	public static void main(String[] args) {
		Pnusw06 scon = new Pnusw06();
		int select = 0;
		while(select != 6) {
			System.out.print("1.selectAll 2.select 3.insert 4.update 5.delete 6.종료 || 입력 :");
			select = sc.nextInt();
			switch(select) {
				case 1:
					scon.selectAll();
					break;
				case 2:
					scon.select();
					break;
				case 3:
					scon.insert();
					break;
				case 4:
					scon.update();
					break;
				case 5:
					scon.delete();
					break;
				case 6:
					System.out.println("종료합니다.");
					break;
				default:
					System.out.println("잘못된 입력입니다. 다시 입력하세요.");
					break;
			}
		}
	}

}
