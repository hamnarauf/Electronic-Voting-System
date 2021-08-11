package com.mycompany.evs;

/**
 *
 * @author Sana Zehra
 */
public class Candidature {

    //instance variables
    private String constituencyID;
    private int partyID;
    private String candidateCnic;

    //constructor
    public Candidature(String constituencyID, int partyID){
        this.constituencyID = constituencyID ;
        this.partyID = partyID;
    }
    
    public Candidature(String candidateCnic, String constituencyID, int partyID) {
        this.candidateCnic = candidateCnic;
        this.constituencyID = constituencyID;
        this.partyID = partyID;
    }

    //setter methods
    public void setConstituencyID(String constituencyID) {
        this.constituencyID = constituencyID;
    }

    public void setPartyID(int partyID) {
        this.partyID = partyID;
    }

    //getter methods
    public String getConstituencyID() {
        return constituencyID;
    }

    public int getPartyID() {
        return partyID;
    }

    public String getCandidateCnic() {
        return candidateCnic;
    }
    public void setCandidateCnic(String candidateCnic) {
        this.candidateCnic = candidateCnic;
    }
}
