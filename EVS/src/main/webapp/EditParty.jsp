<%-- 
    Document   : EditParty
    Created on : Jun 3, 2021, 12:54:46 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.DbQuery" %>
<%@page import = "com.mycompany.evs.Party" %>

<!DOCTYPE html>
<html>
    <%
        //list for retrieving information from data base
        ArrayList<Party> parties = new ArrayList<Party>();
        parties = DbQuery.getPartiesList();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Party</title>

        <!--css stylesheets-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >
        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />


        <style>
            .container {

                min-height: 550px;
                min-width: 570px;
                max-width: 770px;

            }
            .button{
                font-family: "Montserrat";
                position: absolute;
                bottom: 25px;
                left: 10%;
                margin-left: -108px;
                width: 8%;
                padding: 8px 20px;
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
            //cache removal
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            //check for valid sesssion
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("ECP"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <section>
            <div class="container">

                <!--party removal form-->
                <div class="form form1">
                    <div class="wrapper">

                        <form id="remove" novalidate action = "PartyServlet" enctype='multipart/form-data' method = "POST">
                            <h1>Remove Party</h1>
                            <br>

                            <select name = "party" class="form-control" 
                                    style="width: 300px;background-color: rgba(199, 197, 197, 0.425);margin-bottom: 5px;"  required >
                                <option selected disabled value="">Select a party</option>

                                <%
                                    //loop for populating dropdown
                                    for (int i = 0; i < parties.size(); i++) {
                                        Party party = new Party();
                                        party = parties.get(i);
                                %>
                                <option value=<%= (party.getPartyName())%>><%= (party.getPartyName())%></option>

                                <%
                                    };
                                %>

                            </select>

                            <div class="invalid-feedback">
                                Please select a party.
                            </div>

                            <textarea name= "reason" class="form-control" id="reason" rows="4"  placeholder = "Reason" required ></textarea>
                            <div class="invalid-feedback">Please provide a reason.</div>

                            <input type="hidden" name="action" value="remove">
                            <button id = "remove" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>



                <!--party registration form--> 
                <div class="form form2 active">
                    <div class="wrapper">

                        <form id="register" novalidate action = "PartyServlet" enctype='multipart/form-data' method = "POST">

                            <h1>Register Party</h1>
                            <br>


                            <input name = "name" type="text" class="form-control"  placeholder="Enter Party Name" id="name" required>
                            <div class="invalid-feedback">Please provide a party name.</div>


                            <input name = "leader" type="text" class="form-control"  placeholder="Enter Leader name" id="leader" required>
                            <div class="invalid-feedback">Please provide a leader name.</div>

                            <input name = "symbolName" type="text" class="form-control"  placeholder="Enter Symbol Name" id="symbolName" required>
                            <div class="invalid-feedback">Please provide a symbol name.</div>

                            <label class="custom-control-label" for="photo">Symbol</label>          
                            <input name = "symbol" type="file" id = "photo" class="form-control" aria-label="symbol" required />
                            <div class="invalid-feedback">Please attach a symbol</div>
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
                            <h1>Party<br>Removal</h1>

                            <button id="removeButton">Remove</button>
                        </div>
                        <div class="overlay-right">
                            <h1>Party<br>Registration</h1>

                            <button id="registerButton">Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <div>
            <a href="Parties.jsp" target="_parent"> <button class=" button">Back</button></a>

        </div>

        <!--javascript-->
        <script type= "text/javascript" src="form.js"></script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>