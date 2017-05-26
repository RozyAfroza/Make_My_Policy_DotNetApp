using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MakeMyPolicyApp.DAL
{
	public class FaqGateway
	{
		private string connectionString = WebConfigurationManager.ConnectionStrings["MakeMyPolicyDBConnectionString"].ConnectionString;

		public int InsertFaqComment(FaqCommentModel faqCommentModel)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "INSERT INTO FAQ(Title, Comment) VALUES('" + faqCommentModel.Title + "','" + faqCommentModel.Comment + "')";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			int rowAffected = command.ExecuteNonQuery();
			connection.Close();
			return rowAffected;
		}

		public List<FaqCommentModel> GetFaqComment()
		{
			SqlConnection connection = new SqlConnection(connectionString);

			string query = "SELECT * FROM FAQ ORDER BY Id DESC";
			SqlCommand command = new SqlCommand(query, connection);
			List<FaqCommentModel> faqCommentList = new List<FaqCommentModel>();

			connection.Open();
			SqlDataReader reader = command.ExecuteReader();

			while (reader.Read())
			{
				int id = int.Parse(reader["Id"].ToString());
				string faqCommentTitle = reader["Title"].ToString();
				string faqComment = reader["Comment"].ToString();
				FaqCommentModel faqCommentModel = new FaqCommentModel(id, faqCommentTitle, faqComment);
				faqCommentList.Add(faqCommentModel);
			}
			connection.Close();
			return faqCommentList;
		}
	}
}