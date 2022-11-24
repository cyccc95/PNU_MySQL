package edu;

import java.util.Scanner;

public class Controller {

	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		Service scon = new Service();
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
					scon.close();
					break;
				default:
					System.out.println("잘못된 입력입니다. 다시 입력하세요.");
					break;
			}
		}

	}

}
