import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int P = 0;
        boolean InValid = true;

        System.out.println("\nThis program converts a number from decimal to binary.\n\n");
        do {
            try {
                System.out.println("Enter natural number (<2 147 483 648): ");
                P = Integer.parseInt(in.nextLine());
                if (P > 0) {
                    InValid = false;
                } else {
                    System.out.println("Error! The entered number isn't natural.");
                }
            } catch (Exception e) {
                System.out.println("INPUT ERROR!");
            }
        } while (InValid);

        output(convert(P));
    }
    public static String convert (int P) {
        String Answer = P % 2 + "";
        P = (P - (P % 2))/2;
        while ( P > 0 ) {
            Answer = P % 2 + Answer;
            P = (P - (P % 2))/2;
        }
        return Answer;
    }
    public static void output (String Answer) {
        System.out.println("Answer: " + Answer);
    }
}
