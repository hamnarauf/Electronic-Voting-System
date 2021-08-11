package com.mycompany.evs;

/**
 *
 * @author Binary Beats
 */
public class Result {
    String constId;
        int votes;
        String candName;
        String sym;
        String type;

    public String getConstituencyType() {
        return type;
    }

    public void setConsitituencyType(String type) {
        this.type = type;
    }
        
    public Result(){}

    public Result(String constId, int votes, String candName, String type) {
        this.constId = constId;
        this.votes = votes;
        this.candName = candName;
        this.type = type;
    }

    public String getCandName() {
        return candName;
    }

    public void setCandName(String candName) {
        this.candName = candName;
    }

    public String getSym() {
        return sym;
    }

    public void setSym(String sym) {
        this.sym = sym;
    }

    public String getConstId() {
        return constId;
    }

    public void setConstId(String constId) {
        this.constId = constId;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }
}
