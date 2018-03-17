/*
 * 멤버 정보 getter, setter
 * isEmpty 메소드
 * 비밀번호 확인 메소드
 */
package sofrative.member;

public class Member {

   private String name;
   private String id;
   private String password;
   private String confirmPassword;
   private String department;
   private String email;
   private String url;
   private String phone;
   private int login;

   public Member(String id, String password, String name,
         String confirmPassword, String department,
         String email, String url, String phone, int login) {
      this.name = name;
      this.id = id;
      this.password = password;
      this.confirmPassword = confirmPassword;
      this.department = department;
      this.email = email;
      this.url=url;
      this.phone = phone;
      this.login = login;
   }

   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
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

   public String getConfirmPassword() {
      return confirmPassword;
   }
   public void setConfirmPassword(String confirmPassword) {
      this.confirmPassword = confirmPassword;
   }

   public String getDepartment() {
      return department;
   }
   public void setDepartment(String department) {
      this.department = department;
   }

   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }

   public String getUrl() {
      return url;
   }
   public void setUrl(String url) {
      this.url = url;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }

   public int getLogin() {
      return login;
   }

   public void setLogin(int login) {
      this.login = login;
   }

   public boolean confirmPassword() {
      return password.equals(confirmPassword);
   }

   public boolean nameIsEmpty() {
      return name==null || name.isEmpty();
   }
   public boolean idIsEmpty() {
      return id==null || id.isEmpty();
   }
   public boolean passwordIsEmpty() {
      return password==null || password.isEmpty();
   }
   public boolean confirmPasswordIsEmpty() {
      return  confirmPassword==null || confirmPassword.isEmpty();
   }
   public boolean departmentIsEmpty() {
      return department==null || department.isEmpty();
   }
   public boolean emailIsEmpty() {
      return email==null || email.isEmpty();
   }
   public boolean urlIsEmpty(){
      return url==null || url.isEmpty();
   }
   public boolean phoneIsEmpty() {
      return phone==null ||  phone.isEmpty();
   }
   //유효성 검사(영어소문자,숫자만)
   public boolean idregEngNum(){//아이디

      String regEngNum ="^[a-z0-9]$";

      if(id.matches(regEngNum)){
         return true;
      }
      return false;
   }
   public boolean pwregEngNum(){//비밀번호
      String regEngNum ="[^ ]+[a-z]+[0-9]+";

      if(!password.matches(regEngNum)){
         return true;
      }
      return false;
   }
   public boolean cpregEngNum(){//confirmPassword

      String regEngNum ="[^ ]+[a-z]+[0-9]+";

      if(!confirmPassword.matches(regEngNum)){
         return true;
      }
      return false;
   }
   //유효성 검사(공백 사용하지 않기)
   public boolean ngap(){//이름
      if(name.indexOf(" ")>=0){
         return true;
      }
      return false;
   }
   public boolean idgap(){//아이디
      if(id.indexOf(" ")>=0){
         return true;
      }
      return false;
   }
   public boolean pwgap(){//비밀번호
      if(password.indexOf(" ")>=0){
         return true;
      }
      return false;
   }
   public boolean cpwgap(){//confirmPassword
      if(confirmPassword.indexOf(" ")>=0){
         return true;
      }
      return false;
   }
   //유효성 검사(길이 체크)
   public boolean nlength(){//이름
      if(name.length()<2){
         return true;
      }
      return false;
   }
   public boolean idlength(){//아이디
      if(id.length()<5 || id.length()>12){
         return true;
      }
      return false;
   }
   public boolean pwlength(){//비밀번호
      if(password.length()<8 || password.length()>12){
         return true;
      }
      return false;
   }
   public boolean cpwlength(){//confirmPassword
      if(confirmPassword.length()<8 || confirmPassword.length()>12){
         return true;
      }
      return false;
   }
   public boolean ckphone(){//휴대폰 번호

      String regExp ="(01[0-9]{1}[0-9]{3,4}[0-9]{3,4}|02[0-9]{3,4}[0-9]{4})+[^ ]";

      if(!phone.matches(regExp)){
         return true;
      }
      return false;
   }
}