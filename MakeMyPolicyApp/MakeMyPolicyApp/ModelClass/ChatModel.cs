namespace MakeMyPolicyApp.ModelClass
{
	public class ChatModel
	{
		public int Id { get; set; }
		public string Message { get; set; }
		public string UserType { get; set; }
		public int UserId { get; set; }

		public ChatModel(string message, string userType, int userId)
		{
			Message = message;
			UserType = userType;
			UserId = userId;
		}

		public ChatModel(int id, string message, string userType, int userId)
			: this(message, userType, userId)
		{
			Id = id;
		}
	}
}