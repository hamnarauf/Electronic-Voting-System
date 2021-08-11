<%-- 
    Document   : VoteCasting
    Created on : May 26, 2021, 11:49:22 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>

<!--calling classes-->
<%@page import = "com.mycompany.evs.Ballot" %>
<%@page import = "com.mycompany.evs.Voter" %>
<%@page import = "com.mycompany.evs.Candidate" %>
<%@page import = "com.mycompany.evs.Party" %>
<%@page import = "com.mycompany.evs.DbQuery" %>


<!DOCTYPE html>
<html>
    <%
        //getting attribute of voter
        Voter voter = (Voter) request.getAttribute("voter");

        //ballot for provincial assembly
        ArrayList<Ballot> PAballot = new ArrayList<Ballot>();
        PAballot = DbQuery.getPABallot(voter);

        //ballot for national assembly
        ArrayList<Ballot> NAballot = new ArrayList<Ballot>();
        NAballot = DbQuery.getNABallot(voter);

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vote Casting</title>
        <!--css-->

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--background-->
        <link rel="stylesheet" href="bg.css" >
        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />
    </head>


    <style type= "text/css">
        h1{
            color:whitesmoke;
            font-size:50px;                
            font-family: "Montserrat";
            text-transform: uppercase;
            padding-top: 30px;
            padding-bottom: 15px;

        }

        body{
            background-attachment: fixed;
        }

        button {
            padding: 10px 50px;
            border: none;
            font-family: "Montserrat";
            font-size: 18px;
            background-color: rgba(0, 153, 51, 1);
            cursor: pointer;
            color: white;
            opacity: 0.9;
            border-radius: 3px;
            margin-bottom: 15px;
        }
        figcaption{
            font-size: 15px;
            font-weight: bold;

        }

    </style>
    <body>

        <h1 style="text-align: center">Vote Casting</h1>
        <div class="container" style="text-align: center">
            <form  id="ballot-form"  novalidate action = "BiometricVerificationServlet" method = "POST">
                <div class="row">

                    <!--column 1-->
                    <div class="container col-md-6"  >
                        <div class="container" style="text-align: center; background-color: white; opacity: 0.88" >

                            <!--table for national assembly-->
                            <table class="table table-sm ">
                                <br>
                                <h4 style="text-align:center; font-size:30px"><%= voter.getNaConstituency()%></h4>

                                <input type="hidden" name="naConstituency" value="<%= voter.getNaConstituency()%>">
                                <input type="hidden" name="cnic" value="<%= voter.getVoterCNIC()%>">

                                <br>
                                <thead>
                                    <tr style="margin: 10px;">

                                        <th scope="col" style="font-size:20px">CANDIDATE</th>
                                        <th scope="col" style="font-size:20px">PARTY</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        //loop for retirving data for NA ballot paper
                                        for (int i = 0; i < NAballot.size(); i++) {
                                            Ballot naBallot = new Ballot();
                                            naBallot = NAballot.get(i);
                                            Candidate candidate = naBallot.getCandidate();
                                            Party party = naBallot.getParty();

                                    %>
                                    <tr>
                                    <tr>
                                        <td height="3" colspan="2" style="background-color: rgba(0, 153, 51, 0.8)"></td>
                                    </tr>
                                <td> 

                                    <!--radio button-->
                                    <div class="custom-control custom-radio mb-3" style="margin:5px">
                                        <input type="radio" value="<%= party.getPartyID()%>" class="custom-control-input" id="N<%= i%>" name="N" required>
                                        <label class="custom-control-label" for="N<%= i%>" ></label><img src="data:image/jpg;base64,<%= candidate.getCandidatePhoto()%>" width="150", height="150">
                                        <figcaption "><%= candidate.getCandidateName()%></figcaption></td></div></td>

                        <td><img src="data:image/jpg;base64,<%= party.getPartySymbol()%>">
                        <figcaption "><%= party.getPartyName()%></figcaption></td>
                            <%
                                }
                            %>

                        <tr>

                            </tbody>
                            </table>

                    </div>
                </div>
                <!--column 2-->
                <div class="container col-md-6">
                    <div class="container" style="text-align: center; background-color: white; opacity: 0.88" >
                        <!--table 2-->
                        <table class="table table-sm ">
                            <br>
                            <h4 style="text-align:center; font-size:30px"><%= voter.getPaConstituency()%></h4>
                            <input type="hidden" name="paConstituency" value="<%= voter.getPaConstituency()%>">
                            <br>
                            <thead>
                                <tr>
                                    <!--entities of table-->
                                    <th scope="col" style="font-size:20px">CANDIDATE</th>
                                    <th scope="col" style="font-size:20px">PARTY</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    //loop for retrieving data for Pa ballot

                                    for (int i = 0; i < PAballot.size(); i++) {
                                        Ballot paBallot = new Ballot();
                                        paBallot = PAballot.get(i);
                                        Candidate candidate = paBallot.getCandidate();
                                        Party party = paBallot.getParty();

                                %>

                                <tr>
                                <tr>
                                    <td height="3" colspan="2" style="background-color: rgba(0, 153, 51, 0.8)"></td>
                                </tr>
                            <td> 


                                <!--radio button-->
                                <div class="custom-control custom-radio mb-3" style="margin:5px">
                                    <input type="radio" value="<%= party.getPartyID()%>" class="custom-control-input" id="P<%= i%>" name="P" required>
                                    <label class="custom-control-label" for="P<%= i%>" ></label><img src="data:image/jpg;base64,<%= candidate.getCandidatePhoto()%>", height="150", width="150">
                                    <figcaption "><%= candidate.getCandidateName()%></figcaption></td></div></td>

                    <td><img src="data:image/jpg;base64,<%= party.getPartySymbol()%>">
                    <figcaption "><%= party.getPartyName()%></figcaption></td>
                        <%
                            }
                        %>

                    </tr>
                    </tbody>
                    </table>
                </div>
        </div>
    </div>


    <button type="submit">Submit</button>
</form>
</div>




<!--javascript-->

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



<script>
    $(document).ready(function () {
        console.log("sjdh");
        $('#ballot-form').on('submit', function (event) {
            event.preventDefault();
            let form = new FormData(this);

            //sending to ResultsServlet
            $.ajax({
                url: 'BiometricVerificationServlet',
                method: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    swal("Thank You!", "Your vote has been cast successfully", "success")
                            .then((value) => {
                                window.location = "BiometricVerification.jsp";
                            });

                    console.log(data);

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);

                },
                processData: false

            });
        });
    });


</script>
</body>
</html>