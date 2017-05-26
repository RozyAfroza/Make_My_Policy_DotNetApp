using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;
using System.Net;

namespace MakeMyPolicyApp.UI
{
	public partial class AssetsInsuarenceUI : System.Web.UI.Page
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
			string insuranceTime = insuranceTimeRadioButton.SelectedValue;
			string assetType = assetTypeRadioButton.SelectedValue;
			string tangibleGoodWillValue = tangibleGoodwillValueRadioButton.SelectedValue;
			string tangibleType = tangibleTypeRadioButton.SelectedValue;
			string nonTangibleType = nonTangibleTypeRadioButton.SelectedValue;
			string intellectualValue = intellectualValueRadioButton.SelectedValue;
			string educationValue = educationValueRadioButton.SelectedValue;
			string copyrightValue = copyrightValueRadioButton.SelectedValue;
			string businessValue = businessValueRadioButton.SelectedValue;

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

			switch (insuranceTime)
			{
				case "Life":
					premiumPercentage += 10;
					break;
				case "Other":
					premiumPercentage += 5;
					break;
			}

			switch (assetType)
			{
				case "Tangible":
					premiumPercentage += 5;
					break;
				case "Non-tangible":
					premiumPercentage += 10;
					break;
			}

			if (assetType == "Tangible")
			{
				switch (tangibleGoodWillValue)
				{
					case "50lac-70lac":
						premiumPercentage += 2;
						break;
					case "80lac-1cr":
						premiumPercentage += 4;
						break;
					case "1cr-5cr":
						premiumPercentage += 6;
						break;
					case "5cr-10cr":
						premiumPercentage += 10;
						break;
				}

				switch (tangibleType)
				{
					case "Rented":
						premiumPercentage += 5;
						break;
					case "Owned":
						premiumPercentage += 10;
						break;
				}
			}
			else
			{
				switch (nonTangibleType)
				{
					case "Intellectual":
						premiumPercentage += 2;
						break;
					case "Education":
						premiumPercentage += 5;
						break;
					case "Copyright":
						premiumPercentage += 7;
						break;
					case "Business":
						premiumPercentage += 10;
						break;
				}

				if (nonTangibleType == "Intellectual")
				{
					switch (intellectualValue)
					{
						case "10lac":
							premiumPercentage += 2;
							break;
						case "10-30lac":
							premiumPercentage += 6;
							break;
						default:
							premiumPercentage += 10;
							break;
					}
				}
				else if (nonTangibleType == "Education")
				{
					switch (educationValue)
					{
						case "15lac":
							premiumPercentage += 2;
							break;
						case "15-40lac":
							premiumPercentage += 6;
							break;
						default:
							premiumPercentage += 10;
							break;
					}
				}
				else if (nonTangibleType == "Copyright")
				{
					switch (copyrightValue)
					{
						case "20lac":
							premiumPercentage += 2;
							break;
						case "20-50lac":
							premiumPercentage += 6;
							break;
						default:
							premiumPercentage += 10;
							break;
					}
				}
				else
				{
					switch (businessValue)
					{
						case "30lac":
							premiumPercentage += 2;
							break;
						case "30-60lac":
							premiumPercentage += 6;
							break;
						default:
							premiumPercentage += 10;
							break;
					}
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