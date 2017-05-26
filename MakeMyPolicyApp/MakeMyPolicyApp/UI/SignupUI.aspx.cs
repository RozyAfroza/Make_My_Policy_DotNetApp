using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;

namespace MakeMyPolicyApp
{
	public partial class SignupUI : System.Web.UI.Page
	{
		SignupManager _signupManager = new SignupManager();
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void signupButton_Click(object sender, EventArgs e)
		{
			string userName = userNameInputBox.Value;
			string fullName = fullNameInputBox.Value;
			string password = passwordInputBox.Value;
			string retypePassword = retypePasswordInputBox.Value;
			string email = emailInputBox.Value;
			string dob = dobInputBox.Value;
			string nid = NIDInputBox.Value;
			string telephone = telInputBox.Value;
			string address = addressTextArea.Value;
			string postCode = postCodeInputBox.Value;

			if (password != retypePassword)
			{
				Response.Write("<script>alert('Password doesn't match')</script>");
				return;
			}

			User user = new User(userName, fullName, password, email, dob, nid, telephone, address, postCode);

			string message = _signupManager.SignupUser(user);

			Response.Write("<script>alert('" + message + "')</script>");

			userNameInputBox.Value = "";
			fullNameInputBox.Value = "";
			emailInputBox.Value = "";
			dobInputBox.Value = "";
			NIDInputBox.Value = "";
			telInputBox.Value = "";
			addressTextArea.Value = "";
			postCodeInputBox.Value = "";

			/*string yourHTMLstring = "<div class='modal fade' id='myModal' role='dialog'>" +
                                    "<div class='modal-dialog'>" +
                                    "<div class='modal-content'>" +
                                    "<div class='modal-header'>" +
                                    "<button type='button' class='close' data-dismiss='modal'>&times;</button>" +
                                    "<h4 class='modal-title'>Modal Header</h4>" +
                                    "</div>" +
                                    "<div class='modal-body'>" +
                                    "<p>Some text the modal.</p>" +
                                    "</div>" +
                                    "<div class='modal-footer'>" +
                                    "<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>";
            messageBox.Controls.Add(new LiteralControl(yourHTMLstring));*/
		}

		protected void signupButton_Click1(object sender, EventArgs e)
		{

		}
	}
}