using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;
using System.Net;

namespace MakeMyPolicyApp.UI
{
	public partial class HealthInsuarenceMedicalUI : System.Web.UI.Page
	{
		HealthInsuarenceManager _healthInsuarenceManager = new HealthInsuarenceManager();
		private SignupManager _signupManager = new SignupManager();
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string maritalStatus = maritalStatusRadioButton.SelectedValue;
			string age = AgeRadioButton.SelectedValue;
			int minAge = Convert.ToInt32(age.Substring(0, 2));
			int maxAge;
			Int32.TryParse(age.Substring(3, 2), out maxAge);
			string residentialSituation = residentialSituationRadioButton.SelectedValue;
			string incomeRange = incomeRangeRadioButton.SelectedValue;
			int minIncome = Convert.ToInt32(incomeRange.Substring(0, 5));
			int maxIncome;
			Int32.TryParse(incomeRange.Substring(6, 5), out maxIncome);
			int howManyTimeSurgery = 0;
			int totalExpencePerYear = 0;
			bool hasMedicalHistory = false;
			string previouslySurgery = surgeryRadioButton.SelectedValue;
			if (previouslySurgery == "Yes")
			{
				hasMedicalHistory = true;
				howManyTimeSurgery = Convert.ToInt32(howManyTimeSurgeryTextBox.Text);
				totalExpencePerYear = Convert.ToInt32(totalExpencePerYearTextBox.Text);
			}
			else
			{
				hasMedicalHistory = false;
			}
			string healthCareNeeded = healthCareNeededRadioButton.SelectedValue;
			string howManyDoctorYouWant = howManyDoctorYouWantRadioButton.SelectedValue;
			int minDoctor = Convert.ToInt32(howManyDoctorYouWant.Substring(0, 1));
			int maxDoctor;
			int.TryParse(howManyDoctorYouWant.Substring(2, 1), out maxDoctor);
			string singleHealthCare = singleHealthCareRadioButton.SelectedValue;
			string howManyHospitalNeeded = howManyHospitalNeededRadioButton.SelectedValue;
			int minHospital = Convert.ToInt32(howManyHospitalNeeded.Substring(0, 1));
			int maxHospital = Convert.ToInt32(howManyHospitalNeeded.Substring(2, 1));
			//int userId = ((User)Session["user"]).Id;

			//HealthInsurance healthInsurance = new HealthInsurance(maritalStatus, minAge, maxAge, residentialSituation, minIncome, maxIncome, hasMedicalHistory, howManyTimeSurgery, totalExpencePerYear, healthCareNeeded, minDoctor, maxDoctor, singleHealthCare, minHospital, maxHospital, userId);

			//HealthInsuarence healthInsuarence = new HealthInsuarence(maritalStatus, age, residentialSituation, incomeRange, hasMedicalHistory, howManyTimeSurgery, totalExpencePerYear, howManyDoctorYouWant, healthCareNeeded, singleHealthCare, howManyHospitalNeeded, userId);

			string message = null;
			//            message = _healthInsuarenceManager.InsertHealthInsuarence(healthInsuarence);

			int premiumPercentage = 0;

			switch (maritalStatus)
			{
				case "Single":
					premiumPercentage += 3;
					break;
				case "Other":
					premiumPercentage += 6;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (age)
			{
				case "20-28":
					premiumPercentage += 2;
					break;
				case "29-34":
					premiumPercentage += 4;
					break;
				case "35-42":
					premiumPercentage += 6;
					break;
				case "43-50":
					premiumPercentage += 8;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (residentialSituation)
			{
				case "Supported":
					premiumPercentage += 3;
					break;
				case "Rental":
					premiumPercentage += 6;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (incomeRange)
			{
				case "25000-35000":
					premiumPercentage += 2;
					break;
				case "36000-48000":
					premiumPercentage += 4;
					break;
				case "49000-60000":
					premiumPercentage += 6;
					break;
				case "62000-75000":
					premiumPercentage += 8;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (howManyTimeSurgery)
			{
				case 1:
					premiumPercentage += 5;
					break;
				case 2 - 10:
				case 3:
				case 4:
				case 5:
				case 6:
				case 7:
				case 8:
				case 9:
					premiumPercentage += 10;
					break;
			}

			if (totalExpencePerYear > 0 && totalExpencePerYear <= 360000)
			{
				premiumPercentage += 2;
			}
			else if (totalExpencePerYear > 360000 && totalExpencePerYear <= 540000)
			{
				premiumPercentage += 4;
			}
			else if (totalExpencePerYear > 540000 && totalExpencePerYear <= 720000)
			{
				premiumPercentage += 6;
			}
			else if (totalExpencePerYear > 720000 && totalExpencePerYear <= 960000)
			{
				premiumPercentage += 8;
			}
			else if (totalExpencePerYear > 960000)
			{
				premiumPercentage += 10;
			}

			switch (healthCareNeeded)
			{
				case "2 years or more":
					premiumPercentage += 2;
					break;
				case "10 years or more":
					premiumPercentage += 6;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (howManyDoctorYouWant)
			{
				case "2-4":
					premiumPercentage += 3;
					break;
				case "5-7":
					premiumPercentage += 6;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (singleHealthCare)
			{
				case "Single":
					premiumPercentage += 5;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (howManyHospitalNeeded)
			{
				case "2-4":
					premiumPercentage += 5;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			if (premiumPercentage > 0 && premiumPercentage <= 25)
			{
				message = "You are selected for Low Premium.";
			}
			else if (premiumPercentage > 25 && premiumPercentage <= 50)
			{
				message = "You are selected for Medium-Low Premium.";
			}
			else if (premiumPercentage > 50 && premiumPercentage <= 75)
			{
				message = "You are selected for Medium-High Premium.";
			}
			else
			{
				message = "You are selected for High-Premium.";
			}


			Session["PremiumType"] = message;
			Response.Redirect("PremiumTypeUI.aspx");

		}

		protected void Login_Button_Click(object sender, EventArgs e)
		{
			string userNameOrEmail = userNameLoginInputBox.Value;
			string password = passwordLoginInputBox.Value;

			User user = _signupManager.LoginUser(userNameOrEmail, password);

			if (user != null)
			{
				Session["UserId"] = user.Id;
				Session["UserName"] = user.FullName;
				Session["UserType"] = "Me";
				Response.Cookies["UserId"].Value = user.Id.ToString();
				Response.Cookies["UserName"].Value = user.FullName;
				Response.Cookies["UserType"].Value = "Me";
				Response.Cookies["UserId"].Expires = DateTime.Now.AddYears(1);
				Response.Cookies["UserName"].Expires = DateTime.Now.AddYears(1);
				Response.Cookies["UserType"].Expires = DateTime.Now.AddYears(1);
				var smtp = new System.Net.Mail.SmtpClient();
				{
					smtp.Host = "smtp.gmail.com";
					smtp.Port = 587;
					smtp.EnableSsl = true;
					smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
					smtp.Credentials = new NetworkCredential("makemypolicy472", "123monjur");
					smtp.Timeout = 20000;
				}
				// Passing values to smtp object
				try
				{
					smtp.Send("makemypolicy472@gmail.com", user.Email, "Subject", "Mail body");
				}
				catch (Exception exception)
				{
					//Console.WriteLine(exception);
					//throw;
				}

				Response.Redirect("HomeUI.aspx");


				//Response.Write("mail Send");
				//document.getElementById('login-validation-message').innerHTML = 'Wrong User Name or Password!';
			}
			else
			{
				Session["ErrorMessage"] = "Wrong User Name or Password!";
				//string myScriptValue = "function callMe() {alert('You pressed Me!'); }";
				//ScriptManager.RegisterStartupScript(this, Page.GetType(), "key", "javascript:MyFunction()", true);
				//Response.Write("<script>alert('userNameLoginInputBox');</script>");
			}
		}
	}
}