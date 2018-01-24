package Helper;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class XMLParser extends DefaultHandler {

    private boolean bHost = false;
    private boolean bPort = false;
    private boolean bUsername = false;
    private boolean bPassword = false;

    @Override
    public void startElement(
            String uri, String localName, String qName, Attributes attributes)
            throws SAXException {

        if (qName.equalsIgnoreCase("host")) {
            bHost = true;
        } else if (qName.equalsIgnoreCase("port")) {
            bPort = true;
        } else if (qName.equalsIgnoreCase("username")) {
            bUsername = true;
        } else if (qName.equalsIgnoreCase("password")) {
            bPassword = true;
        }
    }

    @Override
    public void characters(char ch[], int start, int length) throws SAXException {

        if (bHost) {
//            System.out.println("Host : " + new String(ch, start, length));
            bHost = false;
            MailHelper.setHost(new String(ch, start, length));
        } else if (bPort) {
//            System.out.println("Port : " + new String(ch, start, length));
            bPort = false;
            MailHelper.setPort(Integer.parseInt(new String(ch, start, length)));
        } else if (bUsername) {
//            System.out.println("Username : " + new String(ch, start, length));
            bUsername = false;
            MailHelper.setUsername(new String(ch, start, length));
        } else if (bPassword) {
//            System.out.println("Password : " + new String(ch, start, length));
            bPassword = false;
            MailHelper.setPassword(new String(ch, start, length));
        }
    }
}