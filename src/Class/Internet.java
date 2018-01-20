package Class;

public class Internet extends Service {
    private String ISP;

    public Internet(int numS , String des , float cout , String ISP)
    {
        this.numService = numS;
        this.description = des;
        this.cout = cout;
        this.ISP = ISP;
    }
}
