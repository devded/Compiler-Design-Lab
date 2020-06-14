package Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class q5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			File file = new File("C:/eclipse/all_code/CompilerDesignT/src/Test/pro.txt");
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);

			String line, temp;
			ArrayList<String> ab = new ArrayList<String>();

			while ((line = bufferedReader.readLine()) != null) {
				ab.add(line);  //store line to arraylist
			}
			fileReader.close();

			int i, j;

			// Remove Comment
			for (i = 0; i < ab.size(); i++) {
				if ((ab.get(i).contains("//") && !ab.get(i).contains(";")) || ab.get(i).isEmpty()) {
					ab.remove(i);
				}

			}

			// Remove Inline Comment
			for (i = 0; i < ab.size(); i++) {
				if (ab.get(i).contains("//")) {
					temp = ab.get(i);
					temp = temp.substring(0, (temp.indexOf(';')) + 1); //
					ab.set(i, temp);
				}

			}

			// Remove Block Comment
			for (i = 0; i < ab.size(); i++) {

				if (ab.get(i).contains("/*")) {
					for (j = 0; j < ab.size(); j++) {

						ab.remove(ab.get(i));
						if (ab.get(i).contains("*/")) {

							ab.remove(ab.get(i));
							break;
						}
					}
				}
			}

			// Print Without Comment
			for (i = 0; i < ab.size(); i++) {
				System.out.println("Line " + (i + 1) + ": " + ab.get(i));
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
