<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.mycompany.evs.Result" %>
<%@page import = "com.mycompany.evs.DbQuery" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "java.util.Random" %>
<%@page import = "com.mycompany.evs.Party" %>

<!DOCTYPE html>
<html>

    <%
//retrieving data from data base
        ArrayList<Result> result = new ArrayList<Result>();
        result = DbQuery.getResults();

        ArrayList<Party> parties = new ArrayList<Party>();
        parties = DbQuery.getPartiesList();
        
Random rand = new Random();
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>

        <!--css-->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 
        <!--logo-->
        <link rel="icon" href="images/logo.png" />
        <!--background-->
        <link rel="stylesheet" href="bg.css" >
        navba
        <link rel="stylesheet" href="navbar.css" >



        <style>
            h1{
                color:white;
                font-size:60px;                
                text-transform: uppercase;                        
                padding-bottom: 30px;
                padding-top: 70px;

            }            
            .container{
                padding-left:5px;
                padding-right:5px;
                color: white;
            }

            body{
                background-attachment: fixed;

            }
        </style>
    </head>
    <body>
        <!--navbar-->    
        <div class="navbar">
            <ul>                            
                <li><a href="Schedule.jsp">Schedule</a></li>   
                <li><a href="home.jsp">Home</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>                      
            </ul>
        </div>

        <h1 style="text-align: center">Results</h1>

        <!--Progress bar-->
        <div class="container">
            <div class="progress-title">
                <h3>Pakistan Tehreek-e-Insaf</h3>
                <div class="progress">           
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" 
                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 80%">4998</div>             
                </div></div>
            <br>

            <div class="progress-title">
                <h3>Pakistan Muslim League (N)</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar"
                         aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 60%">3056</div>             
                </div></div>
            <br>

            <div class="progress-title">
                <h3>Pakistan Peoples Party</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" 
                         aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 40%">1153</div>             
                </div></div>
            <br>

            <div class="progress-title">
                <h3>Jamaat-e-Islami</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" 
                         aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 20%">423</div>             
                </div></div>
            <br>

            <div class="progress-title">
                <h3>Muttahida Qaumi Movement</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" 
                         aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%">370</div>             
                </div></div>
        </div>
        <br><br><br><br>

        <!--NA Table-->        
        <div class = "container" style="text-align: center">
            <div class="row">
                <div class="container col-md-5"  >

                    <table class="table table-sm">
                        <br>
                        <h4 style="text-align:center; font-size:30px">NATIONAL ASSEMBLY</h4>
                        <br>

                        <thead>
                            <tr>

                                <th scope="col" style="font-size:20px">ID</th>
                                <th scope="col" style="font-size:20px">Candidate</th>
                                <th scope="col" style="font-size:20px">Party Symbol</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //loop for retrieving data for constituencies
                                for (int i = 0; i < result.size(); i++) {
                                    Result naResult = new Result();
                                    naResult = result.get(i);

                                    Party party = new Party();
                                    party = parties.get(rand.nextInt(9));

                                    if ("N".equals("N")) {

                            %>

                            <tr>
                                <!--filling in the table-->
                                <td><%= naResult.getConstId()%></td>
                                <td><%= naResult.getCandName()%></td>
                                <td><img src="data:image/jpg;base64,<%= party.getPartySymbol()%>">


                            </tr>
                            <%

                                    }
                                }

                            %>
                        </tbody>
                    </table>

                </div>
                <!--PA Table-->
                <div class="container col-md-5">
                    <table class="table table-sm ">
                        <br>
                        <h4 style="text-align:center; font-size:30px">PROVINCIAL ASSEMBLY</h4>
                        <br>
                        <thead>
                            <tr>
                                <th scope="col" style="font-size:20px">ID</th>
                                <th scope="col" style="font-size:20px">Candidate</th>
                                <th scope="col" style="font-size:20px">Party Symbol</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%    //loop for retrieving data for constituencies
                                for (int i = 0; i < result.size(); i++) {
                                    Result paResult = new Result();
                                    paResult = result.get(i);
                                    
                                   
                                    Party party = new Party();
                                    party = parties.get(rand.nextInt(9));
                                    
                                    if ("P".equals("P")) {

                            %>

                            <tr>
                                <!--filling in the table-->
                                <td><%= paResult.getConstId()%></td>
                                <td><%= paResult.getCandName()%></td>
                                <td><img src="data:image/jpg;base64,<%= party.getPartySymbol()%>">

                            </tr>
                            <%
                                    }
                                }

                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>




        <!--javascript-->

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>