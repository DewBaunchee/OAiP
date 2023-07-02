import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        double s, x, h;

        x = 0;
        s = 0;

        while ( x < 5) {
            x = x + 0.01;
            h = 25 - x*x;
            s = s + 0.01*h;
        }

        s = s*2;
        System.out.println(s + " - area of the figure limited by the graphs y = 25 and y = x ^ 2");
        x = in.nextDouble();
    }

}
