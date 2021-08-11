package com.mycompany.evs;

/**
 *
 * @author Sana Zehra
 */
public class Constituency {

    //instance variables
    private String constituencyID;
    private String constituencyType;
    private String constituencyDistrict;
    private String constituencyProvince;

    //constructor
    public Constituency(String constituencyID, String constituencyType, String constituencyDistrict, String constituencyProvince) {
        this.constituencyID = constituencyID;
        this.constituencyType = constituencyType;
        this.constituencyDistrict = constituencyDistrict;
        this.constituencyProvince = constituencyProvince;
    }

    public Constituency() {}

    public Constituency(String id) {
        this.constituencyID = id;
    }

    //setter methods
    public void setConstituencyID(String constituencyID) {
        this.constituencyID = constituencyID;
    }

    public void setConstituencyType(String constituencyType) {
        this.constituencyType = constituencyType;
    }

    public void setConstituencyDistrict(String constituencyDistrict) {
        this.constituencyDistrict = constituencyDistrict;
    }

    public void setConstituencyProvince(String constituencyProvince) {
        this.constituencyProvince = constituencyProvince;
    }

    //getter methods
    public String getConstituencyID() {
        return constituencyID;
    }

    public String getConstituencyType() {
        return constituencyType;
    }

    public String getConstituencyDistrict() {
        return constituencyDistrict;
    }

    public String getConstituencyProvince() {
        return constituencyProvince;
    }

}
