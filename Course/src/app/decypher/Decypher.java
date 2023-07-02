package app.decypher;

import javax.swing.text.BadLocationException;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashSet;

public class Decypher {

    static final HashSet<String> txtFiles = new HashSet<>(Arrays.asList("txt", "doc", "docx", "html", "pdf", "rtf"));
    static final HashSet<String> imgFiles = new HashSet<>(Arrays.asList("jpg", "jpeg", "bmp", "png", "ico", "svg"));
    static final HashSet<String> audioFiles = new HashSet<>(Arrays.asList("mp3", "wav"));
    static final HashSet<String> videoFiles = new HashSet<>(Arrays.asList("mp4", "avi", "mov", "flv"));

    public static File executeDecrypt(File file, String key) throws IOException, BadLocationException {
        String ext = getExtension(file);
        if (txtFiles.contains(ext)) {
            return TextDecypher.decrypt(file, key);
        }
        if (imgFiles.contains(ext)) {
            return ImageDecypher.decrypt(file, key);
        }
        if (audioFiles.contains(ext)) {
            //
        }
        if (videoFiles.contains(ext)) {
            //
        }
        return null;
    }

    public static String getExtension(File file) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
        return br.readLine().trim();
    }
}