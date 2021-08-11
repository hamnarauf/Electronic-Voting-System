package com.mycompany.evs;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.digitalpersona.uareu.*;

public class DbQuery {

    private final static String FILE = "C:\\Users\\Sana Zehra\\OneDrive\\Documents\\SEECS-NUST\\Semester 2\\OOP\\Project\\EVS\\assets\\Evoting.accdb";
    private static Connection conn;
    private static Statement st;

    //general-purpose methods
    private static void setupDb() {
        //for making connection to the database
        String url;
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            url = "jdbc:ucanaccess://" + FILE;
            Connection connection = DriverManager.getConnection(url);
            DbQuery.conn = connection;
            Statement statement = connection.createStatement();
            DbQuery.st = statement;
        } catch (ClassNotFoundException | SQLException exc) {
            exc.toString();
        }
    }

    private static void tearDownDb() {
        try {
            DbQuery.st.close();
            DbQuery.conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DbQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static String displayImage(Blob blob) throws IOException, SQLException {

        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            InputStream inputStream;

            inputStream = blob.getBinaryStream();
            int bytesRead;
            String img;

            byte[] buffer = new byte[4096];
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            img = Base64.getEncoder().encodeToString(imageBytes);
            inputStream.close();

            return img;
        }
    }

    public static User checkLoginDetails(String username, String password, String type) throws SQLException,
            ClassNotFoundException {

        setupDb();
        User user = null;

        //login query
        final String query = "SELECT Users.user_cnic, Users.user_name FROM Users "
                + "WHERE (((Users.user_name_id)=\"" + username + "\") "
                + "AND ((Users.user_password)=\"" + password + "\") "
                + "AND ((Users.user_type)=\"" + type + "\"));";

        ResultSet rs = st.executeQuery(query);

        if (rs.next()) { //valid credentials
            user = new User(rs.getString("user_name"), rs.getString("user_cnic"),
                    username, type, password);
        }
        tearDownDb();
        return user;
    }

    public static Voter checkVoterVerification(String cnic) throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        Voter voter = null;
        Blob blob;
        String img;

        //verification query
        final String query = "SELECT Voters.voter_cnic, Voters.voter_name, Voters.voter_gender, "
                + "Voters.father_name, Voters.date_of_birth, Voters.voter_photo, "
                + "Voters.na_constituency, Voters.pa_constituency, "
                + "Voters.voter_district, Voters.voter_province, Voters.voter_address "
                + "FROM Voters "
                + "WHERE (((Voters.voter_cnic)=\"" + cnic + "\"));";

        ResultSet rs = st.executeQuery(query);

        if (rs.next()) { //verified voter

            //Retrieves image from database          
            blob = rs.getBlob("voter_photo");
            img = displayImage(blob);
            String dob = rs.getString("date_of_birth");
            dob = dob.substring(8, 10) + "-" + dob.substring(5, 7) + "-" + dob.substring(0, 4);
            voter = new Voter(cnic, rs.getString("voter_name"), rs.getString("voter_gender"),
                    rs.getString("father_name"), dob, img,
                    rs.getString("na_constituency"), rs.getString("pa_constituency"),
                    rs.getString("voter_district"), rs.getString("voter_province"),
                    rs.getString("voter_address"));
        }
        tearDownDb();
        return voter;
    }

    //candidate-related methods
    public static void registerCandidate(Candidate candidate, Candidature candidature) throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        //query to insert a candidate to the Candidates' table
        final String query = "INSERT INTO Candidates (candidate_cnic, candidate_name, candidate_gender, date_of_birth, candidate_photo, party_id )\n"
                + "VALUES (?, ?, ?, ?, ?, ?);";
        PreparedStatement statement = conn.prepareStatement(query);

        statement.setString(1, candidate.getCandidateCNIC());
        statement.setString(2, candidate.getCandidateName());
        statement.setString(3, candidate.getCandidateGender());
        statement.setString(4, candidate.getDateOfBirth());
        statement.setBlob(5, candidate.getPhoto());
        statement.setInt(6, candidate.getPartyID());
        statement.executeUpdate();
        statement.close();

        final String queryCandidature = "INSERT INTO Candidature (candidate_cnic, constituency_id, party_id, voteCast)\n"
                + "VALUES ('" + candidature.getCandidateCnic() + "', "
                + "'" + candidature.getConstituencyID() + "', "
                + candidature.getPartyID() + ", 0);";
        st.executeUpdate(queryCandidature);
        tearDownDb();
    }

    public static void removeCandidate(String cnic) throws SQLException {
        setupDb();
        final String query = "DELETE FROM Candidates WHERE candidate_cnic= '" + cnic + "';";

        st.executeUpdate(query);
        tearDownDb();
    }

    public static void clearCandidates() throws SQLException {
        setupDb();
        final String query = "DELETE * FROM Candidates;";
        st.executeUpdate(query);
        tearDownDb();
    }

    public static ArrayList<Candidate> getCandidatesList() throws SQLException,
            ClassNotFoundException, IOException {
        setupDb();
        String query = "SELECT Candidates.candidate_cnic, Candidates.candidate_name, Candidates.candidate_gender, Candidates.date_of_birth, Candidates.candidate_photo, Candidates.party_id, Parties.party_name\n"
                + "FROM Parties INNER JOIN Candidates ON Parties.party_id = Candidates.party_id;";

        ResultSet rs = st.executeQuery(query);

        ArrayList<Candidate> candidates = new ArrayList<Candidate>();

        while (rs.next()) {
//                //Retrieves image
//            Blob blob = rs.getBlob("candidate_photo");
//            String img;
//            img = displayImage(blob);

            String dob = rs.getString("date_of_birth");
            dob = dob.substring(8, 10) + "-" + dob.substring(5, 7) + "-" + dob.substring(0, 4);

            Candidate candidate = new Candidate();
            candidate.setCandidateCNIC(rs.getString("candidate_cnic"));
            candidate.setCandidateName(rs.getString("candidate_name"));
            candidate.setCandidateGender(rs.getString("candidate_gender"));
            candidate.setDateOfBirth(dob);
            candidate.setCandidatePhoto(rs.getString("candidate_photo"));
//                candidate.setCandidatePhoto(img);
            candidate.setPartyName(rs.getString("party_name"));
            candidates.add(candidate);
        }
        tearDownDb();
        return candidates;
    }

    // party related methods  
    public static void registerParty(Party party) throws SQLException {
        setupDb();
        final String query = " INSERT INTO Parties ( party_id, party_name, party_leader, party_symbol, symbol_name )\n"
                + " VALUES (?, ?, ?, ?, ?);";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setInt(1, party.getPartyID());
        statement.setString(2, party.getPartyName());
        statement.setString(3, party.getPartyLeader());
        statement.setBlob(4, party.getSymbolStream());
        statement.setString(5, party.getSymbolName());
        statement.executeUpdate();
        statement.close();
        tearDownDb();
    }

    public static void removeParty(String name) throws SQLException {
        setupDb();

        final String query = "DELETE FROM Parties WHERE party_name= '" + name + "';";

        st.executeUpdate(query);
        tearDownDb();
    }

    public static int getPartyID() throws SQLException {
        setupDb();
        int partyID = 0;

        final String query = "SELECT Parties.party_id\n"
                + "FROM Parties;";

        ResultSet rs = st.executeQuery(query);

        while (rs.next()) { //party exists
            partyID += 1;
        }
        partyID += 1;
        tearDownDb();
        return partyID;
    }

    public static ArrayList<Party> getPartiesList() throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        String query = "SELECT Parties.party_id, Parties.party_name, Parties.party_leader, Parties.party_symbol, Parties.symbol_name\n"
                + "FROM Parties;";

        ResultSet rs = st.executeQuery(query);
        ArrayList<Party> parties = new ArrayList<Party>();

        while (rs.next()) {
            //Retrieves image
            Blob blob = rs.getBlob("party_symbol");
            String img;
            img = displayImage(blob);

            Party party = new Party();
            party.setPartyID(rs.getInt("party_id"));
            party.setPartyName(rs.getString("party_name"));
            party.setPartyLeader(rs.getString("party_leader"));
            party.setPartySymbol(img);
            party.setSymbolName(rs.getString("symbol_name"));
            parties.add(party);

        }
        tearDownDb();
        return parties;
    }

    //user related methods
    public static void registerUser(User user) throws SQLException {
        setupDb();

        //query to insert user in the Users' table       
        final String query = "INSERT INTO Users(user_cnic, user_name_id, user_password, user_type, user_name)\n"
                + "VALUES ('" + user.getUserCNIC() + "', '"
                + user.getUserID() + "', '"
                + user.getUserPassword() + "', '"
                + user.getUserType() + "', '"
                + user.getUserName() + "');";

        st.executeUpdate(query);
        tearDownDb();
    }

    public static void removeUser(String cnic) throws SQLException {
        setupDb();
        //query to delete a user from the Users' table
        final String query = "DELETE FROM Users WHERE user_cnic= '" + cnic + "';";

        st.executeUpdate(query);
        tearDownDb();
    }

    //Polling officer related methods
    public static void clearPollingOfficers() throws SQLException {
        setupDb();
        final String query = "DELETE * FROM Users\n"
                + "WHERE (((Users.user_type)=\"Polling officer\"));";
        st.executeUpdate(query);
        tearDownDb();
    }

    public static ArrayList<User> getPollingOfficersList() throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        String query = "SELECT Users.user_cnic, Users.user_name, Users.user_name_id FROM Users "
                + "WHERE ((Users.user_type)=\"" + "Polling officer" + "\");";

        ResultSet rs = st.executeQuery(query);
        ArrayList<User> pollingOfficers = new ArrayList<User>();

        while (rs.next()) {
            User pollingOfficer = new User();
            pollingOfficer.setUserCNIC(rs.getString("user_cnic"));
            pollingOfficer.setUserID(rs.getString("user_name"));
            pollingOfficer.setUserName(rs.getString("user_name_id"));
            pollingOfficers.add(pollingOfficer);

        }
        tearDownDb();
        return pollingOfficers;
    }

    //Returning Officer related methods
    public static void clearReturningOfficers() throws SQLException {
        setupDb();
        final String query = "DELETE * FROM Users\n"
                + "WHERE (((Users.user_type)=\"Returning officer\"));";
        st.executeUpdate(query);
        tearDownDb();
    }

    public static ArrayList<User> getReturningOfficersList() throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        String query = "SELECT Users.user_cnic, Users.user_name, Users.user_name_id FROM Users "
                + "WHERE ((Users.user_type)=\"" + "Returning officer" + "\");";

        ResultSet rs = st.executeQuery(query);
        ArrayList<User> returningOfficers = new ArrayList<User>();

        while (rs.next()) {
            User returningOfficer = new User();
            returningOfficer.setUserCNIC(rs.getString("user_cnic"));
            returningOfficer.setUserID(rs.getString("user_name"));
            returningOfficer.setUserName(rs.getString("user_name_id"));
            returningOfficers.add(returningOfficer);

        }
        tearDownDb();
        return returningOfficers;
    }

    //Consitituency-related methods
    public static void registerConstituency(Constituency constituency) throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        //query to insert constituency to the Constituencies' table
        final String query = "INSERT INTO Constituencies \n"
                + "VALUES ('" + constituency.getConstituencyID() + "' , '"
                + constituency.getConstituencyType() + "', '"
                + constituency.getConstituencyDistrict() + "', '"
                + constituency.getConstituencyProvince() + "');";

        st.executeUpdate(query);
        tearDownDb();
    }

    public static void removeConstituency(String constID) throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        //query to delete constituency from the Constituencies' table
        final String query = "DELETE FROM Constituencies WHERE constituency_id= '" + constID + "';";

        st.executeUpdate(query);
        tearDownDb();
    }

    public static ArrayList<Constituency> getConstituenciesList() throws SQLException,
            ClassNotFoundException, IOException {

        setupDb();
        String query = "SELECT Constituencies.constituency_id, Constituencies.constituency_type, Constituencies.constituency_district, Constituencies.constituency_province FROM Constituencies;";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Constituency> constituencies = new ArrayList<Constituency>();

        while (rs.next()) {

            Constituency constituency = new Constituency();
            constituency.setConstituencyID(rs.getString("constituency_id"));
            constituency.setConstituencyType(rs.getString("constituency_type"));
            constituency.setConstituencyDistrict(rs.getString("constituency_district"));
            constituency.setConstituencyProvince(rs.getString("constituency_province"));
            constituencies.add(constituency);
        }
        tearDownDb();
        return constituencies;
    }

    //methods for vote-casting
    public static Voter biometricVerify(String cnic) throws SQLException {    //fingerprint code
        setupDb();
        Voter voter = null;
        final String query = "SELECT na_constituency, pa_constituency FROM Voters \n"
                + "WHERE voter_cnic = '" + cnic + "'";

        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            voter = new Voter(cnic, rs.getString("na_constituency"), rs.getString("pa_Constituency"));
        }
        tearDownDb();
        return voter;
    }

    public static void castVote(Candidature candidature) throws SQLException {
        setupDb();
        int voteCast = 0;

        final String queryRetrieve = "SELECT voteCast FROM Candidature \n"
                + "WHERE constituency_id = '" + candidature.getConstituencyID() + "' AND "
                + "party_id = " + candidature.getPartyID() + ";";

        ResultSet rs = st.executeQuery(queryRetrieve);

        if (rs.next()) {
            voteCast = rs.getInt("voteCast");
            voteCast++;
        }

        final String queryUpdate = "UPDATE Candidature\n"
                + "SET voteCast = " + voteCast
                + "\nWHERE constituency_id = '" + candidature.getConstituencyID() + "' AND "
                + "party_id = " + candidature.getPartyID() + ";";

        st.executeUpdate(queryUpdate);
        tearDownDb();
    }

    public static ArrayList<Ballot> getNABallot(Voter voter) throws SQLException, IOException {
        setupDb();

        String naConst = voter.getNaConstituency();
        final String query = "SELECT Candidates.candidate_name, Candidates.candidate_photo, Parties.party_name, Parties.party_symbol\n"
                + "FROM (Parties INNER JOIN Candidates ON Parties.party_id = Candidates.party_id) INNER JOIN Candidature ON (Parties.party_id = Candidature.party_id) AND (Candidates.candidate_cnic = Candidature.candidate_cnic)\n"
                + "WHERE (((Candidature.constituency_id)='" + naConst + "'));";

        ResultSet rs = st.executeQuery(query);

        ArrayList<Ballot> naBallot = new ArrayList<Ballot>();
        Candidate candidate;
        Party party;

        while (rs.next()) {
            Blob blobCand = rs.getBlob("candidate_photo");
            String imgCand = displayImage(blobCand);
            candidate = new Candidate(rs.getString("candidate_name"), imgCand);

            Blob blobParty = rs.getBlob("party_symbol");
            String sym = displayImage(blobParty);
            party = new Party(rs.getString("party_name"), sym);

            Ballot ballot = new Ballot(candidate, party, voter.getNaConstituency());
            naBallot.add(ballot);
        }

        tearDownDb();
        return naBallot;
    }

    public static ArrayList<Ballot> getPABallot(Voter voter) throws SQLException, IOException {
        setupDb();

        String paConst = voter.getPaConstituency();
        final String query = "SELECT Candidates.candidate_name, Candidates.candidate_photo, Parties.party_name, Parties.party_symbol\n"
                + "FROM (Parties INNER JOIN Candidates ON Parties.party_id = Candidates.party_id) INNER JOIN Candidature ON (Parties.party_id = Candidature.party_id) AND (Candidates.candidate_cnic = Candidature.candidate_cnic)\n"
                + "WHERE (((Candidature.constituency_id)='" + paConst + "'));";

        ResultSet rs = st.executeQuery(query);

        ArrayList<Ballot> paBallot = new ArrayList<Ballot>();
        Candidate candidate;
        Party party;

        while (rs.next()) {
            Blob blobCand = rs.getBlob("candidate_photo");
            String imgCand = displayImage(blobCand);
            candidate = new Candidate(rs.getString("candidate_name"), imgCand);

            Blob blobParty = rs.getBlob("party_symbol");
            String sym = displayImage(blobParty);
            party = new Party(rs.getString("party_name"), sym);

            Ballot ballot = new Ballot(candidate, party, voter.getPaConstituency());
            paBallot.add(ballot);
        }

        tearDownDb();
        return paBallot;
    }

    //register test voter for biometric purposes
    static void registerVoter(String cnic, Fmd fmdVoter) throws SQLException {
        setupDb();
        //query to insert a voter to the Voters' table
        final String query = "INSERT INTO Voters (voter_cnic, voter_name, voter_gender, date_of_birth, voter_fingerprint, "
                + "na_constituency, pa_constituency, voter_district, voter_province, voter_address)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement statement = conn.prepareStatement(query);

        statement.setString(1, cnic);
        statement.setString(2, "Syeda Sana Zehra Zaidi");
        statement.setString(3, "F");
        statement.setString(4, "12/11/2001");
        statement.setBlob(5, (Blob) fmdVoter);
        statement.setString(6, "NA-250");
        statement.setString(7, "PA-118");
        statement.setString(8, "Karachi West-III");
        statement.setString(9, "Sindh");
        statement.setString(10, "567, Street 47, Block A, Karachi West-III, Sindh");

        statement.executeUpdate();
        statement.close();
        tearDownDb();
    }

    //methods related to results
    public static ArrayList<Result> getResults() throws SQLException, IOException {
        setupDb();
        final String query = "SELECT Results.*\n"
                + "FROM Results;";

        ResultSet rs = st.executeQuery(query);
        ArrayList<Result> result = new ArrayList<Result>();
        String constId;
        int votes;
        String candName;
        while (rs.next()) {
            constId = rs.getString("constituency_id");
            votes = Integer.parseInt(rs.getString("Winning Votes"));
            candName = rs.getString("MaxOfcandidate_name");
            Result res = new Result(constId, votes, candName, constId.substring(0, 1));
            result.add(res);
        }
        return result;
    }

    static Boolean hasVoted(Voter voter) throws SQLException {
        setupDb();
        Boolean voted;

        final String query = "SELECT constituency_id FROM [Voting Status] \n"
                + "WHERE voter_cnic = '" + voter.getVoterCNIC() + "' "
                + "AND constituency_type = '" + voter.getNaConstituency() + "' "
                + "AND voting_status = True;";

        ResultSet rs = st.executeQuery(query);
        voted = rs.next();
        tearDownDb();
        return voted;
    }

//    static void updateStatus(String cnic, int naPartyID, String NAconst, int paPartyID, String PAconst) throws SQLException {
//        setupDb();
//
//        //update voting status       
//        final String query = "INSERT INTO [Voting Status]( voter_cnic, constituency_id, constituency_type, voting_status )\n"
//                + "VALUES ('" + cnic + "', '"
//                + NAconst + "', '"
//                + "N" + "', True);";
//        st.executeUpdate(query);
//        tearDownDb();
//    }
}
