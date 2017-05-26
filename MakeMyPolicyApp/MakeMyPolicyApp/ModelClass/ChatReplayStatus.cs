
namespace MakeMyPolicyApp.ModelClass
{
	public class ChatReplayStatus
	{
		public int Id { get; set; }
		public int UserId { get; set; }
		public bool ReplayStatus { get; set; }
		public string FullName { get; set; }

		public ChatReplayStatus(int userId, bool replayStatus)
		{
			UserId = userId;
			ReplayStatus = replayStatus;
		}

		public ChatReplayStatus(int userId, bool replayStatus, string fullName) : this(userId, replayStatus)
		{
			FullName = fullName;
		}

		public ChatReplayStatus(int id, int userId, bool replayStatus, string fullName)
			: this(userId, replayStatus, fullName)
		{
			Id = id;
		}
	}
}