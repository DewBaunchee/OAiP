import java.util.Scanner;

public class Main {

    static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {
	    System.out.println("Enter number of program you want to execute: ");

	    switch(in.nextLine()) {
	        case ("1") :
                task_1();
                break;
            case ("2") :
                task_2();
                break;
            case ("3"):
                task_3();
                break;
            case ("4"):
                task_4();
                break;
        }
    }
//======================================================================================================================
    public static void task_1() {
        int[] array = new int[10];

        for (int i = 0; i < 10; i++) {
            System.out.println("Array[" + i + "]");
            array[i] = Integer.parseInt(in.nextLine());
        }
        int temp;
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 9; j++) {
                if (array[j] > array[j + 1]) {
                    temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
        }
        for (int i = 0; i < 10; i++) {
            System.out.print(array[i] + "   ");
        }
    }
//======================================================================================================================
    public static void task_2() {
        System.out.println("Enter string: ");
        String answer = "", primary = in.nextLine().toUpperCase();
        for (int i = 0; i < primary.length(); i++) {
            answer += (int) primary.charAt(i) - 'A' + 1;
        }
        System.out.println("Answer - " + answer);
    }
//======================================================================================================================
    public static void task_3() {
        System.out.println("Enter string: ");
        String primary = in.nextLine(), answer = "";
        if (primary.charAt(0) != ' ') {
            answer = answer + primary.charAt(0);
        }
        for (int i = 0; i < primary.length() - 1; i++) {
            if (primary.charAt(i) == ' ') {
                answer += primary.charAt(i + 1);
            }
        }
        System.out.println("Answer - " + answer);
    }
//======================================================================================================================
    public static void task_4() {
        int[][] matrix = new int[100][100];
        int sumBelow = 0, sumAbove = 1, bottomBorder, topBorder, counter = 0;
        while (sumBelow != sumAbove) {
            counter++;
            for (int i = 0; i < matrix.length; i++) {
                for (int j = 0; j < matrix.length; j++) {
                    matrix[i][j] = (int) (Math.random() * 10);
                }
            }
            showMatrix(matrix);
            sumAbove = 0;
            sumBelow = 0;
            bottomBorder = 1;
            topBorder = 1;
            for (int i = 0; i < matrix.length; i++) {
                for (int j = bottomBorder++; j < matrix.length; j++) {
                    sumAbove += matrix[i][j];
                }
            }
            for (int i = 1; i < matrix.length; i++) {
                for (int j = 0; j < topBorder; j++) {
                    sumBelow += matrix[i][j];
                }
                topBorder++;
            }
            if (sumAbove == sumBelow) {
                System.out.println("YES");
            } else {
                System.out.println("NO");
            }
        }
        System.out.println("Iterations until answer is true: " + counter);
    }

    public static void showMatrix(int[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.print("\n");
        }
       /*as
        while (n > 0) {
            digit = n % 10; // тут самая правая цифра                         n = 123, digit = 3;
            n = (n - n % 10) / 10; // это убирает самую правую цифру из числа n = 12,  digit = 3;
            // А вот эта ^ страшная штука это реализация дива в джаве, можешь посчитать с разными числами, чтобы понять как енто работает
            // дальше с digit на каждой итерации делаешь что тебе нужно
            // и ещё n должно быть вещественным, т.к. там деление, можно как-то иначе (без вещественного типа сделать), но я уже лёг спать так что))
            // если что завтра
        }*/
    }
}
