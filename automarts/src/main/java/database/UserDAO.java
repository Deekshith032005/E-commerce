package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import model.User;

public class UserDAO {
	
 private Connection conn = null;
 private PreparedStatement ps = null;
 private Result rs = null;
 public int registerUser(User user) {
  String sql = " INSERT INTO user (NAME, USERNAME, MAIL, MOBILE, PASSWORD) VALUES ( ? ,?, ?, ?, ? )";
  int i = 0;
  try {
   conn = DBConnector.getConnection();
   ps = conn.prepareStatement(sql);
   ps.setString(1, user.getName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getMail());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getPassword());
            i = ps.executeUpdate(); // Returns number of affected rows

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DBConnector.closeStatement(ps);
            DBConnector.closeConnection(conn);
        }

        return i;
    }

//=======================LOGIN User=======
public User verifyUser(String username,String password) {
	
	User user = null;
	String sql = "SELECT * FROM user WHERE USERNAME = ? AND PASSWORD =?";
			try(Connection conn = DBConnector.getConnection();
					PreparedStatement ps = conn.prepareStatement(sql)){
				
				ps.setString(1, username);
				ps.setString(2,password);
				
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					user = new User();
					user.setId(rs.getInt("ID"));
					user.setName(rs.getString("NAME"));
					user.setUsername(rs.getString("USERNAME"));
					user.setMail(rs.getString("MAIL"));
					user.setMobile(rs.getString("MOBILE"));
					user.setPassword(rs.getString("PASSWORD"));
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
	return user;
	
				}
public ArrayList<User> getUsers() throws SQLException
{
	String query = "select * from user";
	Connection con = DBConnector.getConnection();
	PreparedStatement statement = con.prepareStatement (query);
	ResultSet rs = statement.executeQuery();
	ArrayList<User> userList = new ArrayList<User>();
	while (rs.next())
	{
		User user = new User();
		user.setName(rs.getString("name"));
		user.setMail(rs.getString("mail"));
		user.setMobile(rs.getString("mobile"));
		user.setId(rs.getInt("id"));
		userList.add(user);
		}
	statement.close();
	DBConnector.closeConnection(con);
	return userList;
	
}
public User getUserWithId(int id) throws SQLException
{
	String query = "select * from users where ID='"+id+"'"; 
	Connection con = DBConnector.getConnection(); 
	PreparedStatement statement = con.prepareStatement(query); 
	ResultSet rs = statement.executeQuery();
	User user=null;
	if (rs.next())
	{
	
		user = new User();
		user.setName(rs.getString("name"));
		user.setMail(rs.getString("mail"));
		user.setMobile(rs.getString("mobile"));
		user.setId(rs.getInt("id"));
		
	}
	statement.close();
	DBConnector.closeConnection(con); 
	return user;
	}
}