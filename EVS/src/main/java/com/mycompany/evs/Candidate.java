package com.mycompany.evs;

import java.io.InputStream;

/**
 *
 * @author Sana Zehra
 */
public class Candidate {

    //instance variables
    private String candidateCNIC;
    private String candidateName;
    private String candidateGender;
    private String dateOfBirth;
    private String candidatePhoto;
    private InputStream photo;
    private int partyID;
    private String partyName;

    //constructor
    public Candidate(String candidateCNIC, String candidateName, String candidateGender, String dateOfBirth, String candidatePhoto, int partyID) {
        this.candidateCNIC = candidateCNIC;
        this.candidateName = candidateName;
        this.candidateGender = candidateGender;
        this.dateOfBirth = dateOfBirth;
        this.candidatePhoto = candidatePhoto;
        this.partyID = partyID;
    }

    public Candidate(String candidateCNIC, String candidateName, String candidateGender, String dateOfBirth, InputStream photo, int partyID) {
        this.candidateCNIC = candidateCNIC;
        this.candidateName = candidateName;
        this.candidateGender = candidateGender;
        this.dateOfBirth = dateOfBirth;
        this.photo = photo;
        this.partyID = partyID;
    }

    public Candidate(String candidateName, String candidatePhoto) {
        this.candidateName = candidateName;
        this.candidatePhoto = candidatePhoto;
    }

    public Candidate() {
    }

    //setter methods
    public void setCandidateCNIC(String candidateCNIC) {
        this.candidateCNIC = candidateCNIC;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public void setCandidateGender(String candidateGender) {
        this.candidateGender = candidateGender;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setCandidatePhoto(String candidatePhoto) {
        this.candidatePhoto = candidatePhoto;
    }

    public void setPhoto(InputStream photo) {
        this.photo = photo;
    }

    public void setPartyID(int partyID) {
        this.partyID = partyID;
    }

    //getter methods
    public String getCandidateCNIC() {
        return candidateCNIC;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public String getCandidateGender() {
        return candidateGender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public String getCandidatePhoto() {
        return candidatePhoto;
    }

    public InputStream getPhoto() {
        return photo;
    }

    public int getPartyID() {
        return partyID;
    }

    public String getPartyName() {
        return this.partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

}
