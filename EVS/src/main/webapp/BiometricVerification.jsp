<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Biometric Verification</title>
        <!--css--> 
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <!--css for this file-->
        <link rel="stylesheet" href="app.css" type="text/css" />

    </head>
    <body>

        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </div>


        <div id="Container" class="container" >
            <form  action = "BiometricVerificationServlet" method = "POST">
                <!--column 1-->
                <div class="col-sm-5" >


                    <h4 >Enter CNIC</h4>
                    <input name = "cnic" class="form-control" type="text" id="cnic"
                           placeholder="Enter CNIC: XXXXXXXXXXXXX" 
                           pattern="[0-9]{13}" required>

                    <div class="invalid-feedback">
                        Please provide a valid CNIC number
                    </div>



                    <div id="content-reader" style="">  
                        <h4>Select Reader :</h4>
                        <select class="form-control" id="readersDropDown" onchange="selectChangeEvent()">
                        </select>
                        <div id="readerDivButtons">

                            <input type="button" class="btn btn-primary" id="refresh" value="Refresh List" 
                                   onclick="Javascript:readersDropDownPopulate(false)">


                            <!-- Modal - Pop Up window content-->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content -->
                                    <div class="modal-content" id="modalContent" >
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Reader Information</h4>
                                        </div>
                                        <div class="modal-body" id="ReaderInformationFromDropDown">

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div id="contentButtons">

                        <br>
                        <input type="button" class="btn btn-primary" id="start" value="Start Capture" onclick="Javascript:onStart()">
                        <br>
                        <input type="button" class="btn btn-primary" id="stop" value="Stop Capture" onclick="Javascript:onStop()">
                        <br>
                        <input type="button" class="btn btn-primary" id="clearButton" value="Clear Fingerprint" onclick="Javascript:onClear()">
                        <button id = "submit" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                    </div>

                </div>


                <!--column 2-->
                <div class="col-sm-6 offset-md-1" >
                    <div id="Scores">
                        <h4 style="padding: 5px 0px;">Scan Quality : <input type="text" id="qualityInputBox" size="20" style="background-color:#DCDCDC;text-align:center;">

                            </div>
                            <div id="content-capture"">    
                                <div id="status"></div>            
                                <div id="imagediv"></div>

                            </div>


                            <div id="imageGallery">
                            </div>
                            <div id="deviceInfo">           
                            </div>


                    </div>

            </form>
            <div id="saveAndFormats" style="display: none">

                <form name="myForm" style ="border : solid grey;padding:5px;">
                    <b>Acquire Formats :</b><br>
                    <table>
                        <tr data-toggle="tooltip" title="Will save data to a .raw file.">
                            <td>
                                <input type="checkbox" name="Raw" value="1" onclick="checkOnly(this)"> RAW  <br>
                            </td>
                        </tr>
                        <tr data-toggle="tooltip" title="Will save data to a Intermediate file">
                            <td>
                                <input type="checkbox" name="Intermediate" value="2" onclick="checkOnly(this)"> Feature Set<br>
                            </td>
                        </tr>
                        <tr data-toggle="tooltip" title="Will save data to a .wsq file.">
                            <td>
                                <input type="checkbox" name="Compressed" value="3" onclick="checkOnly(this)"> WSQ<br>
                            </td>
                        </tr>
                        <tr data-toggle="tooltip" title="Will save data to a .png file.">
                            <td>
                                <input type="checkbox" name="PngImage" checked="true" value="4" onclick="checkOnly(this)"> PNG
                            </td>
                        </tr>
                    </table>
                </form>
                <br>
                <input type="button" class="btn btn-primary" id="saveImagePng" value="Export" onclick="Javascript:onImageDownload()">
            </div>
        </div>

        <!--javascripts-->

        <!--bootstrap-->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>     
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--fingerprint-->
        <script src="scripts/es6-shim.js"></script>
        <script src="scripts/websdk.client.bundle.min.js"></script>
        <script src="scripts/fingerprint.sdk.min.js"></script>

        <!--javascript for this file-->
        <script src="app.js"></script>


    </body>
</html>