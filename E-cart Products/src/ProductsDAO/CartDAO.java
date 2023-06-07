package ProductsDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartDAO {
	private static final String JDBC_DRIVER = "org.postgresql.Driver";
	private static final String DB_URL = "jdbc:postgresql://192.168.110.48:5432/plf_training";
	private static final String USERNAME = "plf_training_admin";
	private static final String PASSWORD = "pff123";

	public void addProduct(int productId, int customerId) throws SQLException {
		// Establish a database connection
		Connection connection = null;
		PreparedStatement statement = null;

		try {
			// Create the SQL query
			String query = "INSERT INTO slam_cart (c_id, p_id) VALUES (?, ?)";

			// Open a connection
			connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

			// Create a prepared statement
			statement = connection.prepareStatement(query);

			// Set the parameter values
			statement.setInt(1, customerId);
			statement.setInt(2, productId);

			// Execute the query
			statement.executeUpdate();
		} finally {
			// Close the statement and connection
			if (statement != null) {
				statement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}
}
