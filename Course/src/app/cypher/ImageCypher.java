package app.cypher;

import app.ui.Controller;
import app.Main;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

public class ImageCypher {

    static File buffFile;

    public static File encrypt(File file, String key) throws IOException {
        BufferedImage image = ImageIO.read(file);

        int[] fileBytes = image.getRGB(0, 0, image.getWidth(), image.getHeight(), null, 0, image.getWidth());
        int[] keyArray = keyEnhancing(getCodes(key), fileBytes);

        for (int i = 0; i < fileBytes.length; i++) {
            fileBytes[i] = fileBytes[i] ^ keyArray[i];
        }

        createImgBuffFile(fileBytes, file);
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

    private static void createImgBuffFile(int[] fileBytes, File file) throws IOException {
        BufferedImage image = ImageIO.read(file);
        createDemoImgFile(fileBytes, file, image);
        buffFile = new File(Main.rootDir, "locked_" + getMainName(file) + ".vma");
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(buffFile)));
        bw.write(getExtension(file) + "\n");
        bw.write(image.getType() + "\n");
        bw.write(image.getWidth() + "\n");
        bw.write(image.getHeight() + "\n");
        bw.write(fileBytes.length + "\n");

        for(int i = 0; i < fileBytes.length; i++) {
            bw.write(fileBytes[i] + " ");
        }

        bw.close();
    }

    // DEMONSTRATION FUNCTION
    private static void createDemoImgFile(int[] fileBytes, File file, BufferedImage image) throws IOException {
        buffFile = new File(Main.rootDir, "unlocked_" + getMainName(file) + "." + getExtension(file));
        BufferedImage dstImage = new BufferedImage(image.getWidth(), image.getHeight(), image.getType());
        dstImage.setRGB(0, 0, image.getWidth(), image.getHeight(), fileBytes, 0, image.getWidth());
        ImageIO.write(dstImage, getExtension(file), buffFile);
        Controller.buffFile = buffFile;
    }
    // DEMONSTRATION FUNCTION

    public static String getMainName(File file) {
        return file.getName().substring(0, file.getName().lastIndexOf('.'));
    }

    public static String getExtension(File file) {
        return file.getName().substring(file.getName().lastIndexOf('.') + 1);
    }

    private static short[] getCodes(String content) {
        short[] answer = new short[content.length()];
        for (int i = 0; i < answer.length; i++) {
            answer[i] = (short) content.charAt(i);
        }
        return answer;
    }
}
