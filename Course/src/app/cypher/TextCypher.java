package app.cypher;

import app.ui.Controller;
import app.Main;

import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.rtf.RTFEditorKit;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class TextCypher {

    static File buffFile;

    public static File encrypt(File file, String key) throws IOException, BadLocationException {
        char[] fileBytes = getTextFileContent(file).toCharArray();
        char[] keyArray = key.toCharArray();
        fileBytes = chooseEncryption(fileBytes, keyArray, Controller.encryptionMethod);
        createTextBuffFile(fileBytes, file, Controller.encryptionMethod);
        return buffFile;
    }

    private static char[] chooseEncryption(char[] fileBytes, char[] keyArray, int method) {
        switch (method) {
            case 1: return XOREncryption(fileBytes, keyArray);
            case 2: return CaesarEncryption(fileBytes, keyArray);
        }
        return null;
    }

    private static char[] CaesarEncryption(char[] fileBytes, char[] keyArray) {
        for (int i = 0; i < fileBytes.length; i++) {
            fileBytes[i] = (char) ((fileBytes[i] + keyArray[i % keyArray.length]) % 65535);
        }
        return fileBytes;
    }

    private static char[] XOREncryption(char[] fileBytes, char[] keyArray) {
        for (int i = 0; i < fileBytes.length; i++) {
            fileBytes[i] = (char) (fileBytes[i] ^ keyArray[i % keyArray.length]);
        }
        return fileBytes;
    }

    private static String getTextFileContent(File file) throws IOException, BadLocationException {
        switch (getExtension(file)) {
            case "txt":
            case "html":
                return getTxtFileContent(file);
            case "doc":
                return getDocFileContent(file);
            case "docx":
                return getDocxFileContent(file);
            case "pdf":
                return getPDFFileContent(file);
            case "rtf":
                return getRTFFileContent(file);
        }
        return "";
    }

    private static void createTextBuffFile(char[] fileBytes, File file, int method) throws IOException {
        buffFile = new File(Main.rootDir, "locked_" + getMainName(file) + ".vma");
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(buffFile), StandardCharsets.UTF_8));
        bw.write(getExtension(file) + "\n");
        bw.write(method + "\n");
        for (int i = 0; i < fileBytes.length; i++) {
            bw.write(fileBytes[i]);
        }
        bw.close();
    }

    private static String getRTFFileContent(File file) throws IOException, BadLocationException {
        RTFEditorKit editorKit = new RTFEditorKit();
        Document doc = editorKit.createDefaultDocument();
        editorKit.read(new FileInputStream(file), doc, 0);
        return doc.getText(0, doc.getLength());
    }

    private static String getTxtFileContent(File file) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
        String in, content = "";
        while ((in = br.readLine()) != null) {
            content = content + in + "\n";
        }
        br.close();
        return content.substring(0, content.length() - 1);
    }

    private static String getPDFFileContent(File file) throws IOException {
        PDDocument reader = PDDocument.load(file);
        PDFTextStripper ts = new PDFTextStripper();
        ts.setStartPage(1);
        ts.setEndPage(reader.getNumberOfPages());
        String answer = ts.getText(reader);
        reader.close();
        return answer;
    }

    private static String getDocFileContent(File file) throws IOException {
        WordExtractor extractor = new WordExtractor(new HWPFDocument(new FileInputStream(file)));
        String[] fileData = extractor.getParagraphText();
        String answer = "";
        for (int i = 0; i < fileData.length; i++) {
            answer = answer + fileData[i];
        }
        extractor.close();
        return answer;
    }

    private static String getDocxFileContent(File file) throws IOException {
        List<XWPFParagraph> paragraphs = new XWPFDocument(new FileInputStream(file)).getParagraphs();
        String answer = "";
        for (int i = 0; i < paragraphs.size(); i++) {
            answer = answer + paragraphs.get(i).getParagraphText() + "\n";
        }
        return answer;
    }

    public static String getExtension(File file) {
        return file.getName().substring(file.getName().lastIndexOf('.') + 1);
    }

    public static String getMainName(File file) {
        return file.getName().substring(0, file.getName().lastIndexOf('.'));
    }
}
