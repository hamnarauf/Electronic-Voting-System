package com.mycompany.evs;

import com.digitalpersona.uareu.Fmd;

/**
 *
 * @author Sana and Team
 */
public class Voter {

    //instance variables
    private String voterCNIC;
    private String voterName;
    private String voterGender;
    private String fatherName;
    private String dateOfBirth;
    private String voterPhoto;
    private String naConstituency;
    private String paConstituency;
    private String voterDistrict;
    private String voterProvince;
    private String voterAddress;
    private Fmd fingerprint;

    //constructor
    public Voter(String naConstituency, String paConstituency, Fmd fingerprint) {
        this.naConstituency = naConstituency;
        this.paConstituency = paConstituency;
        this.fingerprint = fingerprint;
    }

    public Voter(String cnic, String naConstituency, String paConstituency) {
        this.voterCNIC = cnic;
        this.naConstituency = naConstituency;
        this.paConstituency = paConstituency;
    }
    
    public Fmd getFingerprint() {
        return fingerprint;
    }

    public void setFingerprint(Fmd fingerprint) {
        this.fingerprint = fingerprint;
    }

    public Voter(String voterCNIC, String voterName, String voterGender, String fatherName, String dateOfBirth, String voterPhoto, String naConstituency, String paConstituency, String voterDistrict, String voterProvince, String voterAddress) {
        this.voterCNIC = voterCNIC;
        this.voterName = voterName;
        this.voterGender = voterGender;
        this.fatherName = fatherName;
        this.dateOfBirth = dateOfBirth;
        this.voterPhoto = voterPhoto;
        this.naConstituency = naConstituency;
        this.paConstituency = paConstituency;
        this.voterDistrict = voterDistrict;
        this.voterProvince = voterProvince;
        this.voterAddress = voterAddress;
        //this.voterFingerprint = voterFingerprint;
    }

    //setter methods
    public void setVoterCNIC(String voterCNIC) {
        this.voterCNIC = voterCNIC;
    }

    public void setVoterName(String voterName) {
        this.voterName = voterName;
    }

    public void setVoterGender(String voterGender) {
        this.voterGender = voterGender;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setVoterPhoto(String voterPhoto) {
        this.voterPhoto = voterPhoto;
    }

    public void setNaConstituency(String naConstituency) {
        this.naConstituency = naConstituency;
    }

    public void setPaConstituency(String paConstituency) {
        this.paConstituency = paConstituency;
    }

    public void setVoterDistrict(String voterDistrict) {
        this.voterDistrict = voterDistrict;
    }

    public void setVoterProvince(String voterProvince) {
        this.voterProvince = voterProvince;
    }

    public void setVoterAddress(String voterAddress) {
        this.voterAddress = voterAddress;
    }
    //public void setVoterFingerprint(voterFingerprint){
    //  this.voterFingerprint = voterFingerprint;        
    //}

    //getter methods
    public String getVoterCNIC() {
        return voterCNIC;
    }

    public String getVoterName() {
        return voterName;
    }

    public String getVoterGender() {
        return voterGender;
    }

    public String getFatherName() {
        return fatherName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public String getVoterPhoto() {
        return voterPhoto;
    }

    public String getNaConstituency() {
        return naConstituency;
    }

    public String getPaConstituency() {
        return paConstituency;
    }

    public String getVoterDistrict() {
        return voterDistrict;
    }

    public String getVoterProvince() {
        return voterProvince;
    }

    public String getVoterAddress() {
        return voterAddress;
    }
    //public  getVoterFingerprint(){
    //  return voterFingerprint;
    //}
}
