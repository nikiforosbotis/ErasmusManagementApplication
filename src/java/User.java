package operasmus;

public class User {

	private String fname;
	private String lname;
	private String dep;
	private String phone;
	private String am;
	private String email;
	private String password;
	private String photo;
	private int type;
	private String kathigitis;
public User(String fname, String lname, String dep, String am, String password){
	this.fname = fname;
	this.lname = lname;
	this.dep = dep;
	this.am = am;
	this.password = password;
}

	public User(String fname,  String lname, String dep, String phone, String am, String email, String password, String photo) {
		this.fname = fname;
		this.lname = lname;
		this.dep = dep;
		this.phone = phone;
		this.am = am;
		this.email = email;
		this.password = password;
		this.photo = photo;
		type = 1;
		if (dep == "dmst"){
			kathigitis = "vrexopoulos";
		}else{
			kathigitis ="";
		}
	}

	public String getfname() {
		return fname;
	}

	public void setfname(String fname) {
		this.fname = fname;
	}

	public String getlname() {
		return lname;
	}

	public void setlname(String lname) {
		this.lname = lname;
	}
	public String getdep() {
		return dep;
	}

	public void setdep(String dep) {
		this.dep = dep;
	}

	public String getphone() {
		return phone;
	}

	public void setphone(String phone) {
		this.phone = phone;
	}
	public String getam() {
		return am;
	}

	public void setam(String am) {
		this.am = am;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}
	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password =password;
	}

	public String getphoto() {
		return photo;
	}

	public void setphoto(String photo) {
		this.photo = photo;
	}
	public int gettype() {
		return type;
	}
	public String getkathigitis() {
			return kathigitis;
	}
} // end of class
