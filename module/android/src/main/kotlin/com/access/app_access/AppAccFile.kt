import java.io.File
import java.io.*

public class AppAcc{
      companion object myCompanionName{
              fun isDeviceRooted():Boolean{
            return  checkRootMethod1() || checkRootMethod2() || checkRootMethod3()
              }
          private fun checkRootMethod1(): Boolean {
              var buildTags:String =  android.os.Build.TAGS 
           return buildTags != null && buildTags.contains("test-keys")    
          }

         private fun checkRootMethod2():Boolean{
           var list  =listOf(
           "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su",
            "/su/bin/su"       
           )
     for( lists in list){
            if(File(lists).exists()){
                return true
            }          
        }
         return false
         }     
     

     private fun checkRootMethod3():Boolean{
       var cmds =arrayOf("/system/xbin/which su",
       "/system/bin/which su")
       var process :Process? =null
       try{
       process  = Runtime.getRuntime().exec(cmds)
       process.waitFor()

       var br = BufferedReader(InputStreamReader(process.getInputStream()))
        if(br.readLine()!=null){
          return true
        }
        return false

      //  val sOut = IOUtil.toString(process.inputStream,Charset.UTF_8)
      //  val sErr = IOUtil.toString(process.errorStream,Charset.UTF_8)
      //  if(sOut != null) {
      //   return true
      //  } 
      //   return false;

       }catch(e:Throwable ){    
           if(process!=null){
           process.destroy()
         }   
         return false
       }finally{
         if(process!=null){
           process.destroy()
         }
       }
     }
  }
}