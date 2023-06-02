package f2.quizzapp.util;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.SecureRandom;
import java.util.HexFormat;

public class AESEncoder {
    private static final String AES_CIPHER_ALGORITHM = "AES/CBC/PKCS5PADDING";

    static SecretKeySpec key;

    static byte[] vector = createInitializationVector();

    public static byte[] createInitializationVector() {
        byte[] initializationVector = new byte[16];
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(initializationVector);
        return initializationVector;
    }

    public static String encode(String plainText, SecretKeySpec key) throws Exception {
        Cipher cipher = Cipher.getInstance(AES_CIPHER_ALGORITHM);

        IvParameterSpec ivParameterSpec = new IvParameterSpec(vector);

        cipher.init(Cipher.ENCRYPT_MODE, key, ivParameterSpec);

        return DatatypeConverter.printHexBinary(cipher.doFinal(plainText.getBytes()));
    }

    public static String decode(String cipherText, SecretKeySpec key) throws Exception {
        byte[] cipherBytes = HexFormat.of().parseHex(cipherText);
        Cipher cipher = Cipher.getInstance(AES_CIPHER_ALGORITHM);

        IvParameterSpec ivParameterSpec = new IvParameterSpec(vector);

        cipher.init(Cipher.DECRYPT_MODE, key, ivParameterSpec);

        byte[] result = cipher.doFinal(cipherBytes);

        return new String(result);
    }
}
