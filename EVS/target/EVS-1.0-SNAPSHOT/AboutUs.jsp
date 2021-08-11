<%-- 
    Document   : AboutUs
    Created on : Jun 3, 2021, 12:31:46 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <!--bootstrap css files-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

        <!--background css file-->      
        <link href="bg.css" rel="stylesheet">

        <!--navbar css file-->
        <link href="navbar.css" rel="stylesheet">
        <style>

            /*css style for this page*/

            .custom-padding {
                padding-top: 50px;
            }
            .container{

                margin-top: 130px;
                display: flex;
                justify-content: center;
                flex-direction: row;
            }
            h1{
                margin-top: 50px;
                color: white;
                font-family: "Montserrat";
                font-weight: 700;
                font-size: 50px;
            }
            img {
                max-width: 100%;
                height: auto;
            }
            .socials a {
                line-height: 30px;
                text-align: center;
                border-radius: 50%;
                margin: 5px;
                color: #fff;
                display: inline-block;
                border: 1px solid #fff;
                height: 30px;
                width: 30px;
            }
            .team-area h2 {
                font-size: 20px;
                text-align: center;
                font-weight: 700;
                margin-top: 15px;
                color: #000;
                color: white;
                text-transform: uppercase;
            }
            .team-area h2 span {
                display: block;
                font-weight: 300;
                margin-top: 10px;
                font-size: 16px;
            }
            .socials {
                margin-top: -27px;
                position: relative;
                z-index: 2;
                border-radius: 25px;
                background:rgba(0, 153, 51, 1);
                text-align: center;
                padding: 5px;
                margin-left: 25px;
                margin-right: 25px;
            }
            .socials a:hover {
                background: #fff;
                color: #000;
                transition: .7s;
            }
            @media only screen and (max-width: 767px) {
                .team-area {
                    margin-bottom: 30px;
                }
                .team-area img {
                    width: 100%;
                }
            }
            @media only screen and (min-width: 768px) and (max-width: 991px) {
                .team-area {
                    margin-bottom: 30px;
                }
                .team-area img {
                    width: 100%;
                }
            }
        </style>

    </head>
    <body>
        <!--navbar-->
        <div class="navbar" style="padding-top: 25px">
            <ul>            
                <li><a href="home.jsp">Home</a></li>   
                <li><a href="ScheduleServlet?schedule=normal">Schedule</a></li>   
                <li><a href="ResultsServlet">Results</a></li>
            </ul>
        </div>

        <!--about us card-->
        <div class="custom-padding">
            <div class="container">

                <!--column 1-->
                <div class="col-md-5">

                    <!--member 1-->
                    <div class="team-area">
                        <img alt="" src="images/sana.jpg">
                        <div class="socials">

                            <a href="https://www.facebook.com/sana.zehra.16" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/sanazehra001/" target="_blank"><i class="fa fa-instagram"></i></a>

                        </div>
                        <h2>Syeda Sana <span>Group Leader</span></h2>
                    </div>
                </div>

                <!--column 2-->
                <div class="col-md-5">

                    <!--member 2-->
                    <div class="team-area">
                        <img alt="" src="images/saif.jpg">
                        <div class="socials">

                            <a href="https://www.facebook.com/saifullah.shahid2002" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/saifsafsf/" target="_blank"><i class="fa fa-instagram"></i></a>

                        </div>
                        <h2>Saifullah <span>Group Member</span></h2>
                    </div>
                </div>

                <!--column 3-->
                <div class="col-md-5">
                    <!--member 3-->
                    <div class="team-area">
                        <img alt="" src="images/hamnaR.png">
                        <div class="socials">

                            <a href="https://www.facebook.com/ham232/" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/hamna.hamoo/" target="_blank"><i class="fa fa-instagram"></i></a>

                        </div>
                        <h2>Hamna Rauf <span>Group Member</span></h2>
                    </div>
                </div>

                <!--column 4-->
                <div class="col-md-5">
                    <!--member 4-->
                    <div class="team-area">
                        <img alt="" src="images/hamnaN.jpeg">
                        <div class="socials">
                            <a href="https://www.facebook.com/hamna.naveed.545" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a>
                        </div>
                        <h2>Hamna Naveed<span>Group Member</span></h2>
                    </div>
                </div>

                <!--column 5-->
                <div class="col-md-5">
                    <!--member 5-->
                    <div class="team-area">
                        <img alt="" src="images/faiq.jpeg">
                        <div class="socials">

                            <a href="https://www.facebook.com/faiq.jamal.1" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/faiqjamal_fj/" target="_blank"><i class="fa fa-instagram"></i></a>

                        </div>
                        <h2>Faiq Jamal <span>Group Member</span></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<h1 style="text-align: center">BINARY BEATS</h1>

</body>
</body>
</html>