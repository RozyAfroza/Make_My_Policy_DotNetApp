namespace MakeMyPolicyApp.ModelClass
{
	public class FaqCommentModel
	{
		public int Id { get; set; }
		public string Title { get; set; }
		public string Comment { get; set; }

		public FaqCommentModel(string title, string comment)
		{
			Title = title;
			Comment = comment;
		}

		public FaqCommentModel(int id, string title, string comment)
			: this(title, comment)
		{
			Id = id;
		}
	}
}