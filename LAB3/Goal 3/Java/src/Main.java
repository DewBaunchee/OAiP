import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws IOException {
        Scanner in = new Scanner(System.in);
        boolean inValid = true;
        String choice;
        int[] myArray = new int[0];
        System.out.println("This program sort entered array by simple insertions.");
        System.out.println("Select array input method: \"C\" - console");
        System.out.println("                           \"F\" - file");
        do {
            choice = in.nextLine();
            switch (choice) {
                case "C":
                    myArray = inputData();
                    inValid = false;
                    break;
                case "F":
                    myArray = inputDataFromFile();
                    inValid = false;
                    break;
                default:
                    System.out.println("Error! Try again.");
                    break;
            }
        } while (inValid);
        if (myArray.length > 0) {
            System.out.println("Entered array: \n" + printArray(myArray));
            myArray = sorting(myArray);
            outputData(myArray);
        } else {
            System.out.println("Entered array is empty or there is an input error.");
        }
    }

    public static String printArray(int[] myArray) {
        String printer = "{ ";
        for (int i = 0; i < myArray.length - 1; i++) {
            printer += myArray[i] + ", ";
        } ч
        return printer + myArray[myArray.length - 1] + " }";
    }

    public static int[] inputData() {
        Scanner in = new Scanner(System.in);
        int n = 0;
        Boolean inValid = true;
        System.out.println("Enter number of elements ( 0 < n < 21): ");
        do {
            try {
                n = Integer.parseInt(in.nextLine());
                if ((n > 20) || (n < 1)) {
                    System.out.println("Invalid number of elements");
                } else {
                    inValid = false;
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (inValid);
        inValid = true;
        int[] myArray = new int[n];
        System.out.println("Enter elements (not bigger than 100 000 000): ");
        for (int i = 0; i < myArray.length; i++) {
            do {
                try {
                    System.out.print("MyArray[" + (i + 1) + "]: ");
                    myArray[i] = Integer.parseInt(in.nextLine());
                    if (myArray[i] > 100000000) {
                        System.out.println("Element is too big");
                    } else {
                        inValid = false;
                    }
                } catch (Exception e) {
                    System.out.println("INPUT ERROR");
                }
            } while (inValid);
            inValid = true;
        }
        return myArray;
    }

    public static int[] inputDataFromFile() throws IOException {
        Scanner in = new Scanner(System.in);
        Scanner fileScanner = in;
        FileReader inF = new FileReader("input.txt");
        int n = 0;
        int[] myArray = new int[0];
        Boolean inValid = true;
        System.out.println("Enter path to input file: ");
        do {
            try {
                inF = new FileReader(in.nextLine());
                fileScanner = new Scanner(inF);
                inValid = false;
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (inValid);
        try {
            n = fileScanner.nextInt();
            if ((n > 20) || (n < 1)) {
                System.out.println("Invalid number of elements");
                return new int[0];
            }
        } catch (Exception e) {
            System.out.println("INPUT ERROR");
        }
        myArray = new int[n];
        try {
            for (int i = 0; i < myArray.length; i++) {
                myArray[i] = fileScanner.nextInt();
                if (myArray[i] > 100000000) {
                    System.out.println("One or more elements is too big");
                    return new int[0];
                }
            }
        } catch (Exception e) {
            System.out.println("INPUT ERROR");
        }
        inF.close();
        return myArray;
    }

    public static int[] sorting(int[] myArray) {
        int temp, k;
        boolean breaker = true;
        for (int i = 1; i < myArray.length; i++) {
            temp = myArray[i];
            k = i - 1;
            while (breaker && k > -1) {
                if (temp < myArray[k]) {
                    myArray[k + 1] = myArray[k];
                    myArray[k] = temp;
                    k--;
                } else {
                    breaker = false;
                }
            }
            System.out.println(i + " step of sorting:\n        " + printArray(myArray));
            breaker = true;
        }
        return myArray;
    }

    public static void outputData(int[] myArray) throws IOException {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter path to output file: ");
        FileWriter outF = new FileWriter(in.nextLine());
        System.out.println("Sorted array: \n" + printArray(myArray));
        outF.write("Sorted array: \n");
        outF.write(printArray(myArray));
        outF.close();
    }
}