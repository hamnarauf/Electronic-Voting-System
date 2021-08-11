package com.mycompany.evs;

/**
 *
 * @author Sana Zehra
 */
public class User {

    //instance variables
    private String userName;
    private String userCNIC;
    private String userID;   
    private String userType;
    private String userPassword;

    //constructor
    public User(String userName, String userCNIC, String userID, String userType, String userPassword) {
        this.userName = userName;
        this.userCNIC = userCNIC;
        this.userID = userID;
        this.userType = userType;
        this.userPassword = userPassword;
    }

    public User() {}

    //setter methods 
    public void setUserCNIC(String userCNIC) {
        this.userCNIC = userCNIC;
    }

   
    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getUserCNIC() {
        return userCNIC;
    }

    public String getUserID() {
        return userID;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public String getUserType() {
        return userType;
    }

    public String getUserName() {
        return userName;
    }
}
