package operasmus;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Anakoinwsh {

	//лас лемеи о веияислос тым енаияесеым

	private Connection con;

	private PreparedStatement stmt, stmt1, stmt4;

	private Statement stmt2, stmt3;

	private ResultSet rs, rs1, rs2, rs3, rs4;

	private String insertStatement = "INSERT INTO anakoinwsh(id_anakoinwshs, periexomeno_anakoinwshs, link_anakoinwshs, username8) VALUES (?,?,?,?)";

	private String findText = "SELECT periexomeno_anakoinwshs FROM anakoinwsh WHERE id_anakoinwshs=?";

	private String findTotalNumber = "SELECT periexomeno_anakoinwshs FROM anakoinwsh";

	private String findLink = "SELECT link_anakoinwshs FROM anakoinwsh";


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


	public void insertAnakoinwsh(String counter, String periexomeno, String link, String username) throws SQLException {
		try {
			open();
			stmt = con.prepareStatement(insertStatement);
			stmt.setString(1,counter);
			stmt.setString(2,periexomeno);
			stmt.setString(3,link);
			stmt.setString(4,username);
			stmt.executeUpdate();
			close();
		} catch(SQLException e4) {
			throw new SQLException("Exception while inserting anakoinwsh <br>" + e4.getMessage());
		}
	}

	public int idOfNext() throws SQLException {
		int counter = 0;

		try {
			open();
			stmt2 = con.createStatement();
			rs1 = stmt2.executeQuery(findTotalNumber);

		    while(rs1.next()) {
			    counter++;
		    }
		    close();

		    counter++;
		}catch(SQLException e5) {
			throw new SQLException("Exception while finding the next id <br>" + e5.getMessage());
		}

		return counter;
	}

	public String getText(String id) throws SQLException {
		String text= null;

		try {
			open();
			stmt1 = con.prepareStatement(findText);
			stmt1.setString(1,id);
			rs2 = stmt1.executeQuery();
			while (rs2.next()) {
				text = rs.getString("periexomeno_anakoinwshs");
			}
			rs2.close();
			close();
		}catch(SQLException e6) {
			throw new SQLException("Exception while fetching the text" + e6.getMessage());
		}

		return text;

	}

	public List<String> getAnakoinwseis() throws SQLException {
		List<String> anak = new ArrayList<String>();
		try {
			open();
			stmt3 = con.createStatement();
			rs3 = stmt3.executeQuery(findTotalNumber);
			while(rs3.next()) {
				anak.add(rs3.getString("periexomeno_anakoinwshs"));
			}
			close();
		}catch(SQLException e7) {
			throw new SQLException("Exception while getting all the announcements" + e7.getMessage());
		}
		return anak;

	}

	public List<String> getLinks() throws SQLException {
		List<String> links = new ArrayList<String>();
		try{
			open();
			stmt4 = con.prepareStatement(findLink);
			rs4 = stmt4.executeQuery();
			while(rs4.next()) {
				links.add(rs4.getString("link_anakoinwshs"));
			}
			close();
		}catch(SQLException e8) {
			throw new SQLException("Exception while getting the link" + e8.getMessage());
		}
		return links;

	}

}