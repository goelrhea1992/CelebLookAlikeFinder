package bore;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;

public class SaveImageFromUrl {
	public static void main(String[] args) throws Exception {
		FileInputStream fstream = new FileInputStream("database.txt");
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String strLine;
		int i = 1;
		while ((strLine = br.readLine()) != null) {
			String[] parts = strLine.split(" |\\t");
		  	System.out.println(parts[3]);
		  	saveImage(parts[3], parts[0] + "_" +parts[1] + "_" + parts[2] +".jpg");
		  	i++;  
		}
	}

	public static void saveImage(String imageUrl, String destinationFile) throws IOException {
		try {
			URL url = new URL(imageUrl);
			long end = System.currentTimeMillis() + 30000;
			
			while(System.currentTimeMillis() < end)
			{
				InputStream is = url.openStream();
				OutputStream os = new FileOutputStream(destinationFile);
				byte[] b = new byte[2048];
				int length;
				while ((length = is.read(b)) != -1) {
					os.write(b, 0, length);
				}
				is.close();
				os.close();
			} 
		}
		catch(Exception e) {
			System.out.println(e);
			return;
		}
	}
}
