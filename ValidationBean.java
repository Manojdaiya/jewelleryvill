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
public class ValidationBean 
{
    private String Emailid;
    
  public ValidationBean()
  {}
  public ValidationBean(String Emailid)
  {
      this.Emailid=Emailid;
  }

    public String getEmailid() {
        return Emailid;
    }

    public void setEmailid(String Emailid) {
        this.Emailid = Emailid;
    }
    


}