package operasmus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Utility {

	//Ã¡” Ã≈Õ≈… œ ◊≈…—…”Ãœ” ‘ŸÕ ≈Œ¡…—≈”≈ŸÕ
//to type einai 1 gia foititi kai 2 gia ypeythino

	private Connection con = null;
	private ResultSet rs1 = null;
	private ResultSet rs2 = null;
	private ResultSet rs3 = null;
	private ResultSet rs4 = null;
	private ResultSet rs5 = null;
	private ResultSet rs6 = null;
	private ResultSet rs7 = null;
	private PreparedStatement stmt = null;
	private PreparedStatement stmt1 = null;
	private PreparedStatement stmt2 = null;
	private PreparedStatement stmt3 = null;
	private PreparedStatement stmt4 = null;
	private PreparedStatement stmt5 = null;
	private Statement stmt6 = null;
	private PreparedStatement stmt7 = null;
	private PreparedStatement stmt8 = null;
	private PreparedStatement stmt9 = null;
	private String errorMessages = "";

	public String getErrorMessages() {
		return errorMessages;
	}
public Utility(){
}

	public void open() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch(Exception e1) {
			errorMessages = "MySQL Driver error: <br>" + e1.getMessage();
		}

		try {
			con = DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup15",
          "ismgroup15", "gjt93o");
	  } catch(Exception e2) {
		  errorMessages = "Could not establish connection with the Database Server: <br>" + e2.getMessage();
		  con = null;
	  }
  }

	  public void close() throws SQLException {
		  try {
			  if(con != null) {
				  con.close();
			  }
			if (stmt1 != null){
				stmt1.close();
			}
			if (stmt2 != null){
							stmt2.close();
			}
			if (stmt3 != null){
										stmt3.close();
			}
			if (stmt != null){
													stmt.close();
			}
  	      		if (rs1 != null){
  	        		rs1.close();
			}
				if (rs2 != null){
			  	        		rs2.close();
			}
		  } catch(Exception e3) {
			   errorMessages = "Could not close connection with the Database Server: <br>" + e3.getMessage();
		   }
	   }
	  	public int getType(String am) throws Exception{

	  		int type = 3;
	  		try{
				stmt2 = con.prepareStatement("select usertype from ismgroup15.xrhsths where username=?;");
				stmt2.setString(1, am);
	  			rs2 = stmt2.executeQuery();

	  			 while(rs2.next()) {
	  				 type = rs2.getInt("usertype");
				 }
	  			 if(type != 3){
					 return type;
	  			 } else {
					 throw new Exception("type not found");
				 }




	  		} catch (Exception r) {
	  			throw new Exception(r.getMessage());
	  		} finally {
				stmt2.close();
	  			rs2.close();
			}

	}
public void validateUser(String username, String password) throws SQLException  {
	  if(con == null) {
	  	errorMessages = "You must connect first";
	  }

	int count = 0;
	  try {
	  	stmt1 = con.prepareStatement("select * from  ismgroup15.xrhsths where username=? and kwdikos=?;");
	  	stmt1.setString(1, username);
	  	stmt1.setString(2, password);
	  	rs1 = stmt1.executeQuery();
		if(rs1.next()){
			return;
		} else {
			errorMessages = "ƒÂÌ ı‹Ò˜ÂÈ ·ÌÙÈÛÙÔﬂ˜ÈÛÁ ÏÂÙ·Ó˝ username Í·È password";
			throw new Exception(errorMessages);
		}
	  } catch (Exception e4) {
	  		errorMessages = e4.getMessage();


	  		throw new SQLException(errorMessages);

 	  } finally {
		  stmt1.close();
	  	  rs1.close();
	  }
  }
public int registerUser(User user) throws SQLException {

int apad = 0;
    if (con == null) {
      errorMessages = "You must establish a connection first!";
      throw new SQLException(errorMessages);
    }

	    try {
	      stmt = con.prepareStatement("insert into xrhsths (onoma, epwnumo, username, kwdikos, tmhma, usertype) values (?,?,?,?,?,?);");

	      stmt.setString(1, user.getfname());
	      stmt.setString(2, user.getlname());
	      stmt.setString(3, user.getam());
	      stmt.setString(4, user.getpassword());
	      stmt.setString(5, user.getdep());
	      stmt.setInt(6, user.gettype());
	      // execute query
	      apad = stmt.executeUpdate();
	      stmt.close();
	      stmt3 = con.prepareStatement("insert into foithths( phone, username1, email, photo, upeuthinos_kathigitis) values (?,?,?,?,?);");
	      stmt3.setString(1, user.getphone());
	      stmt3.setString(2, user.getam());
		  stmt3.setString(3, user.getemail());
		  stmt3.setString(4, user.getphoto());
	      stmt3.setString(5, user.getkathigitis());
	      apad = stmt3.executeUpdate();
	      stmt3.close();

	      return apad;

	    } catch (Exception e4) {
	      errorMessages = "Error while inserting student to the database: <br>"
	          + e4.getMessage();
	      throw new SQLException(errorMessages);
	    }
  }
public User getStudentsData(String am) throws Exception {
 	 int c = 0;
 	 try {
		c++;
		open();
		stmt4 = con.prepareStatement("SELECT * FROM ismgroup15.xrhsths WHERE username = ? ;");
		stmt4.setString(1, am);
		rs3 = stmt4.executeQuery();
		User u = null;
		c++;
		while(rs3.next()) {
			c++;
			String firstName = rs3.getString("onoma");
			String lastName = rs3.getString("epwnumo");
			String departement = rs3.getString("tmhma");
			String code = rs3.getString("kwdikos");
			c++;
			u = new User(firstName, lastName, departement, am, code);
			c++;
		}
		stmt4.close();
		rs3.close();
		close();
		if (u == null) {
			throw new Exception("There is no student with this username");
		} else {
			return u;
		}
	} catch(Exception v) {
		throw new Exception("Error"+c+":"+ v.getMessage());
	}
	}

	public String getEmail(String am) throws Exception{
		String email = null;
		try{
			open();
			stmt5 = con.prepareStatement("Select *from ismgroup15.foithths where username1 = ? ;");
			stmt5.setString(1, am);
			rs4 = stmt5.executeQuery();
			 while(rs4.next()) {
				 email = rs4.getString("email");
			 }
			stmt5.close();
			rs4.close();
			close();
			if(email == null) {
				throw new Exception("There is no student with this username");
			} else {
				return email;
			}
		} catch (Exception r) {
			throw new Exception(r.getMessage());
		}

	}
	public Panepistimio fetchPanepistimio(String id1) throws SQLException  {
				  if(con == null) {
				  	errorMessages = "You must connect first";
				  }
				  try {
				  	stmt9 = con.prepareStatement("select * from panepistimio where id_panepistimiou=?;");
					stmt9.setString(1, id1);

				  	rs6 = stmt9.executeQuery();
				  	if (rs6.next()) {
						String onoma = rs6.getString("onoma");
						double poso = rs6.getDouble("poso_mhniaias_epixorhghshs");
						String glwssa = rs6.getString("glwssa");
						String apaitoumeno_epipedo = rs6.getString("apaitoumeno_epipedo");
						int arithmos_thesewn = rs6.getInt("arithmos_thesewn");
						String xwra = rs6.getString("xwra");
						String epipleon_parathrhseis = rs6.getString("epipleon_parathrhseis");
						String email = rs6.getString("email");
						String link = rs6.getString("link");
						String mathimata = rs6.getString("mathimata");
						Panepistimio pan = new Panepistimio(id1, onoma, poso, glwssa, apaitoumeno_epipedo,arithmos_thesewn,xwra,epipleon_parathrhseis, email, link,mathimata);
				  		stmt9.close();
				  		rs6.close();
				  		return pan;
					} else {
						errorMessages = "kati phge lathos";
						return null;
					}
				  } catch (Exception e4) {
				  		 errorMessages = e4.getMessage();
					  	 throw new SQLException(errorMessages);


			 	  }
	  		}
	  		public String fetchName(String id)throws SQLException{
				if(con == null) {
				  	errorMessages = "You must connect first";
				}
				 try {
					stmt9 = con.prepareStatement("select onoma from panepistimio where id_panepistimiou=?;");
					stmt9.setString(1, id);
					rs6 = stmt9.executeQuery();
					if (rs6.next()) {
						String name = rs6.getString("onoma");
						return name;



				} else {
					throw new Exception("No match");
				}
			} catch(Exception e){
				errorMessages = e.getMessage();
				throw new SQLException(errorMessages);
			} finally {
				stmt9.close();
				rs6.close();
			}




			}
	  		public List<Sxolia> getAllSxolia(String id2) throws SQLException  {
				List<Sxolia> sxolia = new ArrayList<Sxolia>();
				if(con == null) {
					errorMessages = "You must connect first";
				}
				try {
					if(id2!="0"){
						stmt7 = con.prepareStatement("select periexomeno, username6, new_name from sxolio where id_panepistimiou4=?  AND validated = 0;");
						stmt7.setString(1, id2);
					} else {
						stmt7 = con.prepareStatement("select periexomeno, username6, id_panepistimiou4, new_name from sxolio where validated = 1;");

					}

					rs7 = stmt7.executeQuery();
					String id_pan;
					while(rs7.next()) {

						String username = rs7.getString("username6");
						String newname = rs7.getString("new_name");
						String periexomeno = rs7.getString("periexomeno");
						int validated = 1;
						if(id2=="0"){
							id_pan = rs7.getString("id_panepistimiou4");
						} else {
							id_pan = id2;
						}
						Sxolia sx = new Sxolia(periexomeno, username, validated, id_pan, newname);
						sxolia.add(sx);
					}
				} catch (Exception e5) {
						errorMessages = "Error while getting all students from database!<br>"
						+ e5.getMessage();
						throw new SQLException(errorMessages);
				}
				return sxolia;
			}
			public void setSxolio(String periexomeno, String name, String name2, String id_pan, String name3)throws SQLException{
				if(con == null) {
					errorMessages = "You must connect first";
				}
				try {
					stmt8 = con.prepareStatement("insert into sxolio (periexomeno, username6, username7, validated, id_panepistimiou4, new_name) values (?, ?, ?, 1, ?, ?);");
					stmt8.setString(1, periexomeno);
					stmt8.setString(2, name);
					stmt8.setString(3, name2);
					stmt8.setString(4, id_pan);
					stmt8.setString(5, name3);
					stmt8.executeUpdate();
				}catch (Exception e5) {
					errorMessages = e5.getMessage();
					throw new SQLException(errorMessages);
				}
		}
		public void conCom(boolean state, String per)throws SQLException{
			if(con == null) {
				errorMessages = "You must connect first";
			}
			try {
				PreparedStatement preparedStmt;
				if(state == true){
					preparedStmt = con.prepareStatement("update sxolio set validated = 0 where periexomeno = ?;");
					preparedStmt.setString(1, per);

				} else {
					preparedStmt = con.prepareStatement("delete from sxolio where periexomeno = ?;");
					preparedStmt.setString(1, per);
				}
				preparedStmt.executeUpdate();


			}catch (Exception e5) {
				errorMessages = e5.getMessage();
				throw new SQLException(errorMessages);
			}
		}




}
