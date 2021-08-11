package com.mycompany.evs;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.digitalpersona.uareu.*;
import com.digitalpersona.uareu.Engine;
import com.digitalpersona.uareu.Fid;
import com.digitalpersona.uareu.Fmd;
import com.digitalpersona.uareu.UareUException;
import java.awt.image.BufferedImage;
import java.awt.image.ColorConvertOp;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.ByteArrayInputStream;
import javax.imageio.ImageIO;
import javax.servlet.annotation.MultipartConfig;
import static javax.xml.bind.DatatypeConverter.parseBase64Binary;

/**
 *
 * @author Binary Beats
 */
@MultipartConfig
public class BiometricVerificationServlet2 extends HttpServlet {

    String destinationPage; //next webpage

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UareUException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String cnic = request.getParameter("cnic");     //from the form on the jsp
            Fmd fmdVoter = getFmdOfVoterFingerprint(request, response); //create Fingerprint Minutiae Data of the Voter
            Fmd fmdDb;
            Voter voter;
            RequestDispatcher requestDispatcher;

            if (fmdVoter != null) { //if Fmd has been created successfully
                voter = DbQuery.biometricVerify(cnic);  //get voter data from the database
                if (voter != null) {    //if the cnic has matched one of the records from the database
                    fmdDb = voter.getFingerprint(); //get fmd from the database

                    Engine engine = UareUGlobal.GetEngine();
                    int falsematch_rate = engine.Compare(fmdVoter, 0, fmdDb, 0);    //compare fmds
                    int target_falsematch_rate = Engine.PROBABILITY_ONE / 100000;

                    if (falsematch_rate < target_falsematch_rate) { //if they match
                        System.out.println("Fingerprints matched.\n");
                        String str = String.format("dissimilarity score: 0x%x.\n", falsematch_rate);
                        System.out.println(str);
                        str = String.format("false match rate: %e.\n\n\n", (double) (falsematch_rate / Engine.PROBABILITY_ONE));
                        System.out.println(str);
                        request.setAttribute("voter", voter);
                        destinationPage = "VoteCasting.jsp";

                    } else {
                        System.out.println("Fingerprints did not match.\n\n\n");
                        HttpSession session = request.getSession();
                        String msg = "Fingerprints did not match";
                        session.setAttribute("error", msg);
                        destinationPage = "BiometricVerification.jsp";
                    }
                } else {
                    HttpSession session = request.getSession();
                    String msg = "This cnic is not registered with our system";
                    session.setAttribute("error", msg);
                    destinationPage = "BiometricVerification.jsp";
                }
                
            } else {
                HttpSession session = request.getSession();
                String msg = "Please place your thumb correctly";
                session.setAttribute("error", msg);
                destinationPage = "BiometricVerification.jsp";
            }
            
            requestDispatcher = request.getRequestDispatcher(destinationPage);
            requestDispatcher.forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(BiometricVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Fmd getFmdOfVoterFingerprint(HttpServletRequest request, HttpServletResponse response) {

        try {
            //getting req parameters from javascript
            String fingerprint = request.getParameter("fingerprint");
            Integer width = Integer.parseInt(request.getParameter("width"));
            Integer height = Integer.parseInt(request.getParameter("height"));
            Integer inDpi = Integer.parseInt(request.getParameter("inDpi"));
            Integer fingerPosition = Integer.parseInt(request.getParameter("fingerPosition"));
            Integer cbeffId = Integer.parseInt(request.getParameter("cbeffId"));
            Integer outDpi = Integer.parseInt(request.getParameter("outDpi"));
            boolean rotate180 = Boolean.parseBoolean(request.getParameter("rotate180"));

            BufferedImage pngImg = base64toImage(fingerprint);
            // create a grayscale image the same size
            BufferedImage grayImg = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_GRAY);

            // convert the original colored image to grayscale
            ColorConvertOp op = new ColorConvertOp(
                    pngImg.getColorModel().getColorSpace(),
                    grayImg.getColorModel().getColorSpace(), null);
            op.filter(pngImg, grayImg);

            // convert buffered image to raw byte array
            byte[] imgRaw = convertToRaw(grayImg);

            // convert raw byteArray to FID ()
            Fid fid = UareUGlobal.GetImporter().ImportRaw(imgRaw,
                    width, height, inDpi, fingerPosition, cbeffId,
                    Fid.Format.ANSI_381_2004, outDpi, rotate180);

            // convert FID to FMD
            Fmd fmd = UareUGlobal.GetEngine().CreateFmd(fid,
                    Fmd.Format.ANSI_378_2004);
            return fmd;

        } catch (UareUException | IOException ex) {
            Logger.getLogger(BiometricVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static BufferedImage base64toImage(String fingerprint) throws IOException {
        byte[] pngBytes = parseBase64Binary(fingerprint);
        BufferedImage image = ImageIO.read(new ByteArrayInputStream(pngBytes));
        return image;
    }

    public static byte[] convertToRaw(BufferedImage grayImg) {
        //convert BufferedImage to raw byte array
        WritableRaster raster = grayImg.getRaster();
        DataBufferByte data = (DataBufferByte) raster.getDataBuffer();
        return data.getData();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (UareUException ex) {
            Logger.getLogger(BiometricVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (UareUException ex) {
            Logger.getLogger(BiometricVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Biometrically Verifies each Voter against the database";
    }

}
