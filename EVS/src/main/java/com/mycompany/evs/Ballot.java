package com.mycompany.evs;

/**
 *
 * @author Binary Beats
 */
public class Ballot {

    private Candidate candidate;
    private Party party;
    private String constId;

    public Ballot(){}
    public Ballot(Candidate candidate, Party party, String constId) {
        this.candidate = candidate;
        this.party = party;
        this.constId = constId;
    }

    public String getConstId() {
        return constId;
    }

    public void setConstId(String constId) {
        this.constId = constId;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public Party getParty() {
        return party;
    }

    public void setParty(Party party) {
        this.party = party;
    }
}
