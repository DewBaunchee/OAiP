import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int N = 0, I, Sign = -1;
        double[] A = new double[10];
        boolean Invalid = true, ArrayInvalid = true;
        do {
            try {
                System.out.printf("Number of elements(<11):\n");
                N = Integer.parseInt(in.nextLine());
                if (N > 10) {
                    N = 10;
                    System.out.println("The entered number is too big. Maximum set (10).");
                };
                for (I = 0; I < N; I++) {
                    do {
                        try {
                            System.out.printf ("A[%d]:", I + 1);
                            A[I] = Double.parseDouble(in.nextLine());
                            ArrayInvalid = false;
                        } catch (Exception e) {
                            System.out.println("Invalid element");
                            I--;
                        }
                    } while (ArrayInvalid);
                }
                Invalid = false;
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            }
        } while (Invalid);
        for (I = 1; I < N; I++) {
            A[0] = A[0] + Sign*A[I];
            Sign = -Sign;
        }
        System.out.printf(A[0] + " - answer");
        N = in.nextInt();
    }
}
