using System;

namespace MakeMyPolicyApp.UI
{
	public partial class CustomerManagerAuthenticator : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			Response.Redirect("FindAgentMessageUI.aspx");
		}


	}
}