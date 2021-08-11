<%-- 
    Document   : editCandidate
    Created on : May 26, 2021, 11:59:01 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.DbQuery" %>
<%@page import = "com.mycompany.evs.Party" %>

<!DOCTYPE html>
<html>
    <%
        //list for retrieving data from dbQuery
        ArrayList<Party> parties = new ArrayList<Party>();
        parties = DbQuery.getPartiesList();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Edit Candidate</title>

        <!--css stylesheets-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >
        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <style>

            .button{
                font-family: "Montserrat";
                position: absolute;
                bottom: 12px;
                left: 10%;
                margin-left: -108px;
                width: 8%;
                padding: 5px 20px;
                font-size: 18px;
                background-color: rgba(0, 153, 51, 1);
                color: white;
                border-radius: 5px;
                border: none;
                opacity: 0.9; 
                cursor: pointer;

            }
            .container .form .invalid-feedback {
                margin: 0 auto;
                margin-bottom: 6px;

            }

        </style>


    </head>
    <body>
        <%
            //cache removal
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            //check for valid session
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("Returning Officer"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <section>
            <div class="container">

                <!--candidate removal form-->
                <div class="form form1">
                    <div class="wrapper">

                        <form id="remove" novalidate action = "CandidateServlet" method = "POST">

                            <br>
                            <h1>Remove Candidate</h1>
                            <br>

                            <input name = "cnic" class="form-control" type="text"  id="cnic"
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  name="cnic" pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>


                            <input name = "name" type="text" class="form-control" id="candidateName" placeholder="Enter Candidate Name" required>
                            <div class="invalid-feedback">Please provide a name.</div>

                            <input name = "constituencyID" type="text" class="form-control"  placeholder="Constituency ID, eg: NA-1" required>
                            <div class="invalid-feedback">Please provide a Constituency ID.</div>


                            <textarea name= "reason" class="form-control" id="reason" rows="4"  placeholder = "Reason" required ></textarea>
                            <div class="invalid-feedback">Please provide a reason.</div>

                            <input type="hidden" name="action" value="remove">

                            <br>
                            <button id = "remove" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>


                <!--candidate registration form-->
                <div class="form form2 active">
                    <div class="wrapper">

                        <form id="register" novalidate action = "CandidateServlet" enctype='multipart/form-data' method = "POST">

                            <h1>Register Candidate</h1>
                            <br>

                            <input name = "cnic" class="form-control" type="text"  id ="cnic"
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  
                                   pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>


                            <input name = "name" type="text" class="form-control"  placeholder="Enter Candidate Name" id="candidateName" required>
                            <div class="invalid-feedback">Please provide a candidate name.</div>


                            <input name = "DOB" id = "DOB" placeholder="Date of Birth" class="form-control"" type="text" onfocus="(this.type = 'date')" 
                                   onblur="(this.type = 'text')" max="1996-04-30" required  onkeypress="return false"/>
                            <div class="invalid-feedback">Please provide valid date of birth.</div>



                            <select name = "party" class="form-control" 
                                    style="width: 300px;background-color: rgba(199, 197, 197, 0.425);margin: 0 auto;"  required >
                                <option selected disabled value="">Select a party</option>

                                <%
                                    //loop for populating drop down
                                    for (int i = 0; i < parties.size(); i++) {
                                        Party party = new Party();
                                        party = parties.get(i);
                                %>
                                <option value=<%= (party.getPartyID())%>><%= (party.getPartyName())%></option>

                                <%
                                    };
                                %>

                            </select>

                            <div class="invalid-feedback">
                                Please select a party.
                            </div>

                            <input name = "constituencyID" style="margin-top: 5px" type="text" class="form-control"  placeholder="Constituency ID, eg: NA-1" required>
                            <div class="invalid-feedback">Please provide a Constituency ID.</div>


                            <div class="row offset-md-1" >
                                <div class="custom-control custom-radio mb-3" style="margin:5px; text-align: left">
                                    <input type="radio" value="M" class="custom-control-input" id="action1" name="gender" required>
                                    <label class="custom-control-label" for="action1" >Male</label>
                                    <div class="invalid-feedback">Please select an action.</div>
                                </div>

                                <div class="custom-control custom-radio mb-3 " style="margin:5px;  text-align: left">
                                    <input type="radio" value="F"class="custom-control-input" id="action2" name="gender" required>
                                    <label class="custom-control-label" for="action2">Female</label>
                                </div>                           
                            </div>

                            <label class="custom-control-label" for="photo">Candidate's Photo</label>          
                            <input name = "photo" type="file" id = "photo" class="form-control" aria-label="photo" required />
                            <div class="invalid-feedback">Please attach candidate's photo</div>

                            <br>

                            <input type="hidden" name="action" value="register">
                            <button id = "register" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>

                <!--overlays-->
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-left">
                            <h1>Candidate Removal</h1>
                            <!--<p></p>-->
                            <button id="removeButton">Remove</button>
                        </div>
                        <div class="overlay-right">
                            <h1>Candidate Registration</h1>
                            <!--<p></p>-->
                            <button id="registerButton">Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div>
            <a href="Candidates.jsp" target="_parent"> <button class="button" >Back</button></a>
        </div>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type= "text/javascript" src="form.js"></script>

    </body>
</html>