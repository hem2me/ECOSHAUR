package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

import org.springframework.stereotype.Component;

@Component
public class DBOpen {
  
  public DBOpen() {
    System.out.println("---DBOpen()객체 생성 됨"); 
  }  
  //�뜲�씠�꽣踰좎씠�뒪 �뿰寃� 硫붿냼�뱶  
  public Connection getConnection() {
    String url      = "jdbc:mysql://localhost:3306/Rental_service?serverTimezone=UTC";
    String user     = "root";
    String password = "1234";
    String driver   = "org.mariadb.jdbc.Driver";

    Connection con=null;
   
    try {
      
      Class.forName(driver);  
      con=DriverManager.getConnection(url, user, password);

    }catch(Exception e){
      System.out.println("DB�떎�뙣:" + e);
    }//try end
    
    return con;
    
  }//getConnection() end
  
}//class end
