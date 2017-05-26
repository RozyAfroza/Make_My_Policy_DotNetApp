using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;

namespace MakeMyPolicyApp.UI
{
	public partial class ChatWithUser : System.Web.UI.Page
	{
		ChatManager _chatManager = new ChatManager();
		ChatReplayManager _chatReplayManager = new ChatReplayManager();
		SignupManager _signupManager = new SignupManager();


		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["userId"] != null)
			{
				int userId = int.Parse(Request.QueryString["userId"]);
				User user = _signupManager.GetUserById(userId);
				ViewState["UserIdFromAdmin"] = userId;
				ViewState["FullName"] = user.FullName;
			}
		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string message = chatBoxTextArea.Value;
			string userType = Session["UserType"].ToString();
			int userId = int.Parse(ViewState["UserIdFromAdmin"].ToString());

			ChatModel chatModel = new ChatModel(message, userType, userId);
			ChatReplayStatus replayStatus = new ChatReplayStatus(userId, true);

			int rowsAffectedMessage = _chatManager.InsertChatMessage(chatModel);
			int rowsAffectedStatus = _chatReplayManager.UpdateChatReplayStatus(replayStatus);

			Response.Redirect("ChatWithUserUI.aspx?userId=" + userId);
		}
	}
}