using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;
using System.Net;

namespace MakeMyPolicyApp.UI
{
	public partial class HomeInsuarenceUI : System.Web.UI.Page
	{
		private SignupManager _signupManager = new SignupManager();
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string maritalStatus = maritalStatusRadioButton.SelectedValue;
			string age = AgeRadioButton.SelectedValue;
			string residentialSituation = residentialSituationRadioButton.SelectedValue;
			string incomeRange = incomeRangeRadioButton.SelectedValue;
			string homeType = homeTypeRadioButton.SelectedValue;
			string apartmentNo = apartmentNoRadioButton.SelectedValue;
			string storyNo = storyNoRadioButton.SelectedValue;
			string hasIssue = hasIssueRadioButton.SelectedValue;
			string issueType = issueTypeRadioButton.SelectedValue;

			//int userId = ((User)Session["user"]).Id;

			string message;

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

			switch (homeType)
			{
				case "Apartment":
					premiumPercentage += 2;
					break;
				case "Banglow":
					premiumPercentage += 4;
					break;
				case "Multi-storied Building":
					premiumPercentage += 6;
					break;
				case "Other":
					premiumPercentage += 10;
					break;
			}

			if (homeType == "Apartment")
			{
				switch (apartmentNo)
				{
					case "1":
						premiumPercentage += 1;
						break;
					case "2":
						premiumPercentage += 2;
						break;
					default:
						premiumPercentage += 3;
						break;
				}
			}

			switch (storyNo)
			{
				case "1":
					premiumPercentage += 2;
					break;
				case "2-4":
					premiumPercentage += 4;
					break;
				case "4-8":
					premiumPercentage += 6;
					break;
				case "8-16":
					premiumPercentage += 8;
					break;
				default:
					premiumPercentage += 10;
					break;
			}

			switch (hasIssue)
			{
				case "Yes":
					premiumPercentage += 10;
					break;
				case "No":
					premiumPercentage += 2;
					break;
			}

			if (hasIssue == "Yes")
			{
				switch (issueType)
				{
					case "Law":
						premiumPercentage += 5;
						break;
					default:
						premiumPercentage += 10;
						break;
				}
			}



			if (premiumPercentage > 0 && premiumPercentage <= 25)
			{
				message = "You are selected for Low Premium.";
			}
			else if (premiumPercentage > 25 && premiumPercentage <= 45)
			{
				message = "You are selected for Medium-Low Premium.";
			}
			else if (premiumPercentage > 45 && premiumPercentage <= 70)
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