<%-- 
    Document   : EditConstituency
    Created on : May 26, 2021, 11:59:50 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Constituency</title>

        <!--css stylesheets-->

        <!--booststrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <style>
            .container {

                min-height: 600px;
                min-width: 800px;
                max-width: 800px;

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

            //check for valid session
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("ECP"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <section>
            <div class="container">

                <!--constituency removal form-->
                <div class="form form1">
                    <div class="wrapper">

                        <form id="remove" novalidate action = "ConstituencyServlet" method = "POST">

                            <br>
                            <h1>Remove <br>Constituency</h1>
                            <br>

                            <label class="custom-control-label" style = "margin:7px;" >Constituency Type</label> 
                            <div class="row offset-md-2" >
                                <div class="custom-control custom-radio ">
                                    <input type="radio" class="custom-control-input" value = "N" id="action1" name="constituencyType" required>
                                    <label class="custom-control-label" for="action1" >National Assembly (N)</label>
                                </div>
                            </div>

                            <div class="row offset-md-2" >
                                <div class="custom-control custom-radio "style = "margin-bottom:11px;" >
                                    <input type="radio" class="custom-control-input" value="P" id="action2" name="constituencyType" required>
                                    <label class="custom-control-label" for="action2">Provincial Assembly (P)</label>
                                    <div class="invalid-feedback">Please select a constituency type.</div>
                                </div>                           
                            </div>  

                            <input name = "constituencyNo" type="number" min = "1" class="form-control"  placeholder="Enter Constituency Number, eg: 2" id ="constituency_no" required>
                            <div class="invalid-feedback">Please provide a constituency number.</div>


                            <select name = "province" class="form-control" 
                                    style="width: 300px;background-color: rgba(199, 197, 197, 0.425);margin: 0 auto;"  required >
                                <option selected disabled value="">Select a province</option>
                                <option>Punjab</option>
                                <option>Sindh</option>
                                <option>Balochistan</option>
                                <option>KPK</option>
                                <option>Capital</option>
                            </select>

                            <div class="invalid-feedback">
                                Please select a province.
                            </div>
                            <input type="hidden" name="action" value="remove">

                            <br>
                            <button id = "remove" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>

                <!--constituency registration form-->
                <div class="form form2 active">
                    <div class="wrapper">

                        <form id="register" novalidate action = "ConstituencyServlet" method = "POST">

                            <h1>Register <br>Constituency</h1>
                            <br>

                            <label class="custom-control-label" style = "margin:7px;" >Constituency Type</label> 
                            <div class="row offset-md-2" >
                                <div class="custom-control custom-radio ">
                                    <input type="radio" class="custom-control-input" value = "N" id="action3" name="regConstituencyType" required>
                                    <label class="custom-control-label" for="action3" >National Assembly (N)</label>
                                </div>
                            </div>

                            <div class="row offset-md-2" >
                                <div class="custom-control custom-radio "style = "margin-bottom:11px;" >
                                    <input type="radio" class="custom-control-input" value= "P" id="action4" name="regConstituencyType" required>
                                    <label class="custom-control-label" for="action4">Provincial Assembly (P)</label>
                                    <div class="invalid-feedback">Please select a constituency type.</div>
                                </div>                           
                            </div>  

                            <input name = "constituencyNo" type="number" min = "1" class="form-control"  placeholder="Enter Constituency Number, eg: 2" id ="constituency_no" required>
                            <div class="invalid-feedback">Please provide a constituency number.</div>

                            <input name = "district" type="text" class="form-control"  placeholder="Enter District" id="distrcit" required>
                            <div class="invalid-feedback">Please provide a district.</div>


                            <select name = "province" class="form-control" 
                                    style="width: 300px;background-color: rgba(199, 197, 197, 0.425);margin: 0 auto;"  required >
                                <option selected disabled value="">Select a province</option>
                                <option>Punjab</option>
                                <option>Sindh</option>
                                <option>Balochistan</option>
                                <option>KPK</option>
                                <option>Capital</option>
                            </select>

                            <div class="invalid-feedback">
                                Please select a province.
                            </div>
                            <input type="hidden" name="action" value="register">
                            <br>
                            <button id = "register" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>


                <!--overlays-->
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-left">
                            <h1>Constituency<br>Removal</h1>

                            <button id="removeButton">Remove</button>
                        </div>
                        <div class="overlay-right">
                            <h1>Constituency<br>Registration</h1>

                            <button id="registerButton">Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <div>
            <a href="Constituencies.jsp" target="_parent"> <button  class=" button">Back</button></a>
        </div>



        <!--javascript-->

        <script type= "text/javascript" src="form.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>