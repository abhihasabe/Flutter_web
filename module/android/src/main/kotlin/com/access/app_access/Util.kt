import android.util.Base64

import java.nio.charset.StandardCharsets
import java.util.Calendar
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec
import android.util.Log


public class Utils{
    companion object mycompanion{
        public fun encrypt(text: String,key: String?): String {
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
            var result =cipher.doFinal(generateTimestamp(text).toByteArray(StandardCharsets.UTF_8))           
            return Base64.encodeToString(result, Base64.NO_WRAP)
            } catch(e: Exception){
               return " "
            }
        }

    private fun generateTimestamp(text: String): String{
        var c = Calendar.getInstance()
        var sec = (c.get(Calendar.SECOND)).toString()
        var min = (c.get(Calendar.MINUTE)).toString()
        var hour = (c.get(Calendar.HOUR_OF_DAY)).toString()
        var yyyy = (c.get(Calendar.YEAR)).toString()
        var mm = (c.get(Calendar.MONTH) + 1).toString()
        var dd = (c.get(Calendar.DATE)).toString()
        
        if ((sec.toInt()) <= 9) {
            sec = "0" + sec
        }
        if ((min.toInt()) <= 9) {
            min = "0" + min
        }
        if ((hour.toInt()) <= 9) {
            hour = "0" + hour
        }
        if ((mm.toInt()) <= 9) {
            mm = "0" + mm
        }
        if ((dd.toInt()) <= 9) {
            dd = "0" + dd
        }

        var concatenated = yyyy + mm + dd + hour + min + sec
        return text + concatenated
        }
    }
}