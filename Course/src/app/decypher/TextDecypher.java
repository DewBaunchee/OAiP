package app.decypher;

import app.Main;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.rtf.RTFEditorKit;
import java.io.*;
import java.nio.charset.StandardCharsets;

public class TextDecypher {

    static File buffFile;
    static int encryptionMethod;

    public static File decrypt(File file, String key) throws IOException, BadLocationException {
        char[] fileBytes = getTextFileContent(file).toCharArray();
        char[] keyArray = key.toCharArray();
        fileBytes = chooseDecryption(fileBytes, keyArray, encryptionMethod);
        createTextBuffFile(fileBytes, file);
        return buffFile;
    }

    private static char[] chooseDecryption(char[] fileBytes, char[] keyArray, int method) {
        switch (method) {
            case 1: return XORDecryption(fileBytes, keyArray);
            case 2: return CaesarDecryption(fileBytes, keyArray);
        }
        return null;
    }

    private static char[] CaesarDecryption(char[] fileBytes, char[] keyArray) {
        for (int i = 0; i < fileBytes.length; i++) {
            int temp;
            if ((temp = fileBytes[i] - keyArray[i % keyArray.length]) < 0) {
                fileBytes[i] = (char) (65535 + temp);
            } else {
                fileBytes[i] = (char) temp;
            }
        }
        return fileBytes;
    }

    private static char[] XORDecryption(char[] fileBytes, char[] keyArray) {
        for (int i = 0; i < fileBytes.length; i++) {
            fileBytes[i] = (char) (fileBytes[i] ^ keyArray[i % keyArray.length]);
        }
        return fileBytes;
    }

    private static String getTextFileContent(File file) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
        String in, content = "";
        br.readLine();
        encryptionMethod = Integer.parseInt(br.readLine());
        while ((in = br.readLine()) != null) {
            content = content + in + "\n";
        }
        br.close();
        return content.substring(0, content.length() - 1);
    }

    private static void createTextBuffFile(char[] fileBytes, File file) throws IOException, BadLocationException {
        switch (getExtension(file)) {
            case "doc":
            case "pdf":
            case "txt":
                createTxtBuffFile(fileBytes, file);
                break;
            case "html":
                createHTMLBuffFile(fileBytes, file);
                break;
            case "docx":
                createDocxBuffFile(fileBytes, file);
                break;
            case "rtf":
                createRTFBuffFile(fileBytes, file);
                break;
        }
    }

    private static void createRTFBuffFile(char[] fileBytes, File file) throws IOException, BadLocationException {
        buffFile = new File(Main.rootDir, "unlocked_" + getMainName(file) + ".rtf");
        RTFEditorKit editorKit = new RTFEditorKit();
        Document doc = editorKit.createDefaultDocument();

        String content = "";
        for (int i = 0; i < fileBytes.length; i++) {
            content = content + (fileBytes[i]);
        }
        doc.insertString(0, content, null);
        FileOutputStream fos = new FileOutputStream(buffFile);
        editorKit.write(fos, doc, 0, doc.getLength());
        fos.close();
    }

    private static void createDocxBuffFile(char[] fileBytes, File file) throws IOException {
        buffFile = new File(Main.rootDir, "unlocked_" + getMainName(file) + ".docx");
        XWPFDocument document = new XWPFDocument();
        String content = "";
        for (int i = 0; i < fileBytes.length; i++) {
            content = content + (fileBytes[i]);
        }
        XWPFParagraph bodyParagraph = document.createParagraph();
        XWPFRun paragraphConfig = bodyParagraph.createRun();
        paragraphConfig.setFontSize(14);
        paragraphConfig.setText(content);

        FileOutputStream out = new FileOutputStream(buffFile);
        document.write(out);
        out.close();
    }

    private static void createHTMLBuffFile(char[] fileBytes, File file) throws IOException {
        buffFile = new File(Main.rootDir, "unlocked_" + getMainName(file) + ".html");
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(buffFile), StandardCharsets.UTF_8));
        for (int i = 0; i < fileBytes.length; i++) {
            bw.write(fileBytes[i]);
        }
        bw.close();
    }

    private static void createTxtBuffFile(char[] fileBytes, File file) throws IOException {
        buffFile = new File(Main.rootDir, "unlocked_" + getMainName(file) + ".txt");
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(buffFile), StandardCharsets.UTF_8));
        for (int i = 0; i < fileBytes.length; i++) {
            bw.write(fileBytes[i]);
        }
        bw.close();
    }

    public static String getMainName(File file) {
        return file.getName().substring(0, file.getName().lastIndexOf('.'));
    }

    public static String getExtension(File file) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
        return br.readLine().trim();
    }
}
