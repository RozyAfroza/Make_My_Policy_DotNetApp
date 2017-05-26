using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MakeMyPolicyApp.DAL
{
	public class ChatReplayGateway
	{
		private string connectionString = WebConfigurationManager.ConnectionStrings["MakeMyPolicyDBConnectionString"].ConnectionString;


		public int InsertChatReplayStatus(ChatReplayStatus chatReplayStatus)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "INSERT INTO ChatReplay(UserId, ReplayStatus) VALUES('" + chatReplayStatus.UserId + "','" + chatReplayStatus.ReplayStatus + "')";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			int rowAffected = command.ExecuteNonQuery();
			connection.Close();
			return rowAffected;
		}

		public List<ChatReplayStatus> GetAllChatReplayStatusList()
		{
			SqlConnection connection = new SqlConnection(connectionString);

			//string query = "SELECT * FROM ChatReplay";
			string query = "SELECT C.Id, C.ReplayStatus, C.UserId, U.FullName FROM ChatReplay C JOIN Users U ON C.UserId=U.Id";
			SqlCommand command = new SqlCommand(query, connection);
			List<ChatReplayStatus> chatReplayList = new List<ChatReplayStatus>();

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();

			while (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				int userId = int.Parse(reader["UserId"].ToString());
				bool replayStatus = bool.Parse(reader["ReplayStatus"].ToString());
				string fullName = reader["FullName"].ToString();
				ChatReplayStatus chatReplay = new ChatReplayStatus(id, userId, replayStatus, fullName);
				chatReplayList.Add(chatReplay);
			}
			connection.Close();
			return chatReplayList;
		}

		public List<ChatReplayStatus> GetUnReplayedStatusList()
		{
			SqlConnection connection = new SqlConnection(connectionString);

			//string query = "SELECT * FROM ChatReplay WHERE ReplayStatus=" + false;
			string query = "SELECT C.Id, C.ReplayStatus, C.UserId, U.FullName FROM ChatReplay C JOIN Users U ON C.UserId=U.Id WHERE C.ReplayStatus='" + false + "'";
			SqlCommand command = new SqlCommand(query, connection);
			List<ChatReplayStatus> chatReplayList = new List<ChatReplayStatus>();

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();

			while (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				int userId = int.Parse(reader["UserId"].ToString());
				bool replayStatus = bool.Parse(reader["ReplayStatus"].ToString());
				string fullName = reader["FullName"].ToString();
				ChatReplayStatus chatReplay = new ChatReplayStatus(id, userId, replayStatus, fullName);
				chatReplayList.Add(chatReplay);
			}
			connection.Close();
			return chatReplayList;
		}

		public ChatReplayStatus GetChatReplayStatus(int userId)
		{
			SqlConnection connection = new SqlConnection(connectionString);

			//string query = "SELECT * FROM ChatReplay WHERE UserId='" + userId + "'";
			string query = "SELECT C.Id, C.ReplayStatus, C.UserId, U.FullName FROM ChatReplay C JOIN Users U ON C.UserId=U.Id WHERE U.Id=" + userId;

			SqlCommand command = new SqlCommand(query, connection);

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();
			ChatReplayStatus chatReplay = null;
			if (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				int userIdDb = int.Parse(reader["UserId"].ToString());
				bool replayStatus = bool.Parse(reader["ReplayStatus"].ToString());
				string fullName = reader["FullName"].ToString();
				chatReplay = new ChatReplayStatus(id, userIdDb, replayStatus, fullName);
			}

			connection.Close();
			return chatReplay;
		}

		public int UpdateChatReplayStatus(ChatReplayStatus chatReplayStatus)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "UPDATE ChatReplay SET ReplayStatus='" + chatReplayStatus.ReplayStatus + "' WHERE UserId=" + chatReplayStatus.UserId;
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			int rowAffected = command.ExecuteNonQuery();
			connection.Close();
			return rowAffected;
		}
	}
}