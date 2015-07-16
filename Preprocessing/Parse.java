import java.util.Scanner;

public class Parse {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String str = scan.nextLine();
		String[] parts = str.split(" |\\t");
		System.out.println(parts.length);
		for (int u = 0; u < parts.length; u++) {
			System.out.println(parts[u]);
		}
	}
}
