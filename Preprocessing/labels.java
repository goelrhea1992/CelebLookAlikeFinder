/**
* Prints all labels of in order of files in the directory of all the face 
* images, and assigning an integer label to images belonging to the same 
* celebrity. Labelling begins with 1, and each consecutive number is 
* assigned to a new celebrity found in the database.
*/

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

public class labels {

	public static void main(String args[]) {
		String thisFilename;
		String[] parts;
		int thisLabel, latestLabel = 1;
		Map<String, Integer> celebToLabel = new HashMap<String, Integer>();
		File folder = new File("C:\\Users\\Dell\\Desktop\\all");
		File[] listOfFiles = folder.listFiles();
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {
				thisFilename = listOfFiles[i].getName();
				parts = thisFilename.split("_");
				if (celebToLabel.containsKey(parts[0]))
					thisLabel = celebToLabel.get(parts[0]);
				else {
					celebToLabel.put(parts[0], latestLabel);
					thisLabel = latestLabel;
					latestLabel++;
				}
				System.out.println(thisLabel)
			}
		} 
		System.out.println("Number of distinct celebrities: "+latestLabel)
	}
}
