package Class;

public class Mobile extends Ligne {

    private String typeMobile;
    private String reseau;
    private String serviceInternet;
    private String serviceCommVocale;

    public  Mobile(int numLigne , int matAbonne , String typeMobile , String reseau, String serviceInternet, String serviceCommVocale)
    {
        this.numeroLigne = numLigne;
        this.matAbonne = matAbonne;
        this.typeMobile = typeMobile;
        this.reseau = reseau;
        this.serviceInternet = serviceInternet;
        this.serviceCommVocale = serviceCommVocale;


    }
    public int getNumeroLigne() {
        return numeroLigne;
    }

    public int getMatAbonne() {
        return matAbonne;
    }
    public String getType()
    {
        return type;
    }

    public String getReseau() {
        return reseau;
    }

    public String getServiceInternet() {
        return serviceInternet;
    }

    public String getServiceCommVocale() {
        return serviceCommVocale;
    }

    public String getTypeMobile() {

        return typeMobile;
    }
}
