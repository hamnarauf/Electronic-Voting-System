<%-- 
    Document   : VoterVerification
    Created on : Jun 3, 2021, 2:19:08 AM
    Author     : Binary Beats
--%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta  charset=UTF-8">
        <title>Profile</title>

        <!--css-->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--logo-->
        <link rel="icon" href="images/logo.png" />
        <!--background-->
        <link rel="stylesheet" href="bg.css" >
        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >



        <style>
            
            a, p{
                
                color: white;
                
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
                background: rgba(0, 153, 51, 0.7);

            }


            h6{
                font-size: 21px;
                color: white;
                font-family: "Montserrat";
                font-weight: bold;
            }

            h4{
                font-size: 30px;
                color: white;
                font-family: "Montserrat";
                font-weight: bold;
            }
            h2{
                color:whitesmoke;
                font-size:50px;                
                font-family: "Montserrat";
                text-transform: uppercase;
                padding-top: 90px;
                padding-bottom: 15px;
            }

            .col-sm-8 text-secondary{
                color: white;
            }

        </style>
    </head>

    <body>
        <!--navbar-->
        <div class="navbar">
            <ul>
                <li><a href="ScheduleServlet">Schedule</a></li>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="ResultsServlet">Results</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>           

            </ul>
        </div>


        <h2 style="text-align: center">Profile</h2>
        <!--profile card-->
        <div class="container">


            <div class="row gutters-sm">
                <!--column 1-->
                <div class="col-md-4 "  >
                    <div class="card" >
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img img src="data:images/jpg;base64,${voter.voterPhoto}", alt="user" width="150">
                                <div class="mt-3">
                                    <h4>${voter.voterName}</h4>
                                    <p style="font-weight: bold;">${voter.voterCNIC}</p>
                                    <p >${voter.voterAddress}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--column 2-->
                <div class="col-md-8">
                    <div class="card">


                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">Father's Name</h6>
                                </div>
                                <div class="col-sm-8 ">
                                    <a style="color: white">${voter.fatherName}</a>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">Gender</h6>
                                </div>
                                <div class="col-sm-8">
                                    <a style="color: white">${voter.voterGender}</a>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">DOB</h6>
                                </div>
                                <div class="col-sm-8">
                                    <a style="color: white">  ${voter.dateOfBirth}</a>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">District</h6>
                                </div>
                                <div class="col-sm-8">
                                    <a style="color: white">${voter.voterDistrict}</a>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">Province</h6>
                                </div>
                                <div class="col-sm-8">
                                    <a style="color: white">${voter.voterProvince}</a>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">NA constituency</h6>
                                </div>
                                <div class="col-sm-8">
                                    <a style="color: white">${voter.naConstituency}</a>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6 class="mb-0">PA constiteuncy</h6>
                                </div>
                                <div class="col-sm-8">
                                    <a style="color: white"> ${voter.paConstituency}</a>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>