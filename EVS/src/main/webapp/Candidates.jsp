
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.Candidate" %>
<%@page import = "com.mycompany.evs.DbQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
//        getting candidates list to display all candidates
        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        candidates = DbQuery.getCandidatesList();
    %>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates</title>
        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <style>
            /*css for this page*/

            h1{
                color:whitesmoke;
                font-size:50px;                
                font-family: "Montserrat";
                text-transform: uppercase;
                padding-top: 100px;
                padding-bottom: 40px;
            }
            .container{

                color:white;
            }
            body{
                background-attachment: fixed ; 

            }

            .button{
                font-family: "Montserrat";
                padding: 6px 20px;
                font-size: 18px;
                background-color: rgba(0, 153, 51, 1);
                color: white;
                border-radius: 5px;
                border: none;
                cursor: pointer;

            }


        </style>
    </head>
    <body>
        <%
//            cache removal
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            //sessions
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("Returning Officer"))) {
                response.sendRedirect("home.jsp");
            }

        %>

        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="RO.jsp">Home</a></li>
                <li><a href="EditCandidate.jsp">Add/Remove</a></li>
                <li><a href="#exampleModalCenter" data-toggle="modal" >Clear All</a></li>

                <!--modal-->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 style="font-weight: bold" class="modal-title" id="exampleModalLongTitle">Are You Sure?</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Once you clear all candidates, changes can not be reversed.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <a href="CandidateServlet?clearAll=clear" > <button  class=" button">Yes</button></a>                            </div>
                        </div>
                    </div>
                </div>
                <li><a href="LogoutServlet">LogOut</a></li>          
            </ul>
        </div>

        <h1 style="text-align: center"><b>Candidates</b></h1>


        <div class="container" style="text-align: center">

            <!--table-->
            <table class="table table-sm">

                <thead>
                    <tr>
                        <!--first row-->
                        <th scope="col" style="font-size:20px">SR. NO. </th>
                        <th scope="col" style="font-size:20px">CNIC</th>
                        <th scope="col" style="font-size:20px">NAME</th>
                        <th scope="col" style="font-size:20px">GENDER</th>
                        <th scope="col" style="font-size:20px">DOB</th>
                        <th scope="col" style="font-size:20px">PARTY NAME</th>

                    </tr>
                </thead>
                <tbody>
                    <%//retiriving candidates information for displaying
                        for (int i = 0; i < candidates.size(); i++) {
                            Candidate candidate = new Candidate();
                            candidate = candidates.get(i);

                    %>


                    <tr>
                        <!--filling in the rows of table-->
                        <td><%=i + 1%></td>
                        <td><%=candidate.getCandidateCNIC()%></td>
                        <td><%=candidate.getCandidateName()%></td>
                        <td><%=candidate.getCandidateGender()%></td>
                        <td><%=candidate.getDateOfBirth()%></td>
                        <td><%=candidate.getPartyName()%></td>


                    </tr>
                    <%
                        };
                    %>
                </tbody>
            </table>
        </div>


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>