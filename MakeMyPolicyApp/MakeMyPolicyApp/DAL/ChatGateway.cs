using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MakeMyPolicyApp.DAL
{
	public class ChatGateway
	{
		private string connectionString = WebConfigurationManager.ConnectionStrings["MakeMyPolicyDBConnectionString"].ConnectionString;


		public int InsertChatMessage(ChatModel chatModel)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "INSERT INTO Chat(Message, UserType, UserId) VALUES('" + chatModel.Message + "','" + chatModel.UserType + "','" + chatModel.UserId + "')";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			int rowAffected = command.ExecuteNonQuery();
			connection.Close();
			return rowAffected;
		}

		public List<ChatModel> GetAllChatMessage()
		{
			SqlConnection connection = new SqlConnection(connectionString);

			string query = "SELECT * FROM Chat";
			SqlCommand command = new SqlCommand(query, connection);
			List<ChatModel> chatModelList = new List<ChatModel>();

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();

			while (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string message = reader["Message"].ToString();
				string userType = reader["UserType"].ToString();
				int userId = int.Parse(reader["UserId"].ToString());

				ChatModel chatModel = new ChatModel(id, message, userType, userId);
				chatModelList.Add(chatModel);
			}
			connection.Close();
			return chatModelList;
		}

		public List<ChatModel> GetIndividualChatMessageList(int userId)
		{
			SqlConnection connection = new SqlConnection(connectionString);

			string query = "SELECT * FROM Chat WHERE UserId=" + userId;
			SqlCommand command = new SqlCommand(query, connection);
			List<ChatModel> chatModelList = new List<ChatModel>();

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();

			while (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string message = reader["Message"].ToString();
				string userType = reader["UserType"].ToString();
				int userIdDb = int.Parse(reader["UserId"].ToString());

				ChatModel chatModel = new ChatModel(id, message, userType, userIdDb);
				chatModelList.Add(chatModel);
			}
			connection.Close();
			return chatModelList;
		}
	}
}