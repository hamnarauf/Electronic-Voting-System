<%-- 
    Document   : Schedule
    Created on : Jun 3, 2021, 1:18:11 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Schedule</title>

        <!--css-->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

    </head>


    <style type= "text/css">
        h1{
            color:whitesmoke;
            font-size:60px;                
            font-family: "Montserrat";
            text-transform: uppercase;
            padding-top: 90px;
            padding-bottom: 25px;

        }
        * {margin: 0; padding: 0;}

        .tree ul {
            padding-top: 10px; position: center;
            font-size: 30px;
            color: whitesmoke;
            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        .tree li {
            float: center; text-align: center;
            list-style-type: none;
            font-size: 30px;
            position: relative;
            padding: 20px 0px 0 5px;
            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        /*We will use ::before and ::after to draw the connectors*/

        .tree li::before, .tree li::after{
            content: '';
            position: absolute; top: 0; right: 50%;
            border-top: 1px solid #ccc;
            width: 50%; height: 20px;
        }
        .tree li::after{
            right: auto; left: 50%;
            border-left: 1px solid #ccc;
        }

    </style>
    <body>



        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="home.jsp">Home</a></li>
                <li><a href="ResultsServlet">Results</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>

            </ul>
        </div>

        <!--schedule-->
        <h1 style="text-align: center" >Schedule</h1>
        <div class="tree">
            <ul>


                <ul>
                    <p style="text-align: center">Election Day ${date} </p>
                </ul>
                <ul>
                    <li>
                        <a>Polling Starts At: ${start}</a>
                    </li>

                    </li>
                    <li>
                    <u1>
                        <a> Polling Ends At: ${end}</a>
                    </u1>
                    <ul> 
                        <li>
                            <a>Result: ${result}</a>
                        </li>
                    </ul>
                    </li>
                </ul>
            </ul>
        </li>
    </ul>
</div>
</body>

</html>
