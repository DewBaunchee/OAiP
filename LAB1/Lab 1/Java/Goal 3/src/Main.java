import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int M, N, R;
        boolean valid = true;
        M = N = 0;

        do {
            System.out.printf("GCD of numbers: \n");
            try {
                System.out.println("m");
                M = Integer.parseInt(in.nextLine());
                System.out.println("and n");
                N = Integer.parseInt(in.nextLine());
                valid = false;
                if (N < 0 || M < 0) {
                    valid = true;
                    System.out.printf("Natural numbers are needed!");
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR");
            };
        } while (valid);

        if ( M < N ) {
            R = M;
            M = N;
            N = R;
        }

        do {
            R = M % N;
            M = N;
            N = R;
        } while ( R != 0 );

        System.out.printf ("Is: " + M);
        M = in.nextInt();
    }
}

