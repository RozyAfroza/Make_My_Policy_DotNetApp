using MakeMyPolicyApp.DAL;
using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;

namespace MakeMyPolicyApp.BLL
{
	public class ChatReplayManager
	{
		ChatReplayGateway _chatReplayGateway = new ChatReplayGateway();
		public int InsertChatReplayStatus(ChatReplayStatus chatReplayStatus)
		{
			return _chatReplayGateway.InsertChatReplayStatus(chatReplayStatus);
		}

		public List<ChatReplayStatus> GetAllChatReplayStatusList()
		{
			return _chatReplayGateway.GetAllChatReplayStatusList();
		}

		public List<ChatReplayStatus> GetUnReplayedStatusList()
		{
			return _chatReplayGateway.GetUnReplayedStatusList();
		}

		public int SetChatReplayStatus(ChatReplayStatus chatReplayStatus)
		{
			ChatReplayStatus getReplayStatus = _chatReplayGateway.GetChatReplayStatus(chatReplayStatus.UserId);
			if (getReplayStatus == null)
			{
				return InsertChatReplayStatus(chatReplayStatus);
			}
			else
			{
				return UpdateChatReplayStatus(chatReplayStatus);
			}
		}

		public int UpdateChatReplayStatus(ChatReplayStatus chatReplayStatus)
		{
			return _chatReplayGateway.UpdateChatReplayStatus(chatReplayStatus);
		}
	}
}