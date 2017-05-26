using MakeMyPolicyApp.DAL;
using MakeMyPolicyApp.ModelClass;
using System.Collections.Generic;

namespace MakeMyPolicyApp.BLL
{
	public class FaqManager
	{
		FaqGateway _faqGateway = new FaqGateway();
		public int InsertFaqComment(FaqCommentModel faqCommentModel)
		{
			return _faqGateway.InsertFaqComment(faqCommentModel);
		}

		public List<FaqCommentModel> GetFaqComment()
		{
			return _faqGateway.GetFaqComment();
		}
	}
}