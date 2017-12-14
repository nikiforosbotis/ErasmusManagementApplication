package operasmus;

public class Sxolia {

	private String periexomeno;
	private String name;
	private int validated;
	private String id;
	private String newname;
	public Sxolia(String periexomeno, String name, int validated, String id, String newname){

		this.periexomeno = periexomeno;
		this.name = name;
		this.validated = validated;
		this.id = id;
		this.newname = newname;
	}


	public String getPeriexomeno(){
		return periexomeno;
	}
	public void setPeriexomeno(String periexomeno){
		this.periexomeno=periexomeno;
	}
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
	public int getValidated(){
		return validated;
	}
	public void setValidated(int validated){
		this.validated=validated;
	}
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public String getNewname(){
		return newname;
	}
	public void setNewname(String id){
		this.newname = newname;
	}
}