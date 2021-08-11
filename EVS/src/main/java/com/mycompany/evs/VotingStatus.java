package com.mycompany.evs;

/**
 *
 * @author Sana Zehra
 */
public class VotingStatus {

    //instance variables
    private String voterCNIC;
    private String votingStatus;
    private String constituency;
    private String constituencyID;

    //constructor
    public VotingStatus(String voterCNIC, String votingStatus, String constituency, String constituencyID) {
        this.voterCNIC = voterCNIC;
        this.votingStatus = votingStatus;
        this.constituency = constituency;
        this.constituencyID = constituencyID;
    }

    //setter methods
    public void setVoterCNIC(String voterCNIC) {
        this.voterCNIC = voterCNIC;
    }

    public void setVotingStatus(String votingStatus) {
        this.votingStatus = votingStatus;
    }

    public void setConstituency(String constituency) {
        this.constituency = constituency;
    }

    public void setConstituencyID(String constituencyID) {
        this.constituencyID = constituencyID;
    }

    //getter methods
    public String getVoterCNIC() {
        return voterCNIC;
    }

    public String getVotingStatus() {
        return votingStatus;
    }

    public String getConstituency() {
        return constituency;
    }

    public String getConstituencyID() {
        return constituencyID;
    }

}
