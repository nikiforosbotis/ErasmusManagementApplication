package operasmus;

import java.sql.*;
import operasmus.Utility;
import java.util.List;
import java.util.ArrayList;

//лас лемеи о веияислос тым енаияесеым

public class Panepistimio {

	private Connection con = null;

	private String id;

	private String country;

	private String name;

	private ResultSet rs, rs1, rs2, rs3, rs4, rs5, rs6 = null;

	private PreparedStatement stmt, stmt1, stmt2, stmt3, stmt4, stmt5, stmt6 = null;

	private final String fetchPanepistimioCountry = "SELECT id_panepistimiou FROM Panepistimio WHERE xwra=?;";

	private final String fetchPanepistimio = "SELECT onoma FROM Panepistimio WHERE xwra=?;";

	private final String fetchName = "SELECT onoma FROM Panepistimio WHERE id_panepistimiou=?;";

	private final String fetchId = "SELECT id_panepistimiou FROM panepistimio WHERE onoma=?;";

	private final String isUniDept = "SELECT id_panepistimiou9 FROM panepisthmia_tmhmata WHERE (id_panepistimiou9=? AND tmhma=?);";


	private String onoma;
	private double poso;
	private String glwssa;
	private String apaitoumeno_epipedo;
	private int arithmos_thesewn;
	private String xwra;
	private String epipleon_parathrhseis;
	private String email;
	private String link;
	private String mathimata;



	Utility utility = new Utility();
		public Panepistimio(String id, String onoma, double poso,String glwssa, String apaitoumeno_epipedo, int arithmos_thesewn, String xwra, String epipleon_parathrhseis, String email, String link,String mathimata){
			this.id = id;
			this.onoma = onoma;
			this.poso = poso;
			this.glwssa = glwssa;
			this.apaitoumeno_epipedo =apaitoumeno_epipedo;
			this.arithmos_thesewn = arithmos_thesewn;
			this.xwra=xwra;
			this.epipleon_parathrhseis=epipleon_parathrhseis;
			this.email = email;
			this.link = link;
			this.mathimata=mathimata;
		}
		public Panepistimio(){
		}
		public String getId(){
			return id;
		}
		public void setId(String id){
			this.id = id;
		}
		public String getOnoma(){
			return onoma;
		}
		public void setOnoma(String onoma){
			this.onoma = onoma;
		}
		public double getPoso(){
			return poso;
		}
		public void setPoso(double Poso){
			this.poso = poso;
		}
		public String getGlwssa(){
			return glwssa;
		}
		public void setGlwssa(String glwssa){
			this.glwssa = glwssa;
		}
		public String getApaitoumeno_epipedo(){
			return apaitoumeno_epipedo;
		}
		public void setApaitoumeno_epipedo(String apaitoumeno_epipedo){
			this.apaitoumeno_epipedo=apaitoumeno_epipedo;
		}
		public Integer getArithmos_thesewn(){
			return arithmos_thesewn;
		}
		public void setArithmos_thesewn(int arithmos_thesewn){
			this.arithmos_thesewn=arithmos_thesewn;
		}
		public String getXwra(){
			return xwra;
		}
		public void setXwra(String xwra){
			this.xwra=xwra;
		}
		public String getEpipleon_parathrhseis(){
			return epipleon_parathrhseis;
		}
		public void setEpipleon_parathrhseis(String epipleon_parathrhseis){
			this.epipleon_parathrhseis=epipleon_parathrhseis;
		}
		public String getEmail(){
			return email;
		}
		public void setEmail(String email){
			this.email=email;
		}
		public String getLink(){
			return link;
		}
		public void setLink(String link){
			this.link=link;
		}
		public String getMathimata(){
			return mathimata;
		}
		public void setMathimata(String mathimata){
			this.mathimata=mathimata;
		}
		public void open() throws SQLException {
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch(Exception e1) {

			}

			try {
				con = DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup15",
	          "ismgroup15", "gjt93o");
		  } catch(Exception e2) {

			  con = null;
		  }
  		}

  	  public void close() throws SQLException {
  		  try {
  			  if(con != null) {
  				  con.close();
  			  }
  		  } catch(Exception e3) {

  		   }
	   }

	public ResultSet fetchPanepistimio(String country) throws SQLException {
		try {
			utility.open();
			stmt = con.prepareStatement(fetchPanepistimioCountry);
			stmt.setString(1, country);
			rs = stmt.executeQuery();
			stmt.close();
			utility.close();
		} catch(Exception e1) {
		}
		return rs;
	}

	public List<String> getName(String country) throws SQLException {
		List<String> names = new ArrayList<String>();
		try {
			open();
			stmt1 = con.prepareStatement(fetchPanepistimio);
			stmt1.setString(1,country);
			rs1 = stmt1.executeQuery();
			while(rs1.next()) {
				names.add(rs1.getString("onoma"));
			}
			rs1.close();
			close();
		}catch(Exception e2) {
			throw new SQLException(e2.getMessage());
		}

		return names;

	}

	public String getId(String name) throws SQLException {
		String id = "";
		try {
			open();
			stmt2 = con.prepareStatement(fetchId);
			stmt2.setString(1,name);
			rs2 = stmt2.executeQuery();
			while(rs2.next()) {
				id = rs2.getString("id_panepistimiou");
			}
			if (id == ""){
				throw new Exception("lathos");
			}
			rs2.close();
			close();
		}catch(Exception e3) {
			throw new SQLException(e3.getMessage());
		}

		return id;
	}


	public boolean isUniversityDept(String id,int tmhma) throws SQLException {
		String id_pan = null;;
		boolean is;
		try {
			open();
			stmt3 = con.prepareStatement(isUniDept);
			stmt3.setString(1,id);
			stmt3.setInt(2,tmhma);
			rs3 = stmt3.executeQuery();
			while(rs3.next()) {
				id_pan = rs3.getString("id_panepistimiou9");
			}
			rs3.close();
			close();
		} catch(Exception e4) {
			throw new SQLException(e4.getMessage());
		}

		if(id_pan == null) {
			is = false;
		} else {
			is = true;
		}

		return is;
	}

	public String getNameFromId(String id) throws SQLException {
		try {
			open();
			stmt4 = con.prepareStatement(fetchName);
			stmt4.setString(1,id);
			rs4 = stmt4.executeQuery();
			while(rs4.next()) {
				name = rs4.getString("onoma");
			}
			rs4.close();
			close();
		} catch(Exception e5) {
			throw new SQLException(e5.getMessage());
		}
		return name;
	}
	public List<String> getAll(int numb) throws SQLException {
		List<String> all = new ArrayList<String>();
		String unall = "SELECT id_panepistimiou9 FROM panepisthmia_tmhmata WHERE tmhma=?;";
		String ull = "SELECT onoma FROM panepistimio WHERE id_panepistimiou=?;";
		String x = null;
		try {
			open();
			stmt5 = con.prepareStatement(unall);
			stmt5.setInt(1,numb);
			rs5 = stmt5.executeQuery();
			while(rs5.next()) {
				x = rs5.getString("id_panepistimiou9");
				stmt6 = con.prepareStatement(ull);
				stmt6.setString(1,x);
				rs6 = stmt6.executeQuery();
				while(rs6.next()){
				all.add(rs6.getString("onoma"));
			}
			}
			stmt5.close();
			stmt6.close();
			rs5.close();
			rs6.close();
			close();
		}catch(Exception e2) {
			throw new SQLException(e2.getMessage());
		}

		return all;

	}

	public void insertAit(String username, String onoma, String epwnumo, String tmhma, String am, String email, String uni1, String uni2, String uni3) throws SQLException {
			String insert = "Insert into ismgroup15.aithsh VALUES(?, ? , ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt7 = null;

			try {
				open();
				stmt7 = con.prepareStatement(insert);
				stmt7.setString(1,username);
				stmt7.setString(2,onoma);
				stmt7.setString(3,epwnumo);
				stmt7.setString(4,tmhma);
				stmt7.setString(5,am);
				stmt7.setString(6,email);
				stmt7.setString(7,uni1);
				stmt7.setString(8,uni2);
				stmt7.setString(9,uni3);
				stmt7.executeUpdate();
				stmt7.close();
				stmt7.close();
				close();
			} catch(Exception e5) {
				throw new SQLException(e5.getMessage());
			}
	}

	public List<String> getAlls(String am) throws SQLException {
			List<String> all = new ArrayList<String>();
			String unall = "SELECT uni1, uni2, uni3 FROM aithsh WHERE username10=?;";
			PreparedStatement stmt8 = null;
			ResultSet rs8 = null;
			try {
				open();
				stmt8 = con.prepareStatement(unall);
				stmt8.setString(1,am);
				rs8 = stmt8.executeQuery();
				while(rs8.next()) {
					all.add(rs8.getString("uni1"));
					all.add(rs8.getString("uni2"));
					all.add(rs8.getString("uni3"));
				}
				stmt8.close();
				rs8.close();
				close();
			}catch(Exception e2) {
				throw new SQLException(e2.getMessage());
			}

			return all;

	}

	public List<String> getAithseis() throws SQLException {
				List<String> all = new ArrayList<String>();
				String unall = "SELECT * FROM aithsh ;";
				PreparedStatement stmt9 = null;
				ResultSet rs9 = null;
				try {
					open();
					stmt9 = con.prepareStatement(unall);
					rs9 = stmt9.executeQuery();
					while(rs9.next()) {
						all.add(rs9.getString("fname"));
						all.add(rs9.getString("lname"));
						all.add(rs9.getString("username10"));
					}
					stmt9.close();
					rs9.close();
					close();
				}catch(Exception e2) {
					throw new SQLException(e2.getMessage());
				}

				return all;

	}



}