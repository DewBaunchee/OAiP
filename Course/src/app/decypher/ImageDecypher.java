package app.decypher;

import app.ui.Controller;
import app.Main;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class ImageDecypher {

    static File buffFile;
    static int imgWidth, imgHeight, imgType;

    public static File decrypt(File file, String key) throws IOException {
        int[] fileBytes = getImageFileContent(file);
        int[] keyArray = keyEnhancing(getCodes(key), fileBytes);

        for (int i = 0; i < fileBytes.length; i++) {
            fileBytes[i] = fileBytes[i] ^ keyArray[i];
        }

        createImageBuffFile(fileBytes, file);
        return buffFile;
    }

    private static int[] keyEnhancing(short[] codes, int[] fileBytes) {
        int[] enhancedKey = new int[fileBytes.length];

        for (int i = 0; i < codes.length; i++) {
            enhancedKey[i] = codes[i];
        }
        int nextCodeIndex = codes.length;
        enhancedKey[nextCodeIndex++] = codes.length;
        int codeIndex = 0;
        while(nextCodeIndex < enhancedKey.length) {
            enhancedKey[nextCodeIndex] = (int) ((int) Math.pow(256, 3) - enhancedKey[codeIndex] * (nextCodeIndex * codeIndex  % 64 + 1) % Math.pow(256, 3) - 1);
            codeIndex++;
            nextCodeIndex++;
        }
        return enhancedKey;
    }

    private static void createImageBuffFile(int[] fileBytes, File file) throws IOException {
        buffFile = new File(Main.rootDir, "unlocked_" + getMainName(file) + "." + getExtension(file));
        BufferedImage dstImage = new BufferedImage(imgWidth, imgHeight, imgType);
        dstImage.setRGB(0, 0, imgWidth, imgHeight, fileBytes, 0, imgWidth);
        ImageIO.write(dstImage, getExtension(file), buffFile);
        Controller.buffFile = buffFile;
    }

    private static int[] getImageFileContent(File file) throws IOException {
        Scanner scanner = new Scanner(file);
        scanner.nextLine();
        imgType = Integer.parseInt(scanner.nextLine());
        imgWidth = Integer.parseInt(scanner.nextLine());
        imgHeight = Integer.parseInt(scanner.nextLine());
        int[] fileBytes = new int[Integer.parseInt(scanner.nextLine())];
        int i = 0;
        while (scanner.hasNextInt()) {
            fileBytes[i] = scanner.nextInt();
            i++;
        }
        scanner.close();
        return fileBytes;
    }

    private static short[] getCodes(String content) {
        short[] answer = new short[content.length()];
        for (int i = 0; i < answer.length; i++) {
            answer[i] = (short) content.charAt(i);
        }
        return answer;
    }

    public static String getExtension(File file) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
        return br.readLine().trim();
    }

    public static String getMainName(File file) {
        return file.getName().substring(0, file.getName().lastIndexOf('.'));
    }
}
