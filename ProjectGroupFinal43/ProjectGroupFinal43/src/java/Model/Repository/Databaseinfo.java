/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Repository;

/**
 *
 * @author Bravo
 */
public interface Databaseinfo {

    String port = "1433";
    String IP = "127.0.0.1";
    String USERDB = "sa";
    String PASSDB = "123";
    String ServerName = "BRAVO\\SQLEXPRESS";
    String DBName = "Project_AAA";
    String DRIVERNAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String DBURL = "jdbc:sqlserver://BRAVO\\SQLEXPRESS:1433;databaseName=Project_AAA;encrypt=false;trustServerCertificate=false;loginTimeout=30";
}
