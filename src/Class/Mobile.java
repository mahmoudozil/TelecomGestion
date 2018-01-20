package Class;

public class Mobile extends Ligne {

    private String typeMobile;
    private String reseau;
    private String service;

    public  Mobile(int numLigne , int matAbonne , String typeMobile , String reseau, String service)
    {
        this.numeroLigne = numLigne;
        this.matAbonne = matAbonne;
        this.typeMobile = typeMobile;
        this.reseau = reseau;
        this.service = service;


    }
}
