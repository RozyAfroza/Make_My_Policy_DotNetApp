using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;

namespace MakeMyPolicyApp.UI
{
	public partial class CustomerCareUI : System.Web.UI.Page
	{
		FaqManager _faqManager = new FaqManager();
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string jqueryString = @"<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.js'>$.alert({title: 'Alert!',content: 'Please answer all the question and then submit.'});</script>";

			this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Jquery", jqueryString, false);

			string faqCommentTitle = commentTitleInputBox.Value;
			string faqComment = commentTextArea.Value;
			FaqCommentModel faqCommentModel = new FaqCommentModel(faqCommentTitle, faqComment);
			int rowsAffected = _faqManager.InsertFaqComment(faqCommentModel);
			System.Threading.Thread.Sleep(4000);
			Response.Redirect("FAQ.aspx");
		}
	}
}