using MakeMyPolicyApp.DAL;
using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;

namespace MakeMyPolicyApp.BLL
{
	public class ChatManager
	{
		ChatGateway _chatGateway = new ChatGateway();
		public int InsertChatMessage(ChatModel chatModel)
		{
			return _chatGateway.InsertChatMessage(chatModel);
		}

		public List<ChatModel> GetChatMessage()
		{
			return _chatGateway.GetAllChatMessage();
		}

		public List<ChatModel> GetIndividualChatMessageList(int userId)
		{
			return _chatGateway.GetIndividualChatMessageList(userId);
		}
	}


}