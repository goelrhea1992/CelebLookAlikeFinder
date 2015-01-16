package bore;

import java.util.Scanner;

public class Parse {

	public static void main(String[] args) {
		
		System.out.println("Type");
		Scanner scan = new Scanner(System.in);
		
		String str = "Abhishek Bachan	1	http://1.bp.blogspot.com/_Y7rzCyUABeI/SNIltEyEnjI/AAAAAAAABOg/E1keU_52aFc/s400/ash_abhishek_365x470.jpg	183,60,297,174	f533da9fbd1c770428c8961f3fa48950";
		String[] parts = str.split(" |\\t");
		
		System.out.println(parts.length);
		
		for (int u = 0; u < parts.length; u++)
		{
			System.out.println(parts[u]);
		}

	}

}
