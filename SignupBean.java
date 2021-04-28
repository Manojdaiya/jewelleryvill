/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;


/**
 *
 * @author Manoj
 */
public class SignupBean {
    private int id;
    private String Gmail,password,cpassword,name,Phone_no;

    
     public SignupBean()
     {
     }
     public SignupBean(String Gmail,String password,String cpassword,String Phone_no,String name)
     {
         this.Gmail=Gmail;
         this.password=password;
         this.cpassword=cpassword;
         this.Phone_no=Phone_no;
         this.name=name;
      
     }

    public String getGmail() {
        return Gmail;
    }

    public void setGmail(String Gmail) {
        this.Gmail = Gmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }

    public String getPhone_no() {
        return Phone_no;
    }

    public void setPhone_no(String Phone_no) {
        this.Phone_no = Phone_no;
    }

  

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
       

}
