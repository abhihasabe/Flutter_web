import android.util.Base64

import java.nio.charset.StandardCharsets
import java.util.Calendar
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec
import android.util.Log


public class DecryptUtil{
    companion object mycompanion{
        public fun decrypt(text: String?,key: String?): String {
            try{
            var baseToString : ByteArray? = Base64.decode(text, Base64.NO_WRAP)
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
            cipher.init(Cipher.DECRYPT_MODE,keySpec,ivSpec)
            var result =cipher.doFinal(baseToString!!)           
            return  String(result, charset("UTF-8"))
            } catch(e: Exception){
               return " "
            }
        }

    }
}