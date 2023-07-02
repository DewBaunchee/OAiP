import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static Scanner in = new Scanner(System.in);
    public static ArrayList timetable = new ArrayList(0);
    public static ArrayList<String> fileList = new ArrayList<String>(0);

    public static void outToFile(ArrayList timetable) {
        boolean inValid = true;
        String fileName, timetableStr = printTimetableForFile(timetable);
        FileWriter outF;
        System.out.println("Enter name of output file:");
        do {
            try {
                fileName = in.nextLine();
                outF = new FileWriter("E:\\University\\OAiP\\LAB4\\Goal 1\\Java\\" + fileName + ".txt");
                outF.write(timetableStr);
                outF.close();
                fileList.add(fileName);
                inValid = false;
            } catch (Exception e) {
                System.out.println("Please try again");
            }
        } while (inValid);
    }

    public static String printTimetable(ArrayList timetable) {
        String answer = "";
        for (int i = 0; i < timetable.size(); i++) {
            answer = answer + (i + 1) + " record | " + ((Record) timetable.get(i)).professor + " | " + ((Record) timetable.get(i)).day + " | " + ((Record) timetable.get(i)).order + " | " + ((Record) timetable.get(i)).subject + "\n";
        }
        return answer;
    }

    private static void fileOpening() throws IOException {
        FileReader inF = new FileReader("E:\\University\\OAiP\\LAB4\\Goal 1\\Java\\vncsd.txt");
        Scanner fileScanner = new Scanner(inF);
        String reader = "";
        boolean inValid = true;
        if (fileList.size() > 0) {
            for (int i = 0; i < fileList.size(); i++) {
                System.out.println("Choose file:\n" + (i + 1) + ". " + fileList.get(i) + ".txt\n");
            }
            do {

                try {
                    reader = in.nextLine();
                    if (Integer.parseInt(reader) < fileList.size() + 1) {
                        inF = new FileReader("E:\\University\\OAiP\\LAB4\\Goal 1\\Java\\" + fileList.get(Math.abs(Integer.parseInt(reader) - 1)) + ".txt");
                        fileScanner = new Scanner(inF);
                        inValid = false;
                    } else {
                        System.out.println("Try again");
                    }
                } catch (Exception e) {
                    System.out.println("Try again");
                }
            } while (inValid);

            try {
                while (fileScanner.hasNextLine()) {
                    //  ВВОД СПІСКА
                }
            } catch (Exception e) {
                System.out.println("Try again");
            }
        }
        fileScanner.close();
        inF.close();
    }

    public static boolean hubChoosing() throws IOException {
        boolean inValid = true;

        System.out.println("Choose action:\n1. Create empty\n2. Open\n3. Save\n4. Add\n5. Delete element\n6. Exit");
        do {
            switch (in.nextLine().trim()) {
                case "1":
                    inValid = false;
                    break;
                case "2":
                    inValid = false;
                    break;
                case "3":
                    inValid = false;
                    break;
                case "4":
                    inValid = false;
                    break;
                case "5":
                    inValid = false;
                    break;
                case "6":
                    return false;
                default:
                    System.out.println("Please try again.");
            }
        } while (inValid);
        return true;
    }

    public static void main(String[] args) throws IOException {
        boolean continueChoose = true;
        System.out.println("This program imitate work with timetable.");
        while (continueChoose) {
            continueChoose = hubChoosing();
        }
        System.out.println("Goodbye!");
    }
}
