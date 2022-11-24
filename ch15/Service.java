package edu;

import java.sql.SQLException;
import java.util.Scanner;

public class Service extends JDBConnect {
	
	static Scanner sc = new Scanner(System.in);
	
	public Service() {
		super("com.mysql.cj.jdbc.Driver", "jdbc:mysql://localhost:3306/pnusw06", "root", "tiger");
	}
	
	void select() {
		int select = 0;
		while(select != 6) {
			System.out.print("1.학생테이블 2.학과테이블 3.성적테이블 4.강의테이블 5.학생 6.종료 || 선택 : ");
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
					int selStudent = 0;
					System.out.print("학생번호 입력 : "); selStudent = sc.nextInt();
					try {
						cs = con.prepareCall("{ call selectStudent(" + Integer.toString(selStudent) + ") }");
						rs = cs.executeQuery();
						System.out.println(String.format("%8s %10s %16s %11s %10s %10s %13s %8s",
								"학생번호","학생이름","주소","학과","학과사무실","강좌이름","강의실","성적"));
						while(rs.next()) {
							System.out.printf("%10s %10s %15s %10s %10s %10s %12s %10.1f \n",
									rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
									,rs.getString(5),rs.getString(6),rs.getString(7),rs.getFloat(8));
						}
					} catch(SQLException e) {
							e.printStackTrace();
							System.out.println("selectStudent 중 예외 발생");
					}
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
	
	void selectAll() {
		try {
			cs = con.prepareCall("{ call selectAll() }");
			rs = cs.executeQuery();
			System.out.println(String.format("%8s %10s %16s %11s %10s %10s %13s %8s",
					"학생번호","학생이름","주소","학과","학과사무실","강좌이름","강의실","성적"));
			while(rs.next()) {
				System.out.printf("%10s %10s %15s %10s %10s %10s %12s %10.1f \n",
						rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getString(5),rs.getString(6),rs.getString(7),rs.getFloat(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SelectAll 중 예외 발생");
		}
	}
	
	void insert() {
		int sel = 0;
		while(sel != 3) {
			System.out.print("1.학생입력 2.성적입력 3.종료 || 입력 : "); sel = sc.nextInt();
			switch(sel) {
				case 1:
					int 학생번호;
					String 학생이름, 주소, 학과;
					System.out.print("학생번호 : "); 학생번호 = sc.nextInt();
					System.out.print("학생이름 : "); 학생이름 = sc.next();
					System.out.print("주소(공백 없이 입력) : "); 주소 = sc.next();
					System.out.print("학과 : "); 학과 = sc.next();
					String input = String.format("{ call insertStudent(%d, '%s', '%s', '%s') }",
							학생번호, 학생이름, 주소, 학과);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("insertStudent 중 예외 발생");
					}
					break;
				case 2:
					String 강좌이름;
					Float 성적;
					System.out.print("학생번호 : "); 학생번호 = sc.nextInt();
					System.out.print("강좌이름 : "); 강좌이름 = sc.next();
					System.out.print("성적 : "); 성적 = sc.nextFloat();
					input = String.format("{ call insertScore(%d, '%s', '%.1f') }",
							학생번호, 강좌이름, 성적);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("insertScore 중 예외 발생");
					}
					break;
				case 3:
					System.out.println("종료합니다.");
					break;
				default :
					System.out.println("잘못된 입력입니다.");
					break;
			}
		}
		
	}
	
	void update() {
		int sel = 0;
		while(sel != 4) {
			System.out.println("업데이트할 데이터");
			System.out.print("1.학생정보-주소 2.학생정보-학과 3.성적 4.종료 || 입력 : "); sel=sc.nextInt();
			switch(sel) {
				case 1:
					int 학생번호;
					String 주소;
					System.out.print("업데이트할 학생번호 : "); 학생번호=sc.nextInt();
					System.out.print("주소(공백 없이 입력) : "); 주소=sc.next();
					String input = String.format("{ call updateAddress(%d, '%s') }", 학생번호, 주소);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("updateAddress 중 예외 발생");
					}
					break;
				case 2:
					String 학과;
					System.out.print("업데이트할 학생번호 : "); 학생번호=sc.nextInt();
					System.out.print("학과 : "); 학과=sc.next();
					input = String.format("{ call updateMajor(%d, '%s') }", 학생번호, 학과);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("updateMajor 중 예외 발생");
					}
					break;
				case 3:
					String 강좌이름;
					Float 성적;
					System.out.print("업데이트할 학생번호 : "); 학생번호=sc.nextInt();
					System.out.print("업데이트할 강좌이름 : "); 강좌이름=sc.next();
					System.out.print("성적 : "); 성적=sc.nextFloat();
					input = String.format("{ call updateScore(%d, '%s', '%f') }", 학생번호, 강좌이름, 성적);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("updateScore 중 예외 발생");
					}
					break;
				case 4:
					System.out.println("종료합니다.");
					break;
				default:
					System.out.println("잘못된 입력입니다.");
					break;
			}
		}
	}
	
	void delete() {
		int sel = 0;
		while(sel != 3) {
			System.out.println("삭제할 데이터");
			System.out.print("1.학생정보 2.성적 3.종료 || 입력 : "); sel=sc.nextInt();
			switch(sel) {
				case 1:
					int 학생번호;
					System.out.println("성적 데이터가 없는 학생만 삭제할 수 있습니다.");
					System.out.print("삭제할 학생번호 : "); 학생번호=sc.nextInt();
					String input = String.format("{ call deleteStudent(%d) }", 학생번호);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("deleteStudnet 중 예외 발생");
					}
					break;
				case 2:
					String 강좌이름;
					System.out.print("삭제할 학생번호 : "); 학생번호=sc.nextInt();
					System.out.print("삭제할 강좌이름 : "); 강좌이름=sc.next();
					input = String.format("{ call deleteScore(%d, '%s') }", 학생번호, 강좌이름);
					try {
						cs = con.prepareCall(input);
						cs.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
						System.out.println("deleteScore 중 예외 발생");
					}
					break;
				case 3:
					System.out.println("종료합니다.");
					break;
				default:
					System.out.println("잘못된 입력입니다.");
					break;
			}
			
		}
	}
}
