package operasmus;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Agaphmena {

	private Connection con = null;
	private String id;
	private String country;
	private ResultSet rs = null;
	private ResultSet rs1 = null;
	private Statement stmt = null;
	private PreparedStatement stmt1 = null;
	private PreparedStatement stmt2 = null;
	private PreparedStatement stmt3 = null;
	private PreparedStatement stmt4 = null;
	private String errorMessages = "";
	private final String addFavs = "INSERT INTO agaphmena_panepisthmia(username3,id_panepistimiou1) VALUES(?,?);";

	public String getErrorMessages() {
		return errorMessages;
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
  		  } catch(Exception e3) {
  			   errorMessages = "Could not close connection with the Database Server: <br>" + e3.getMessage();
  		   }
	   }

	public List<Panepistimio> fetchPanepistimio(String x) throws Exception {
		int c = 0;
		List<Panepistimio> uniList = new ArrayList<Panepistimio>();
		try {
			open();
			String agaphmenaQuery = "SELECT * FROM ismgroup15.agaphmena_panepisthmia where username3 = '"+x+"';";
			stmt = con.createStatement();
			rs = stmt.executeQuery(agaphmenaQuery);
			c++;
			if(rs == null){
				uniList = null;
			}
			while(rs.next()) {
				c++;
				String uniQuery = "Select * from ismgroup15.panepistimio where id_panepistimiou = ?;";
				stmt1 = con.prepareStatement(uniQuery);
				stmt1.setString(1, rs.getString("id_panepistimiou1"));
				rs1 = stmt1.executeQuery();
				c++;
				while(rs1.next()) {
					c++;
					uniList.add(new Panepistimio(rs1.getString("id_panepistimiou"), rs1.getString("onoma"), rs1.getDouble("poso_mhniaias_epixorhghshs"), rs1.getString("glwssa"), rs1.getString("apaitoumeno_epipedo"), rs1.getInt("arithmos_thesewn"), rs1.getString("xwra"), rs1.getString("epipleon_parathrhseis"), rs1.getString("email"), rs1.getString("link"), rs1.getString("mathimata")));
					c++;
				}
			}
				stmt.close();
				rs.close();
				stmt1.close();
				rs1.close();
				close();

			return uniList;
		} catch (Exception e) {
			return uniList;
		}

	}

	public void deleteFavourites(String z) throws Exception {
		try {
			open();
			stmt2 = con.prepareStatement("Delete FROM ismgroup15.agaphmena_panepisthmia where id_panepistimiou1 = ?;");
			stmt2.setString(1, z);
			stmt2.executeUpdate();
			stmt2.close();
			close();
		} catch (Exception ex) {
			throw new Exception("An error occured while updating favourites' list");
		}
	}

	public void insertFavourites(String id) throws Exception {
		try {
			open();
			stmt3 = con.prepareStatement("INSERT INTO ismgroup15.agaphmena_panepisthmia() VALUES()  where username = ?;");
			stmt3.setString(1, id);
			stmt3.executeUpdate();
			stmt3.close();
			close();
		} catch (Exception ex) {
			throw new Exception("An error occured while inserting into favourites' list");
		}
	}

	public void addToFavourites(String username, String uni_id) throws SQLException {
		try {
			open();
			stmt4 = con.prepareStatement(addFavs);
			stmt4.setString(1,username);
			stmt4.setString(2,uni_id);
			stmt4.executeUpdate();
			close();
		} catch(Exception e5) {
			throw new SQLException("An error occured while inserting into favourites' list");
		}

	}



}
