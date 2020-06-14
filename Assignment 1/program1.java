package Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class wew {

	public static void main(String[] args) {

		String linein[] = new String[2];  //Input

		ArrayList<String> nonterminal = new ArrayList<String>();  //For Store Nonterminal Part
		ArrayList<String> terminal = new ArrayList<String>();	//For Store Remnant Part
		ArrayList<String> output = new ArrayList<String>();
		
		//Input Part
		linein[0] = "S -> Sa | b";
		linein[1] = "A -> Ac | Sd";
		
		//Split nonterminal
		for (int i = 0; i < linein.length; i++) {
			String[] parts = linein[i].split(" -> ");
			nonterminal.add(parts[0]);
			terminal.add(parts[1]);
		}


		//Replace Part
		String a = "";

		for (int i = 1; i < terminal.size(); i++) {

			List<String> items = Arrays.asList(terminal.get(i).split(" \\| "));   //Current Items

			for (int j = 0; j < i; j++) {

				List<String> itemsad = Arrays.asList(terminal.get(j).split(" \\| "));  //Previous Items

				for (int k = 0; k < items.size(); k++) {
					if (items.get(k).contains(nonterminal.get(j))) {

						for (int l = 0; l < itemsad.size(); l++) {
							a += items.get(k).replace(nonterminal.get(j), itemsad.get(l));
							a += " | ";
							
						}
						
						terminal.set(i, terminal.get(i).replace(items.get(k), a));
						//System.out.println(a);

					}

				}

			}
			
		}

		
		
		for (int i = 0; i < terminal.size(); i++) {
			String b = "";  	//Output For A = 
			String c = "";		//Output For A'
			
			b += nonterminal.get(i) + " -> ";				//A  ->
			c += nonterminal.get(i) + "'" + " -> ";			//A' -> 
	
			String[] items = terminal.get(i).split(" \\| ");
			
			for (int k = 0; k < items.length; k++) {
				
				// Beta Detect
				if (!items[k].substring(0, 1).equals(nonterminal.get(i))) {
					b += items[k] + nonterminal.get(i) + "'" + " | ";
				}

				// Alpha Detect
				if (items[k].substring(0, 1).equals(nonterminal.get(i))) {
					c += items[k].substring(1, items[k].length()) + nonterminal.get(i) + "'" + " | ";
				}

			}

			output.add(b);
			b = "";
			output.add(c);
			c = "";

		}

		for (int k = 0; k < output.size(); k++) {
			System.out.println(output.get(k));
		}

	}

}
