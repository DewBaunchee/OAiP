package app.cypher;

import javax.swing.text.BadLocationException;
import java.io.*;
import java.util.Arrays;
import java.util.HashSet;

public class Cypher {

    static final HashSet<String> txtFiles = new HashSet<>(Arrays.asList("txt", "doc", "docx", "html", "pdf", "rtf"));
    static final HashSet<String> imgFiles = new HashSet<>(Arrays.asList("jpg", "jpeg", "bmp", "png"));
    static final HashSet<String> audioFiles = new HashSet<>(Arrays.asList("mp3", "wav"));
    static final HashSet<String> videoFiles = new HashSet<>(Arrays.asList("mp4", "avi", "mov", "flv"));

    public static File executeEncrypt(File file, String key) throws IOException, BadLocationException {
        String ext = getExtension(file);
        if (txtFiles.contains(ext)) {
            return TextCypher.encrypt(file, key);
        }
        if (imgFiles.contains(ext)) {
            return ImageCypher.encrypt(file, key);
        }
        if (audioFiles.contains(ext)) {
            //
        }
        if (videoFiles.contains(ext)) {
            //
        }
        return null;
    }

    public static String getExtension(File file) {
        return file.getName().substring(file.getName().lastIndexOf('.') + 1);
    }
}