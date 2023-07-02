import java.util.Scanner;
import java.util.HashSet;
import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException {
        Scanner in = new Scanner(System.in);
	    HashSet s = new HashSet();
	    boolean valid = true;

	    System.out.println("This program filters out everything except numbers and arithmetic operations, and create new string. \n");
	    do {
	        System.out.println("Enter \"C\" if you want to input data from console or \n\"F\" if you want to input data from file");
	        switch (in.nextLine()) {
                case "C" :
                    s.add(inputData());
                    valid = false;
                    break;
                case "F" :
                    s.add(inputDataFromFile());
                    valid = false;
                    break;
            }
        } while (valid);
	    outputData(creating(s));
    }

    public static String inputData() {
        Scanner in = new Scanner(System.in);

        System.out.println("Enter string: ");
        return in.nextLine();
    }

    public static String inputDataFromFile() throws IOException {
        Scanner in = new Scanner(System.in);
        Scanner fileScanner = in;
        String s = "";
        boolean valid = true;
        FileReader inF = new FileReader("input.txt");
        do {
            try {
                System.out.println("Enter path to input file: ");
                inF = new FileReader(in.nextLine());
                fileScanner = new Scanner(inF);
                valid = false;
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (valid);
        s = fileScanner.nextLine();
        inF.close();
        System.out.println("Entered string: " + s);
        return s;
    }

    public static String creating(HashSet s) {
        String answer = "";
        for(int i = 0; i < s.length(); i++) {
            if (("" + s.charAt(i)).matches("[\\d.^!+\\-*/]*")) {
                answer += s.charAt(i);
            }
        }
        return answer;
    }
    public static void outputData(String answer) throws IOException {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter path to output file: ");
        FileWriter outF = new FileWriter(in.nextLine());
        outF.write(answer + " - answer");
        System.out.println(answer + " - answer");
        outF.close();
    }
}
