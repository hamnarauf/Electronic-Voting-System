package com.mycompany.evs;

/**
 *
 * @author Binary Beats
 */
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ScheduleXML {

    public static final String XMLFILEPATH = "C:\\Users\\Sana Zehra\\OneDrive\\Documents\\SEECS-NUST\\Semester 2\\OOP\\Project\\EVS\\xmlSchedule.xml";

    public static void editSchedule(String date, String start, String end, String resultTime) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document scheduleDoc = builder.newDocument();

            // schedule element
            Element root = scheduleDoc.createElement("schedule");
            scheduleDoc.appendChild(root);

            //election date
            Element elecDate = scheduleDoc.createElement("elecDate");
            elecDate.appendChild(scheduleDoc.createTextNode(date));
            root.appendChild(elecDate);

            //polling starts at
            Element startPoll = scheduleDoc.createElement("startPoll");
            startPoll.appendChild(scheduleDoc.createTextNode(start));
            root.appendChild(startPoll);

            //polling ends at
            Element endPoll = scheduleDoc.createElement("endPoll");
            endPoll.appendChild(scheduleDoc.createTextNode(end));
            root.appendChild(endPoll);

            //result
            Element result = scheduleDoc.createElement("result");
            result.appendChild(scheduleDoc.createTextNode(resultTime));
            root.appendChild(result);

            // create the xml file
            //transform the DOM Object to an XML File
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource domSource = new DOMSource(scheduleDoc);
            StreamResult streamResult = new StreamResult(new File(XMLFILEPATH));
            transformer.transform(domSource, streamResult);
            
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(ScheduleXML.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException | ParserConfigurationException ex) {
            Logger.getLogger(ScheduleXML.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String[] getSchedule() {
        
        String[] schedule = new String[4];
        
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document scheduleDoc = builder.parse(new File(XMLFILEPATH));
            scheduleDoc.getDocumentElement().normalize();
            
            NodeList elecDate = scheduleDoc.getElementsByTagName("elecDate");
            NodeList startPoll = scheduleDoc.getElementsByTagName("startPoll");
            NodeList endPoll = scheduleDoc.getElementsByTagName("endPoll");
            NodeList result = scheduleDoc.getElementsByTagName("result");
            
            for (int i = 0; i < elecDate.getLength(); i++) {
                Node n1 = elecDate.item(i);
                schedule[0] = n1.getTextContent();
                schedule[0] = schedule[0].substring(8, 10) + "-" + schedule[0].substring(5, 7) + "-" + schedule[0].substring(0, 4);   
            }
            
            for (int i = 0; i < startPoll.getLength(); i++) {
                Node n2 = startPoll.item(i);
                schedule[1] = n2.getTextContent();
            }
            
            for (int i = 0; i < endPoll.getLength(); i++) {
                Node n3 = endPoll.item(i);
                schedule[2] = n3.getTextContent();
            }

            for (int i = 0; i < result.getLength(); i++) {
                Node n4 = result.item(i);
                schedule[3] = n4.getTextContent();
            }
            
        } catch (ParserConfigurationException | SAXException | IOException ex) {
            Logger.getLogger(ScheduleXML.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return schedule;
    }

    public static boolean fileExist() {
        File file = new File(XMLFILEPATH);
        return (file.exists());
    }

}
