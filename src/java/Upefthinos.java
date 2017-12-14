package operasmus;

public class Upefthinos {

	private String name;
	private String kwdikos;
	private int id;
	public Upefthinos(String name, String kwdikos, int id){
	this.name= name;
	this.kwdikos = kwdikos;
	this.id = id;
	}
	public String gename() {
			return name;
		}
	
		public void setname(String name) {
			this.name = name;
		}
	
		public String getkwdikos() {
			return kwdikos;
		}
	
		public void setkwdikos(String kwdikos) {
			this.kwdikos = kwdikos;
		}
		public int getid() {
			return id;
		}
	
		public void setid(int id) {
			this.id = id;
	}
	}
