import java.util.Scanner;
import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader inF = new FileReader("inFile.txt");
        FileWriter outF = new FileWriter("outFile.txt");
        boolean inValid = true;
        int N = 0, M = 0;
        int[] A = new int[0], B = new int[0];
        Scanner in = new Scanner(System.in);
        do {
            try {
                System.out.println("Enter input file directory: ");
                inF = new FileReader(in.nextLine());
                System.out.println("Enter output file directory: ");
                outF = new FileWriter(in.nextLine());
                inValid = false;
            } catch (Exception e) {
                System.out.println("File not found");
            }
        } while (inValid);
        Scanner fileScanner = new Scanner(inF);
        try {
            N = Integer.parseInt(fileScanner.nextLine());
            M = Integer.parseInt(fileScanner.nextLine());
            A = new int[N];
            B = new int[M];
        } catch (Exception e) {
            inValid = false;
        }
        try {
            A = splitToInt(fileScanner.nextLine(), N);
            B = splitToInt(fileScanner.nextLine(), M);
        } catch (Exception e) {
            inValid = false;
        }
        if (inValid) {
            outF.write("INPUT ERROR");
            System.out.println("INPUT ERROR");
        } else {
            A = sort(A);
            B = sort(B);
            arrOut(sort(arrConcat(A, B)), outF);
        }

        inF.close();
        outF.close();
    }
    public static int[] sort(int[] arr) throws Exception {
        int Value, i, j;
        for (i = 0; i < arr.length; i++) {
            for (j = 0; j < arr.length; j++) {
                if (arr[i] < arr[j]) {
                    Value = arr[j];
                    arr[j] = arr[i];
                    arr[i] = Value;
                }
            }
        }
        return arr;
    }
    public static int[] splitToInt(String str, int Size) throws Exception {
        int[] A = new int[Size];
        int i = 0;
        while (str.indexOf(", ") > 0 && i < Size) {
            A[i] = Integer.parseInt(str.substring(0, str.indexOf(", ")));
            str = str.replace(A[i] + ", ", "");
            i++;
        }
        A[i] = Integer.parseInt(str);
        return A;
    }
    public static int[] arrConcat(int[] A, int[] B) throws Exception {
        int i;
        int[] C = new int[A.length + B.length];

        for (i = 0; i < A.length; i++) {
            C[i] = A[i];
        }
        for (i = A.length; i - A.length < B.length; i++) {
            C[i] = B[i - A.length];
        }
        return C;
    }
    public static void arrOut(int[] arr, FileWriter outF) throws Exception {
        int i;
        String str;

        str = "[" + arr[0];
        for (i = 1; i < arr.length; i++) {
            str = str + ", " + arr[i];
        }
        str += "]";
        outF.write(str);
        System.out.println(str);
    }
}