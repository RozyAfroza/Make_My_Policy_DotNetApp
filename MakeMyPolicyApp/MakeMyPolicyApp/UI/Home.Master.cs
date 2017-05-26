using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;
using System.Linq;
using System.Net;

namespace MakeMyPolicyApp.UI
{
	public partial class Home : System.Web.UI.MasterPage
	{
		private SignupManager _signupManager = new SignupManager();

		protected void Page_Load(object sender, EventArgs e)
		{

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

		protected void LogoutButton_Click(object sender, EventArgs e)
		{
			Session["UserId"] = null;
			Session["UserName"] = null;
			Session["UserType"] = null;
			Session.Clear();
			Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);
			Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
			Response.Cookies["UserType"].Expires = DateTime.Now.AddDays(-1);

			Response.Redirect("HomeUI.aspx");
		}

		protected void AdminLoginButton_Click(object sender, EventArgs e)
		{
			string userNameOrEmail = userNameLoginInputBox.Value;
			string password = passwordLoginInputBox.Value;

			//User user = _signupManager.LoginUser(userNameOrEmail, password);
			string[] adminAccess = new[] { "monjurul", "789", "biplob_zaman", "123", "mahmud_pulap", "456", "khanom.sumaiya", "6969" };

			for (int i = 0; i < adminAccess.Length; i += 2)
			{
				if (userNameOrEmail == adminAccess[i] && password == adminAccess[i + 1])
				{
					char[] delimiterChars = { '_', '.' };
					string[] nameArray = adminAccess[i].Split(delimiterChars);
					string userName;

					if (nameArray.Length > 1)
					{
						userName = nameArray[0].First().ToString().ToUpper() + nameArray[0].Substring(1) + " " + nameArray[1];
					}
					else
					{
						userName = nameArray[0].First().ToString().ToUpper() + nameArray[0].Substring(1);
					}

					Session["UserId"] = 0;
					Session["UserName"] = userName;
					Session["UserType"] = "Admin";
					Response.Cookies["UserId"].Value = 0.ToString();
					Response.Cookies["UserName"].Value = userName;
					Response.Cookies["UserType"].Value = "Admin";
					Response.Cookies["UserId"].Expires = DateTime.Now.AddYears(1);
					Response.Cookies["UserName"].Expires = DateTime.Now.AddYears(1);
					Response.Cookies["UserType"].Expires = DateTime.Now.AddYears(1);
					/*var smtp = new System.Net.Mail.SmtpClient();
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
					}*/

					Response.Redirect("AgentMessageListUI.aspx");
					break;

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
}