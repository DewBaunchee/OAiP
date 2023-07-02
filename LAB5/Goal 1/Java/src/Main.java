import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Main {

    public static Scanner in = new Scanner(System.in);
    public static DblLinkedList list = new DblLinkedList();
    public static String rootDirectory = (new File("").getAbsolutePath()) + "\\";

    public static boolean hubChoosing() throws IOException {
        boolean inValid = true;

        System.out.println("Choose action:\n1. Create empty\n2. Open\n3. Save\n4. Add element\n5. Delete element\n6. View list\n7. Edit element\n8. Exit");
        do {
            switch (in.nextLine().trim()) {
                case "1":
                    createEmptyList();
                    inValid = false;
                    break;
                case "2":
                    openList();
                    inValid = false;
                    break;
                case "3":
                    saveList();
                    inValid = false;
                    break;
                case "4":
                    addElement();
                    inValid = false;
                    break;
                case "5":
                    deleteElement();
                    inValid = false;
                    break;
                case "6":
                    viewList();
                    inValid = false;
                    break;
                case "7":
                    editList();
                    inValid = false;
                    break;
                case "8":
                    return false;
                default:
                    System.out.println("Please try again.");
            }
        } while (inValid);
        return true;
    }

    public static void openList() throws IOException {
        if (list == null) {
            list = new DblLinkedList();
        } else {
            list.clear();
        }
        boolean inValid = true;
        FileReader inF = new FileReader("output.txt");
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
        while (fileScanner.hasNextLine()) {
            count++;
            if (list.add(fileScanner.nextLine())) {
                System.out.println("Error reading line #" + count);
            }
        }

        fileScanner.close();
        inF.close();
    }

    public static void saveList() throws IOException {
        boolean inValid = true;
        FileWriter outF = new FileWriter("output.txt");

        System.out.println("Enter file name:");
        do {
            try {
                outF = new FileWriter(rootDirectory + in.nextLine() + ".txt");
                inValid = false;
            } catch (Exception e) {
                System.out.println("Please try again.");
            }
        } while (inValid);
        inValid = true;
        System.out.println("Save reversed list? [YES/NO]");
        do {
            switch (in.nextLine()) {
                case "YES":
                    outF.write(list.getListForFile(true));
                    inValid = false;
                    break;
                case "NO":
                    outF.write(list.getListForFile(false));
                    inValid = false;
                    break;
                default:
                    System.out.println("Please try again.");
            }
        } while (inValid);

        outF.close();
    }

    public static void editList() {
        boolean inValid = true;
        int requiredElementIndex;
        Element current = new Element("");
        System.out.println("Enter index of element:");
        do {
            try {
                requiredElementIndex = Integer.parseInt(in.nextLine());
                current = list.getElement(requiredElementIndex);
                inValid = false;
            } catch (Exception e) {
                System.out.println("Error! Invalid data.");
            }
        } while (inValid);
        if (current != null) {
            System.out.println("Enter content:");
            inValid = current.setContent(in.nextLine());
            while (inValid) {
                System.out.println("Enter content:");
                inValid = current.setContent(in.nextLine());
            }
            System.out.println("Element edited.\n");
        }
    }

    public static void viewList() {
        boolean inValid = true;
        System.out.println("View reversed list? [YES/NO]");
        do {
            switch (in.nextLine()) {
                case "YES":
                    System.out.println(list.getList(true));
                    inValid = false;
                    break;
                case "NO":
                    System.out.println(list.getList(false));
                    inValid = false;
                    break;
                default:
                    System.out.println("Please try again.");
            }
        } while (inValid);
    }

    public static void deleteElement() {
        boolean inValid = true;
        try {
            System.out.println("Enter index of element:");
            inValid = list.delete(Integer.parseInt(in.nextLine()));
            while (inValid) {
                System.out.println("Enter index of element:");
                inValid = list.delete(Integer.parseInt(in.nextLine()));
            }
            System.out.println("Element deleted.");
        } catch (Exception e) {
            System.out.println("Error! Invalid data.");
        }
    }

    public static void addElement() {
        boolean inValid;
        System.out.println("Enter element:");
        inValid = list.add(in.nextLine());
        while (inValid) {
            System.out.println("Enter element:");
            inValid = list.add(in.nextLine());
        }
        System.out.println("Element added.\n");
    }

    public static void createEmptyList() {
        list = new DblLinkedList();
        System.out.println("Empty list created.\n");
    }

    public static void main(String[] args) throws IOException {
        boolean continueChoose = true;
        System.out.println("This program imitate work with double-linked lists.");
        while (continueChoose) {
            continueChoose = hubChoosing();
        }
        list.clear();
        System.out.println("Goodbye!");
    }
}