/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;
import java.io.*;
/**
 *
 * @author Manoj
 */
public class LoginBean 
{
    private String password,gmail;
    public LoginBean()
    {}
    public LoginBean(String password,String gmail)
    {
        this.password=password;
        this.gmail=gmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }
    

}