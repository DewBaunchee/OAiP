import java.util.Scanner;
import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException {
        Scanner in = new Scanner(System.in);
        String st1 = "", st2 = "";
        boolean valid = true;
        String[] reader;
        int k = 0;

        System.out.println("This program defines index of k-th match of St1 in St2. If there are no matches it should return 0 \n");
        do {
            System.out.println("Enter \"C\" if you want to input data from console or \n\"F\" if you want to input data from file");
            switch (in.nextLine()) {
                case "C" :
                    reader = inputData();
                    st1 = reader[0];
                    st2 = reader[1];
                    k = Integer.parseInt(reader[2]);
                    valid = false;
                    break;
                case "F" :
                    reader = inputDataFromFile();
                    st1 = reader[0];
                    st2 = reader[1];
                    k = Integer.parseInt(reader[2]);
                    valid = false;
                    break;
            }
        } while (valid);
        outputData(definition(st1, st2, k));
    }

    public static String[] inputData() {
        Scanner in = new Scanner(System.in);
        String st1, st2, k;

        System.out.println("Enter St1: ");
        st1 = in.nextLine();
        System.out.println("Enter St2: ");
        st2 = in.nextLine();
        System.out.println("Enter K: ");
        k = in.nextLine();

        return new String[] {st1, st2, k};
    }

    public static String[] inputDataFromFile() throws IOException {
        Scanner in = new Scanner(System.in);
        String st1 = "", st2 = "", k = "";
        boolean valid = true;
        FileReader inF = new FileReader("input.txt");
        do {
            try {
                System.out.println("Enter path to input file");
                inF = new FileReader(in.nextLine());
                Scanner fileScanner = new Scanner(inF);
                st1 = fileScanner.nextLine();
                st2 = fileScanner.nextLine();
                k = fileScanner.nextLine();
                valid = false;
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (valid);
        System.out.println("Entered St1: " + st1 + "\nEntered St2: " + st2 + "\nEntered K: " + k);
        inF.close();

        return new String[] {st1, st2, k};
    }

    public static int definition(String st1, String st2, int k ) {
        int deletedLength = 0;
        while ((k > 1) && (st2.indexOf(st1)) > -1) {
            deletedLength += st1.length() + st2.indexOf(st1);
            st2 = st2.replaceFirst(st2.substring(0, st2.indexOf(st1)) + st1, "");
            k--;
        }
        if (st2.indexOf(st1) < 0) {
            return 0;
        } else {
            return st2.indexOf(st1) + deletedLength + 1;
        }
    }

    public static void outputData(int Answer) throws IOException {
        Scanner in = new Scanner(System.in);
        FileWriter outF = new FileWriter("output.txt");
        boolean inValid = true;
        do {
            try {
                System.out.println("Enter path to output file: ");
                outF = new FileWriter(in.nextLine());
                inValid = false;
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (inValid);
        outF.write(Answer + " - answer");
        System.out.println(Answer + " - answer");
        outF.close();
    }
}
