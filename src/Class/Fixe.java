package Class;

public class Fixe extends Ligne{
    private String localGeo;


    public Fixe(int numLigne, int matAbonne, String localGeo)
    {
        this.numeroLigne = numLigne;
        this.matAbonne = matAbonne;
        this.localGeo = localGeo;
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

    public String getLocalGeo() {
        return localGeo;
    }
}