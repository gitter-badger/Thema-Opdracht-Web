/*******************************************************************************
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *******************************************************************************/
package atd.database;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import atd.domein.Klant;
import atd.domein.StatusDB;
import atd.domein.User;

/**
 * @author Martijn
 * 
 *         TODO: Heel veel code kan hieruit weg
 *
 */

public class LogDAO {
	private static Connection con = null;
	private static Statement st = null;
	private static ResultSet rs = null;

	private static Properties prop = new Properties();
	private static InputStream config = null;
	
	private static final String CONFIG_URL = "http://localhost:8080/ATD-WEBSITE/config/database.properties";

	/**
	 * Maakt nieuwe Log entry aan in host
	 * 
	 * @return StatusDB Status
	 */
	public static StatusDB setLog(String ip, String tijd, User user, Klant klant) {
		try {
			config = new URL(CONFIG_URL).openStream();
			prop.load(config);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://" + prop.getProperty("host") + ":3306/" + prop.getProperty("database"), prop.getProperty("dbuser"), prop.getProperty("dbpassword"));
			st = con.createStatement();

			String query = "INSERT INTO Log(IP, Tijd, User, Klant) VALUES(?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString(1, ip);
			preparedStmt.setString(2, tijd);
			if (user != null){
				preparedStmt.setInt(3, user.getId());
				preparedStmt.setInt(4, 0);
			}
			else {
				preparedStmt.setInt(3, 0);
				preparedStmt.setInt(4, klant.getId());
			}
			preparedStmt.execute();

		} catch (SQLException | IOException | ClassNotFoundException ex) {
			System.out.println(ex.getMessage());
			return StatusDB.INCORRECT;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}
		return StatusDB.UNKOWN;
	}
}
