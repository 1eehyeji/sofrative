package sofrative.login;
/*
 * Login에 필요한 DB - getter/setter
 */
public class LoginData {

   private String id; //아이디
   private String password; //비밀번호
   
   public LoginData(String id, String password) {
      this.id = id;
      this.password = password;
   }
   
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   
}
