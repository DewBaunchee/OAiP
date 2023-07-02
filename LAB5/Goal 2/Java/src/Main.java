import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.security.cert.CertificateRevokedException;
import java.util.Scanner;

public class Main {

    public static Scanner in = new Scanner(System.in);
    public static BinTree tree = new BinTree();
    public static String rootDirectory = (new File("").getAbsolutePath()) + "\\";

    public static boolean hubChoosing() throws IOException {
        boolean inValid = true;

        System.out.println("Choose action:\n1. Create empty tree\n2. Open\n3. Save\n4. Add element\n5. Delete subtree\n6. View list\n7. Exit");
        do {
            switch (in.nextLine().trim()) {
                case "1":
                    createEmptyTree();
                    inValid = false;
                    break;
                case "2":
                    openTree();
                    inValid = false;
                    break;
                case "3":
                    saveTree();
                    inValid = false;
                    break;
                case "4":
                    addElement();
                    inValid = false;
                    break;
                case "5":
                    deleteSubTree();
                    inValid = false;
                    break;
                case "6":
                    viewTree();
                    inValid = false;
                    break;
                case "7":
                    return false;
                default:
                    System.out.println("Please try again.");
            }
        } while (inValid);
        return true;
    }

    public static void createEmptyTree() {
        tree = new BinTree();
    }

    public static void openTree() throws IOException {
        tree = new BinTree();
        boolean inValid = true;
        FileReader inF = new FileReader(rootDirectory + "output.txt");
        Scanner fileScanner = new Scanner(System.in);

        System.out.println("Enter file name:");
        do {
            try {
                inF = new FileReader(rootDirectory + in.nextLine() + ".txt");
                fileScanner = new Scanner(inF);
                inValid = false;
            } catch (Exception e) {
                System.out.println("Please try again.");
            }
        } while (inValid);
        int count = 0;
        String errorText = "";
        while (fileScanner.hasNextLine()) {
            try {
                count++;
                errorText = tree.add(Integer.parseInt(fileScanner.nextLine()));
                if (errorText.length() > 0) {
                    System.out.println("Error reading line #" + count + ". " + errorText);
                }
            } catch (Exception e) {
                System.out.println("Incorrect data. Line #" + count);
            }
        }

        fileScanner.close();
        inF.close();

    }

    public static void saveTree() throws IOException {
        boolean inValid = true;
        FileWriter outF = new FileWriter(rootDirectory + "output.txt");

        System.out.println("Enter file name:");
        do {
            try {
                outF = new FileWriter(rootDirectory + in.nextLine() + ".txt");
                inValid = false;
            } catch (Exception e) {
                System.out.println("Please try again.");
            }
        } while (inValid);
        String writer = tree.viewTree() + " ";
        String[] writerArray = split(writer);
        for (int i = 0; i < writerArray.length; i++) {
            outF.write(writerArray[i] + "\n");
        }
        outF.close();
    }

    public static void addElement() {
        System.out.println("Enter key (-101 < key < 101):");
        String errorText = "";
        do {
            try {
                errorText = tree.add(Integer.parseInt(in.nextLine()));
            } catch (Exception e) {
                errorText = "Incorrect data.";
            }
            if (errorText.length() > 0) {
                System.out.println(errorText + " Try again.");
            }
        } while (errorText.length() > 0);
        System.out.println("Element added.");
    }

    public static void deleteSubTree() {
        System.out.println("Enter key:");
        String errorText = "";
        do {
            errorText = tree.delete(Integer.parseInt(in.nextLine()));
            if (errorText.length() > 0) {
                System.out.println(errorText + " Try again.");
            }
        } while (errorText.length() > 0);
        System.out.println("Subtree deleted.");
    }

    public static void viewTree() {
        System.out.println(tree.viewTree());
    }

    public static void main(String[] args) throws IOException {
        boolean continueChoose = true;
        System.out.println("This program imitate work with binary trees.");
        while (continueChoose) {
            continueChoose = hubChoosing();
        }
        System.out.println("Goodbye!");
    }

    public static void addCheck(String errorText) {
        if (errorText.length() > 0) {
            System.out.println(errorText);
        }
    }

    public static String[] split(String writer) {
        String[] outputArray = new String[numOfElem(writer)];
        int i = 0;
        while (writer.length() > 0) {
            outputArray[i] = writer.substring(0, writer.indexOf(" ") + 1);
            writer = writer.replace(writer.substring(0, writer.indexOf(" ") + 1), "");
            i++;
        }
        return outputArray;
    }

    public static int numOfElem(String writer) {
        int count = 0;
        for(int i = 0; i < writer.length(); i++) {
            if (writer.charAt(i) == ' ') {
                count++;
            }
        }
        return count;
    }
}
