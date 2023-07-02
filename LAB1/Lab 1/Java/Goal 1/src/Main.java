import java.util.Scanner;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) {
        double x1, x2, y1, y2, r1, r2;
        boolean valid = true;

        Scanner in = new Scanner(System.in);
        x1 = x2 = y1 = y2 = 0;
            do {
                try {
                    System.out.println("x1: ");
                    x1 = in.nextDouble();
                    System.out.println("y1: ");
                    y1 = in.nextDouble();
                    System.out.println("x2: ");
                    x2 = in.nextDouble();
                    System.out.println("y2: ");
                    y2 = in.nextDouble();
                    valid = false;
                } catch (Exception e) {
                    System.out.println("INPUT ERROR");
                }
            } while (valid);


        r1 = Math.sqrt(x1*x1 + y1*y1);
        r2 = Math.sqrt(x2*x2 + y2*y2);

        if ( r1 == r2 ) {
            System.out.printf("%s", "Y");
        } else {
            System.out.printf("%s", "N");
        }
        r1 = in.nextDouble();
    }
}
