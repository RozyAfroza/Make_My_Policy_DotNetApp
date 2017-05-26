using MakeMyPolicyApp.BLL;
using MakeMyPolicyApp.ModelClass;
using System;

namespace MakeMyPolicyApp.UI
{
	public partial class CustomerCareMessageUI : System.Web.UI.Page
	{
		ChatManager _chatManager = new ChatManager();
		ChatReplayManager _chatReplayManager = new ChatReplayManager();

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string message = chatBoxTextArea.Value;
			string userType = Session["UserType"].ToString();
			int userId = int.Parse(Session["UserId"].ToString());

			ChatModel chatModel = new ChatModel(message, userType, userId);
			ChatReplayStatus replayStatus = new ChatReplayStatus(userId, false);

			int rowsAffectedMessage = _chatManager.InsertChatMessage(chatModel);
			int rowsAffectedStatus = _chatReplayManager.SetChatReplayStatus(replayStatus);

			Response.Redirect("FindAgentMessageUI.aspx");
		}
	}
}