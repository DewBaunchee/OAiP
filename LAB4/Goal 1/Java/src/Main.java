import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.lang.Math;
import java.util.Arrays;

public class Main {

    public static Scanner in = new Scanner(System.in);
    public static int[][] matrix, bestWay = new int[0][0], currentWay;
    public static int maxSum = 1000000, i1, j1, i2, j2;
    public static final int MAX_ABS_VALUE = 100;
    public static final int MAX_LENGTH = 9;
    public static Boolean matrixReadError = false;


    public static void inputDots() {
        Boolean inValid = true;
        String reader;
        do {
            try {
                System.out.println("Coords of first dot [i1 j1]:");
                reader = in.nextLine();
                if (Integer.parseInt(reader.substring(0, reader.indexOf(" "))) > matrix.length - 1 || Integer.parseInt(reader.substring(0, reader.indexOf(" "))) < 0) {
                    System.out.println("Coord is negative or bigger than maximum");
                } else {
                    i1 = Integer.parseInt(reader.substring(0, reader.indexOf(" ")));
                    reader = reader.replace(i1 + " ", "");
                }
                if (Integer.parseInt(reader) > matrix[0].length - 1 || Integer.parseInt(reader) < 0) {
                    System.out.println("Coord is negative or bigger than maximum");
                } else {
                    j1 = Integer.parseInt(reader);
                    inValid = false;
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (inValid);
        inValid = true;
        do {
            try {
                System.out.println("Coords of second dot [i2 j2]:");
                reader = in.nextLine();
                if (Integer.parseInt(reader.substring(0, reader.indexOf(" "))) > matrix.length - 1 || Integer.parseInt(reader.substring(0, reader.indexOf(" "))) < 0) {
                    System.out.println("Coord is negative or bigger than maximum");
                } else {
                    i2 = Integer.parseInt(reader.substring(0, reader.indexOf(" ")));
                    reader = reader.replace(i2 + " ", "");
                }
                if (Integer.parseInt(reader) > matrix[0].length - 1 || Integer.parseInt(reader) < 0) {
                    System.out.println("Coord is negative or bigger than maximum");
                } else {
                    j2 = Integer.parseInt(reader);
                    inValid = false;
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (inValid);
    }

    public static String matrixToStr(int[][] myMatrix) {
        String answer = "";
        for (int i = 0; i < myMatrix.length; i++) {
            for (int j = 0; j < myMatrix[i].length; j++) {
                answer = answer + myMatrix[i][j] + " ";
            }
            answer = answer + "\n";
        }
        return answer;
    }

    public static String bestWayToStr(int[][] myMatrix) {
        String answer = "";
        answer = answer + "Step :";
        for (int i = 0; i < myMatrix[0].length; i++) {
            answer = answer + " " + (i + 1);
        }
        answer = answer + "\ni    :";
        for (int i = 0; i < myMatrix[0].length; i++) {
            answer = answer + " " + myMatrix[0][i];
        }
        answer = answer + "\nj    :";
        for (int i = 0; i < myMatrix[1].length; i++) {
            answer = answer + " " + myMatrix[1][i];
        }
        answer = answer + "\n";
        return answer;
    }

    public static int[] strToArr(String str, int len) {
        int[] arr = new int[len];
        int i = 0;
        Boolean valid = true;
        for (int j = 0; j < len; j++) {
            arr[j] = 0;
        }
        try {
            while (str.indexOf(" ") > 0 && i < len && valid) {
                if (Math.abs(Integer.parseInt(str.substring(0, str.indexOf(" ")))) > MAX_ABS_VALUE) {
                    matrixReadError = true;
                    valid = false;
                } else {
                    arr[i] = Integer.parseInt(str.substring(0, str.indexOf(" ")));
                    str = str.replace(arr[i] + " ", "");
                    i++;
                }
            }
            if (Math.abs(Integer.parseInt(str)) < MAX_ABS_VALUE + 1) {
                matrixReadError = true;
                arr[i] = Integer.parseInt(str);
            }
        } catch (Exception e) {
        }
        return arr;
    }

    public static int[][] inputMatrixFromFile() throws IOException {
        Scanner fileScanner = new Scanner(System.in);
        FileReader inF = new FileReader("E:\\University\\OAiP\\LAB4\\Goal 2\\Java\\in.txt");
        int[][] myMatrix = new int[0][0];
        Boolean inValid = true;
        int m, n;

        do {
            try {
                System.out.println("Enter input file:");
                inF = new FileReader(in.nextLine());
                fileScanner = new Scanner(inF);
                inValid = false;
            } catch (Exception e) {
                System.out.println("\nFile not found");
            }

        } while (inValid);
        if (fileScanner.hasNext()) {
            inValid = true;
            try {
                m = Integer.parseInt(fileScanner.nextLine());
                n = Integer.parseInt(fileScanner.nextLine());
                if (m > MAX_LENGTH || n > MAX_LENGTH) {
                    System.out.println("Entered size is too large");
                } else {
                    inValid = false;
                }
                myMatrix = new int[m][n];
            } catch (Exception e) {
                System.out.println("Size of matrix is incorrect");
            }

            for (int i = 0; i < myMatrix.length; i++) {
                Arrays.fill(myMatrix[i], 0);
            }

            if (!inValid) {
                int i = 0;
                try {
                    while (fileScanner.hasNextLine() && i < myMatrix.length) {
                        myMatrix[i] = strToArr(fileScanner.nextLine(), myMatrix.length);
                        i++;
                    }
                } catch (Exception e) {
                    System.out.println("One or more elements of matrix is incorrect");
                }
            }
        } else {
            System.out.println("File is empty");
        }
        inF.close();
        return myMatrix;
    }

    public static void outMatrixToFile(String sMatrix) throws IOException {
        FileWriter outF = new FileWriter("out.txt");
        Boolean inValid = true;

        do {
            try {
                outF = new FileWriter(in.nextLine());
                inValid = false;
            } catch (Exception e) {
                System.out.println("\nFile not found");
            }
        } while (inValid);

        outF.write(sMatrix);
        outF.close();
    }

    public static void findTheWay(int elementInWay, int i1S, int j1S, int sum) {
        if (i1S == i2 && j1S == j2) {
            if (maxSum == 1000000 || sum > maxSum) {
                maxSum = sum;
                bestWay = new int[2][elementInWay + 1];
                bestWay[0] = Arrays.copyOf(currentWay[0], elementInWay + 1);
                bestWay[1] = Arrays.copyOf(currentWay[1], elementInWay + 1);
            }
            ;
        } else {
            elementInWay++;
            if (i1S < i2) {
                currentWay[0][elementInWay] = i1S + 1;
                currentWay[1][elementInWay] = j1S;
                findTheWay(elementInWay, i1S + 1, j1S, sum + matrix[i1S + 1][j1S]);
            }
            if (j1S < j2) {
                currentWay[0][elementInWay] = i1S;
                currentWay[1][elementInWay] = j1S + 1;
                findTheWay(elementInWay, i1S, j1S + 1, sum + matrix[i1S][j1S + 1]);
            }
        }
    }


//    E:\University\OAiP\LAB4\Goal 2\Java\in.txt

    public static void solve() {
        int temp;
        currentWay = new int[2][matrix.length * matrix[0].length];
        if ((i1 * matrix[0].length + j1) > (i2 * matrix[0].length + j2)) {
            temp = i1;
            i1 = i2;
            i2 = temp;

            temp = j1;
            j1 = j2;
            j2 = temp;
        }
        findTheWay(0, i1, j1, matrix[i1][j1]);
        bestWay[0][0] = i1;
        bestWay[1][0] = j1;
    }

    public static void main(String[] args) throws IOException {

        matrix = inputMatrixFromFile();

        if (matrix.length > 0) {

            System.out.println("Entered matrix:");
            System.out.println(matrixToStr(matrix));
            if (matrixReadError) {
                System.out.println("There is an error during reading matrix.");
            }

            System.out.println("\nEnter begin/end dots:");
            inputDots();

            solve();
            System.out.println("\nBest way:");
            System.out.println(bestWayToStr(bestWay));

            System.out.println("Enter output file:");
            outMatrixToFile(bestWayToStr(bestWay));
        }
    }

}