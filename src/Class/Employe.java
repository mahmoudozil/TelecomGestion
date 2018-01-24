package Class;

public class Employe {

    private int cin;
    private String name;
    private String email;
    private String pass;
    private String role;

    public Employe(int cin, String name , String email, String pass , String role)
    {
        this.cin = cin ;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.role = role;
    }

    public int getCin() {
        return cin;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

    public String getRole() {
        return role;
    }
}
