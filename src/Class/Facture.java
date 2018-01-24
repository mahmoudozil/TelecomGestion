package Class;

public class Facture {
    private int numFacture;
    private int numLigne;
    private int mois;
    private int annee;
    private String DateLimitP;
    private int nbrU;
    private float Total ;

    public Facture(int numFacture,int numLigne,int mois , int annee, String DateLimitP, int nbrU , float Total)
    {
       this.numLigne = numLigne;
       this.numFacture = numFacture;
       this.mois = mois;
       this.annee = annee;
       this.DateLimitP = DateLimitP;
       this.nbrU = nbrU;
       this.Total = Total;
    }

    public int getNumFacture() {
        return numFacture;
    }

    public int getNumLigne() {
        return numLigne;
    }

    public float getTotal() {
        return Total;
    }

    public int getNbrU() {
        return nbrU;
    }


    public int getMois() {
        return mois;
    }

    public int getAnnee() {
        return annee;
    }

    public String getDateLimitP() {
        return DateLimitP;
    }
}
