package operasmus;

import java.sql.*;
import operasmus.Utility;

public class Foititis {


	private Connection con = null;

	private String am = null;

	private String username = null;

	private String name = null;

	private String department = null;

	private int department_num;

	private String kwdikos = null;

	private ResultSet rs = null;

	private ResultSet rs1 = null;

	private ResultSet rs2 = null;

	private PreparedStatement stmt = null;

	private PreparedStatement stmt1 = null;

	private PreparedStatement stmt2 = null;

	private final String fetchAmFromUsername = "SELECT am FROM Foititis WHERE username=?";

	private final String fetchNameFromUsername = "SELECT onoma FROM Xrhsths WHERE username=?";

	private final String fetchDepartmentFromUsername = "SELECT tmhma FROM Xrhsths WHERE username=?";

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

	public String fetchAm(String username) throws SQLException {
		try {
			open();
			stmt = con.prepareStatement(fetchAmFromUsername);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while(rs.next()) {
				am = rs.getString("am");
			}
			stmt.close();
			close();
		} catch(Exception e1) {
		}
		return am;
	}

	public String fetchName(String username) throws SQLException {
		try {
			open();
			stmt1 = con.prepareStatement(fetchNameFromUsername);
			stmt1.setString(1,username);
			rs1 = stmt1.executeQuery();
			while(rs1.next()) {
				name = rs1.getString("onoma");
			}
			stmt1.close();
			close();
		} catch(Exception e2) {
		}
		return name;
	}

	public String fetchDepartment(String username) throws SQLException {
		try {
			open();
			stmt2 = con.prepareStatement(fetchDepartmentFromUsername);
			stmt2.setString(1,username);
			rs2 = stmt2.executeQuery();
			while(rs2.next()) {
				department = rs2.getString("tmhma");
			}
			stmt2.close();
			close();
		} catch(Exception e3) {
		}
		return department;
	}

	public enum Department {
		DMST, LOXRH, MKT, IT, OIKON, DEOS, ODE, STAT
	}

	public int fetchDepartmentNum(String department1) {

		Department d = Department.valueOf(department1);

		switch(d) {
			case DMST:
				department_num = 1;
				break;
			case LOXRH:
				department_num = 2;
				break;
			case MKT:
				department_num = 3;
				break;
			case IT:
				department_num = 4;
				break;
			case OIKON:
				department_num = 5;
				break;
			case DEOS:
				department_num = 6;
				break;
			case ODE:
				department_num = 7;
				break;
			case STAT:
				department_num = 8;
				break;
		}

		return department_num;
	}


}




