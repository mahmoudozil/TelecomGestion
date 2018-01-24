package Class;

public class CommVocale extends Service {


    public CommVocale(int numS , String des , float cout)
    {
        this.numService = numS;
        this.description = des;
        this.cout = cout;
    }
    public int getNumService() {
        return numService;
    }

    public String getDescription() {
        return description;
    }

    public float getCout() {
        return cout;
    }

    public String getType() {
        return type;
    }
}
