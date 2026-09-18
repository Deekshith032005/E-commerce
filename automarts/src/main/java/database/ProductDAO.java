package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import model.Product;
import model.User;

public class ProductDAO {
	
 private Connection conn = null;
 private PreparedStatement ps = null;
 private Result rs = null;
 public int addProduct(Product product)
 {
     String sql = "INSERT INTO products (NAME, DESCRIPTION, PRICE, IMAGE) VALUES (?, ?, ?, ?)";

     int i = 0;

     try {
         conn = DBConnector.getConnection();
         ps = conn.prepareStatement(sql);

         ps.setString(1, product.getName());
         ps.setString(2, product.getDescription());
         ps.setString(3, product.getPrice());
         ps.setString(4, product.getImagePath());

         i = ps.executeUpdate();

     } catch (SQLException e) {
         e.printStackTrace();

     } finally {
         DBConnector.closeStatement(ps);
         DBConnector.closeConnection(conn);
     }

     return i;
 }
 public ArrayList<Product> getProducts() throws SQLException
 {
 	String query = "select * from products";
 	Connection con = DBConnector.getConnection();
 	PreparedStatement statement = con.prepareStatement(query);
 	ResultSet rs = statement.executeQuery();
 	ArrayList<Product> productList = new ArrayList<Product>();
 	while (rs.next())
 	{
 		Product product = new Product();
 		product.setName(rs.getString("name"));
 		product.setDescription(rs.getString("description"));
 		product.setPrice(rs.getString("price"));
 		product.setId(rs.getInt("id"));
 		product.setImagePath(rs.getString("image"));

 		productList.add(product);
 	}
 	statement.close();
 	DBConnector.closeConnection(con);
 	return productList;
 }
 public Product getProductWithId(int id) throws SQLException
	{
		String query = "select * from products where ID='"+id+"'"; 
		Connection con = DBConnector.getConnection(); 
		PreparedStatement statement = con.prepareStatement(query); 
		ResultSet rs = statement.executeQuery();
		Product product=null;
		if (rs.next())
		{
		
			product = new Product(); 
			product.setName(rs.getString("name")); 
			product.setDescription(rs.getString("description")); 
			product.setPrice(rs.getString("price")); 
			product.setId(rs.getInt("id"));
		}
		statement.close();
		DBConnector.closeConnection(con); 
		return product;
		}
 }
