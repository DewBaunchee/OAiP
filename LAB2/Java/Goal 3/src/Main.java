import java.io.*;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws Exception {
        Scanner in = new Scanner(System.in);

        FileReader inF = new FileReader("input.txt");
        FileWriter outF = new FileWriter("output.txt");

        int N = 0;
        boolean inValid = true;

        do {
            try {
                System.out.println("Enter input file directory: ");
                inF = new FileReader(in.nextLine());
                inValid = false;
            } catch (Exception e) {
                System.out.println("File not found");
            }
        } while (inValid);
        Scanner fileScanner = new Scanner(inF);
        try {
            N = Integer.parseInt(fileScanner.nextLine());
            inValid = true;
        } catch (Exception e) {
            outF.write("INPUT ERROR");
            System.out.println("INPUT ERROR");
        }
        String[][] A = new String[N][N];
        try {
            for(int i = 0; i < N; i++) {
                A[i] = split(fileScanner.nextLine(), N);
            }
            inValid = true;
        } catch(Exception e) {
            outF.write("INPUT ERROR");
            System.out.println("INPUT ERROR");
        }
        int j;
        if (inValid) {
            outF.write("Is entered matrix identity?\n");
            System.out.println("Is entered matrix identity?");
            for (int i = 0; i < N; i++) {
                for (j = 0; j < N - 1; j++) {
                    outF.write(A[i][j] + ", ");
                    System.out.print(A[i][j] + ", ");
                }
                outF.write(A[i][j] + "\n");
                System.out.print(A[i][j] + "\n");
            }
            if (isMatrixIdentity(A)) {
                outF.write("YES");
                System.out.print("YES");
            } else {
                outF.write("NO");
                System.out.print("NO");
            }
        }

        inF.close();
        outF.close();
    }
    public static String[] split(String str, int Size) {
        String[] A = new String[Size];
        int i = 0;
        while (str.indexOf(" ") > 0 && i < Size) {
            A[i] = str.substring(0, str.indexOf(" "));
            str = str.replaceFirst(A[i] + " ", "");
            i++;
        }
        A[i] = str;
        return A;
    }
    public static boolean isMatrixIdentity (String[][] A) {
        int col;

        for ( int row = 0; row < A.length; row++ ) {
            col = 0;
            while ( col < A[row].length) {
                if ( col == row ) {
                    if (A[row][col].equals("1")) {
                        col++;
                    } else {
                        return false;
                    }
                } else {
                    if (A[row][col].equals("0")) {
                        col++;
                    } else {
                        return false;
                    }
                }
            }
        }
        return true;
    }
}
