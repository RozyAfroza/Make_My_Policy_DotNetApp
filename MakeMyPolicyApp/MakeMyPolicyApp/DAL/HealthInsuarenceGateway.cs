using MakeMyPolicyApp.ModelClass;
using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MakeMyPolicyApp.DAL
{
	public class HealthInsuarenceGateway
	{
		private string connectionString = WebConfigurationManager.ConnectionStrings["MakeMyPolicyDBConnectionString"].ConnectionString;

		public int InsertHealthInsuarence(HealthInsuarence hI)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "INSERT INTO HealthInsuarence (maritalStatus,age,residentialSituation,incomeRange,hasMedicalHistory,howManyTimeSurgery,totalExpencePerYear,healthCareNeeded,howManyDoctorYouWant,singleHealthCare,howManyHospitalNeeded,userId) VALUES('" + hI.MaritalStatus + "','" + hI.MaxAge + "','" +
				hI.ResidentialSituation + "','" + hI.MaxIncome + "','" +
				hI.HasMedicalHistory + "','" + hI.HowManyTimeSurgery + "','" +
				hI.TotalExpencePerYear + hI.HealthCareNeeded + "','" +
				hI.MaxDoctor + "','" + hI.SingleHealthCare + "','" +
				hI.MaxHospital + "','" + hI.UserId + "')";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			int rowAffected = command.ExecuteNonQuery();
			connection.Close();
			return rowAffected;
		}

		public HealthInsuarence GetHealthInsuarenceByUserId(int userId)
		{
			SqlConnection connection = new SqlConnection(connectionString);
			string query = "SELECT * FROM HealthInsuarence WHERE userId='" + userId + "'";
			SqlCommand command = new SqlCommand(query, connection);
			connection.Open();
			SqlDataReader reader = command.ExecuteReader();
			HealthInsuarence healthInsuarence = null;

			if (reader.Read())
			{
				int id = Convert.ToInt32(reader["Id"].ToString());
				string maritalStatus = reader["maritalStatus"].ToString();
				string age = reader["age"].ToString();
				string residentialSituation = reader["residentialSituation"].ToString();
				string incomeRange = reader["incomeRange"].ToString();
				bool hasMedicalHistory = Convert.ToBoolean(reader["hasMedicalHistory"].ToString());
				int howManyTimeSurgery = Convert.ToInt32(reader["howManyTimeSurgery"].ToString());
				int totalExpencePerYear = Convert.ToInt32(reader["totalExpencePerYear"].ToString());
				string howManyDoctorYouWant = reader["howManyDoctorYouWant"].ToString();
				string healthCareNeeded = reader["healthCareNeeded"].ToString();
				string singleHealthCare = reader["singleHealthCare"].ToString();
				string howManyHospitalNeeded = reader["howManyHospitalNeeded"].ToString();
				userId = Convert.ToInt32(reader["userId"].ToString());

				//healthInsuarence = new HealthInsuarence(id, maritalStatus, age, residentialSituation, incomeRange, hasMedicalHistory, howManyTimeSurgery, totalExpencePerYear, howManyDoctorYouWant, healthCareNeeded, singleHealthCare, howManyHospitalNeeded, userId);
			}
			return healthInsuarence;
		}
	}
}