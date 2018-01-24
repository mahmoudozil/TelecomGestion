package Class;

public class Abonne {
    private int matAbonne;
    private String lastName;
    private String firstName;
    private String address;
    private String email;

    public Abonne(int mat, String lastName , String firstName, String address , String email)
    {
        this.matAbonne = mat ;
        this.lastName = lastName;
        this.firstName = firstName;
        this.address = address;
        this.email = email;
    }

    public int getMatAbonne() {
        return matAbonne;
    }

    public String getLastName() {
        return lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }
}
