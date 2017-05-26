using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MakeMyPolicyApp.DAL
{
	public class SignupGateway
	{
		private string connectionString = WebConfigurationManager.ConnectionStrings["MakeMyPolicyDBConnectionString"].ConnectionString;

		public int InsertUser(User user)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "INSERT INTO Users(UserName,FullName,Password,Email,Dob,Nid,Telephone,Address,PostCode) VALUES('" + user.UserName + "','" + user.FullName + "','" + user.Password + "','" + user.Email + "','" + user.DateOfBirth + "','" + user.Nid + "','" + user.TelephoneNo + "','" + user.Address + "','" + user.PostCode + "')";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			int rowAffected = command.ExecuteNonQuery();
			connection.Close();
			return rowAffected;

		}
		public User GetUserByNid(string nid)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "SELECT * FROM Users WHERE Nid='" + nid + "'";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			SqlDataReader reader = command.ExecuteReader();
			User user = null;

			if (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string userName = reader["UserName"].ToString();
				string fullName = reader["FullName"].ToString();
				string password = reader["Password"].ToString();
				string email = reader["Email"].ToString();
				string dob = reader["Dob"].ToString();
				string Nid = reader["Nid"].ToString();
				string telephone = reader["Telephone"].ToString();
				string address = reader["Address"].ToString();
				string postCode = reader["PostCode"].ToString();

				user = new User(id, userName, fullName, password, email, dob, Nid, telephone, address, postCode);
			}
			return user;
		}
		public List<User> GetAllUsers()
		{
			SqlConnection connection = new SqlConnection(connectionString);

			string query = "SELECT * FROM Users";

			SqlCommand command = new SqlCommand(query, connection);

			List<User> userList = new List<User>();


			connection.Open();
			SqlDataReader reader = command.ExecuteReader();

			while (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string userName = reader["UserName"].ToString();
				string fullName = reader["FullName"].ToString();
				string password = reader["Password"].ToString();
				string email = reader["Email"].ToString();
				string dob = reader["Dob"].ToString();
				string Nid = reader["Nid"].ToString();
				string telephone = reader["Telephone"].ToString();
				string address = reader["Address"].ToString();
				string postCode = reader["PostCode"].ToString();

				User user = new User(id, userName, fullName, password, email, dob, Nid, telephone, address, postCode);

				userList.Add(user);
			}
			connection.Close();
			return userList;
		}

		public User LoginUser(string userNameOrEmail, string password)
		{
			SqlConnection connection = new SqlConnection(connectionString);

			string query = "SELECT * FROM Users WHERE (UserName='" + userNameOrEmail + "' OR Email='" + userNameOrEmail + "') AND Password = '" + password + "'";

			SqlCommand command = new SqlCommand(query, connection);

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();
			User user = null;
			if (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string userName = reader["UserName"].ToString();
				string fullName = reader["FullName"].ToString();
				string aPassword = reader["Password"].ToString();
				string email = reader["Email"].ToString();
				string dob = reader["Dob"].ToString();
				string Nid = reader["Nid"].ToString();
				string telephone = reader["Telephone"].ToString();
				string address = reader["Address"].ToString();
				string postCode = reader["PostCode"].ToString();

				user = new User(id, userName, fullName, aPassword, email, dob, Nid, telephone, address, postCode);

			}
			connection.Close();

			return user;
		}

		public User GetUserByEmail(string email)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "SELECT * FROM Users WHERE Email='" + email + "'";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			SqlDataReader reader = command.ExecuteReader();
			User user = null;

			if (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string userName = reader["UserName"].ToString();
				string fullName = reader["FullName"].ToString();
				string password = reader["Password"].ToString();
				string anEmail = reader["Email"].ToString();
				string dob = reader["Dob"].ToString();
				string Nid = reader["Nid"].ToString();
				string telephone = reader["Telephone"].ToString();
				string address = reader["Address"].ToString();
				string postCode = reader["PostCode"].ToString();

				user = new User(id, userName, fullName, password, anEmail, dob, Nid, telephone, address, postCode);
			}
			return user;
		}

		public User GetUserById(int userId)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "SELECT * FROM Users WHERE Id='" + userId + "'";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			SqlDataReader reader = command.ExecuteReader();
			User user = null;

			if (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string userName = reader["UserName"].ToString();
				string fullName = reader["FullName"].ToString();
				string password = reader["Password"].ToString();
				string anEmail = reader["Email"].ToString();
				string dob = reader["Dob"].ToString();
				string Nid = reader["Nid"].ToString();
				string telephone = reader["Telephone"].ToString();
				string address = reader["Address"].ToString();
				string postCode = reader["PostCode"].ToString();

				user = new User(id, userName, fullName, password, anEmail, dob, Nid, telephone, address, postCode);
			}
			return user;
		}
	}
}