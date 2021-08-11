package com.mycompany.evs;

import java.io.InputStream;

/**
 *
 * @author Sana Zehra
 */
public class Party {

    //instance variables
    private int partyID;
    private String partyName;
    private String partyLeader;
    private String partySymbol;
    private InputStream symbolStream;
    private String symbolName;

    //constructor
    public Party() {
    }

    public Party(int partyID, String partyName, String partyLeader, String partySymbol, String symbolName) {
        this.partyID = partyID;
        this.partyName = partyName;
        this.partyLeader = partyLeader;
        this.partySymbol = partySymbol;
        this.symbolName = symbolName;
    }

    public Party(int partyID, String partyName, String partyLeader, InputStream symbolStream, String symbolName) {
        this.partyID = partyID;
        this.partyName = partyName;
        this.partyLeader = partyLeader;
        this.symbolStream = symbolStream;
        this.symbolName = symbolName;
    }

    public Party(String partyName, String partySymbol) {
        this.partyName = partyName;
        this.partySymbol = partySymbol;
    }

    public InputStream getSymbolStream() {
        return symbolStream;
    }

    public void setSymbolStream(InputStream symbolStream) {
        this.symbolStream = symbolStream;
    }

    //setter methods
    public void setPartyID(int partyID) {
        this.partyID = partyID;
    }

    public void setPartyLeader(String partyLeader) {
        this.partyLeader = partyLeader;
    }

    public void setPartySymbol(String partySymbol) {
        this.partySymbol = partySymbol;
    }

    public void setSymbolName(String symbolName) {
        this.symbolName = symbolName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    //getter methods
    public int getPartyID() {
        return partyID;
    }

    public String getPartyLeader() {
        return partyLeader;
    }

    public String getPartySymbol() {
        return partySymbol;
    }

    public String getSymbolName() {
        return symbolName;
    }

    public String getPartyName() {
        return partyName;
    }

}
