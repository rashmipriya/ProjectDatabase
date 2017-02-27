package cs505.databases;

public class Personnel {
	private int id;
	private String name;
	private String designation;
	private String dateofbirth;
	private int ssn;
	private int phonenumber;
	private String address;
	private String city;
	private String country;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public int getSsn() {
		return ssn;
	}
	public void setSsn(int ssn) {
		this.ssn = ssn;
	}
	public int getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(int phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Personnel(int id, String name, String designation, String dateofbirth, int ssn, int phonenumber,
			String address, String city, String country) {
		super();
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.dateofbirth = dateofbirth;
		this.ssn = ssn;
		this.phonenumber = phonenumber;
		this.address = address;
		this.city = city;
		this.country = country;
	}
	public Personnel() {
		super();
	}
	
	
	
}