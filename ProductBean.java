/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Blob;

/**
 *
 * @author Manoj
 */
public class ProductBean {
    private int id,offer_price,actual_price;
    private String product_name,description,product_category;
    private Blob pic1, pic2,pic3,pic4; 
  
  
   
    
    public ProductBean()
    {    }
    
    public ProductBean(int offer_price,int actual_price,String product_name,String description,String product_category,Blob pic1,Blob pic2,Blob pic3,Blob pic4)
    {
       
        this.offer_price=offer_price;
        this.actual_price=actual_price;
        this.product_name=product_name;
        this.description=description;
        this.product_category=product_category;
        this.pic1=pic1;
        this.pic2=pic2;
        this.pic3=pic3;
        this.pic4=pic4;
        
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOffer_price() {
        return offer_price;
    }

    public void setOffer_price(int offer_price) {
        this.offer_price = offer_price;
    }

    public int getActual_price() {
        return actual_price;
    }

    public void setActual_price(int actual_price) {
        this.actual_price = actual_price;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public Blob getPic1() {
        return pic1;
    }

    public void setPic1(Blob pic1) {
        this.pic1 = pic1;
    }

    public Blob getPic2() {
        return pic2;
    }

    public void setPic2(Blob pic2) {
        this.pic2 = pic2;
    }

    public Blob getPic3() {
        return pic3;
    }

    public void setPic3(Blob pic3) {
        this.pic3 = pic3;
    }

    public Blob getPic4() {
        return pic4;
    }

    public void setPic4(Blob pic4) {
        this.pic4 = pic4;
    }

       
}
