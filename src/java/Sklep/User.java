package Sklep;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author jakub
 */
public class User {
    public static String name;
    public static String surname;
    public static  String email;
    public static String login;
    public static String password;
    
    public static String user_status; 
    public static String user_data; 
    
    static public void log_in(String login, String email, String password){
        
    }
    static public void reg_user(String name, String surname, String email, String login, String password){
        
    }
    static public void log_out(){
        try{
        FileWriter myWriter = new FileWriter("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_status.txt");
        myWriter.write("GUEST");
        myWriter.close();
        user_status = "GUEST";
        
        } 
        catch (IOException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        };
    }
    static public void log_out2(){
        try{
        FileWriter myWriter = new FileWriter("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_data.txt");
        myWriter.write("GUEST");
        myWriter.close();
        user_data = "GUEST";
        
        } 
        catch (IOException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        };
    }
    static public void set_login(){
        try{
        FileWriter myWriter = new FileWriter("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_status.txt");
        myWriter.write("LOGIN");
        myWriter.close();
        user_status = "LOGIN";
        
        } 
        catch (IOException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        };
    }
     static public void set_admin(){
        try{
        FileWriter myWriter = new FileWriter("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_status.txt");
        myWriter.write("ADMIN");
        myWriter.close();
        user_status = "admin1";
        
        } 
        catch (IOException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        };  
    }
        static public void set_data(String login){
        try{
        FileWriter myWriter = new FileWriter("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_data.txt");
        myWriter.write(login);
        myWriter.close();
        } 
        catch (IOException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        };  
    }
    static public void get_status(){
        try {
          File myObj = new File("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_status.txt");
          Scanner myReader = new Scanner(myObj);
            String data = myReader.nextLine();
            System.out.println(data);
            user_status = data.toString();
          myReader.close();
        } catch (FileNotFoundException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        }
    }
     static public void get_data(){
        try {
          File myObj = new File("D:\\Programy\\NetBeans_IDE\\Projekty\\Sklep\\web\\resources\\user\\user_data.txt");
          Scanner myReader = new Scanner(myObj);
            String data = myReader.nextLine();
            System.out.println(data);
            user_data = data.toString();
          myReader.close();
        } catch (FileNotFoundException e) {
          System.out.println("An error occurred.");
          e.printStackTrace();
        }
    }
    public User(){
	
		
		

};
    
}
