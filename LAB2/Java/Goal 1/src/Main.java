import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        final int MAX_LENGTH = 21;
        final int MAX_SIZE = 100000001;
        final int MIN_SIZE = -100000001;

        double Sum = 0;
        int i = 0, N = 0, PositiveCount = 0;
        boolean InValid = true;

        System.out.println("This program calculates arithmetic mean of all positive elements.\n");

        do {
            try {
                System.out.println("Enter number of elements (<" + MAX_LENGTH + "): ");
                N = Integer.parseInt(in.nextLine());
                if ((N > 0) && (N < MAX_LENGTH)) {
                    InValid = false;
                } else {
                    System.out.println("Error! Value is not valid.");
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR!");
            }
        } while (InValid);

        double[] A = new double[N];

        while (i < N) {
            try {
                System.out.println("Enter element A[" + (i + 1) + "] (absolute value less than " + MAX_SIZE +"):");
                A[i] = Double.parseDouble(in.nextLine());
                if ((A[i] < MAX_SIZE) && (A[i] > MIN_SIZE)) {
                    i++;
                } else {
                    System.out.println("Error! Value is not valid.");
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR!");
            }
        }
        for ( i = 0; i < N; i++) {
            if (A[i] > -1) {
                Sum = Sum + A[i];
                PositiveCount++;
            }
        }
        Sum /= PositiveCount;
        System.out.printf("%.3f - ANSWER", Sum);
    }
}
