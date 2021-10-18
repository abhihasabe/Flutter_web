import android.util.Base64

import java.nio.charset.StandardCharsets
import java.util.Calendar
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec
import android.util.Log


public class EncryptUtil{
    companion object mycompanion{
        public fun encrypt(text: String?,key: String?): String {
            try{
            var cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
            var keyBytes: ByteArray= ByteArray(16)
            var b = key!!.toByteArray(StandardCharsets.UTF_8)
            var len = b.size           
            if(len > keyBytes.size){
                len = keyBytes.size
            }
             b.copyInto(keyBytes,0,0,len)
            var keySpec = SecretKeySpec(keyBytes,"AES")
            var ivSpec = IvParameterSpec(keyBytes)
            cipher.init(Cipher.ENCRYPT_MODE,keySpec,ivSpec)
            var result =cipher.doFinal(text!!.toByteArray(StandardCharsets.UTF_8))           
            return Base64.encodeToString(result, Base64.NO_WRAP)
            } catch(e: Exception){
               return " "
            }
        }

    }
}