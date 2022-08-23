# Online Biometrically Verified Electronic Voting System (OBV-EVS)
> Java Web Application

## Project Goals
- Develop a prototype web-based application to simulate the electoral process of general elections in Pakistan incorporating biometric verification.
- Eliminate the requirement of physical presence in one’s constituency for voting, also allowing Pakistani expatriates to exercise their right of vote.
- Incorporate adequate safeguards in the software to ensure free, fair and impartial elections
- Accrue benefits of object-oriented programming.

## Website
![alt text](https://github.com/hamnarauf/Electronic-Voting-System/blob/master/images/Landing%20Page.png)

By clicking on Home button
![alt text](https://github.com/hamnarauf/Electronic-Voting-System/blob/master/images/Login.png)

### Login Details:
    Username        User Type            Password
    mubeen732       ECP                 lAkBQMz511
    awais193        Returning officer   oM7wCMnZoq
    shahid800       Polling officer     8hJFu4fdiH
    
### Login as ECP
ECP Officer can access and modify Election Schedule, Constituencies, Parties and Returning Officers.

![image](https://user-images.githubusercontent.com/77397009/186235010-2de798ee-6800-4e33-8b12-24906ebb2527.png)

### Login as Returning Officer
Returning Officer has access of viewing and modifying Candidates and Polling Officers
![image](https://user-images.githubusercontent.com/77397009/186235592-2196e31a-b9f2-4e55-a972-3f0f63a36e4b.png)

### Login as Polling Officer
Polling officer will only have access on elections day. Officer will be responisble for casting votes. He/she will enter the CNIC of citizen and select the fingerprint reader to capture the thumb impression:
![image](https://user-images.githubusercontent.com/77397009/186236111-6bfce3cf-d53a-4e70-81cf-dce0024f1a15.png)

Afterwards voter casts the vote to the party/candidate if the entered CNIC and thumb impression matches:
![image](https://user-images.githubusercontent.com/77397009/186236586-9fce543b-4286-4edf-ae00-05ddf1815463.png)

### Voter Verification
Voter can also verify his/her details through:
![alt text](https://github.com/hamnarauf/Electronic-Voting-System/blob/master/images/Voter%20Verification.png)
Dummy CNIC: 3740523734496
![image](https://user-images.githubusercontent.com/77397009/186237231-4db9bf9e-2726-4a07-805b-fb0580817274.png)

## Development Environment and Software Used:
1. JDK 13.0.2
2. APACHE NETBEANS IDE 11.3
3. TOMCAT 9.0 SERVER
4. MS Access 2016 

## Third Party Software
### Java Third Party Libraries
- UCanAccess 5.0
- UareU Digital Persona SDK 3.2.0
- U.are.U Fingerprint Reader Driver (WBF) Version 5.0.0.5

### Python Third Party Libraries
- Pandas
- Faker

### Online Third Party Support
- Bootstrap
- JQuery
- SweetAlert
- AI Photo Generator

## Future Work
    The project can be expanded into a full-fledged Electronic Online Voting System with Biometric Verification.

