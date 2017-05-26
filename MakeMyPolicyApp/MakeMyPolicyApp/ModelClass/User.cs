namespace MakeMyPolicyApp.ModelClass
{
	public class User
	{
		public int Id { get; set; }
		public string UserName { get; set; }
		public string FullName { get; set; }
		public string Password { get; set; }
		public string Email { get; set; }
		public string DateOfBirth { get; set; }
		public string Nid { get; set; }
		public string TelephoneNo { get; set; }
		public string Address { get; set; }
		public string PostCode { get; set; }

		public User(int id, string userName, string fullName, string password, string email, string dateOfBirth, string nid, string telephoneNo, string address, string postCode)
			: this(userName, fullName, password, email, dateOfBirth, nid, telephoneNo, address, postCode)
		{
			Id = id;
		}

		public User(string userName, string fullName, string password, string email, string dateOfBirth, string nid, string telephoneNo, string address, string postCode)
		{
			UserName = userName;
			FullName = fullName;
			Password = password;
			Email = email;
			DateOfBirth = dateOfBirth;
			Nid = nid;
			TelephoneNo = telephoneNo;
			Address = address;
			PostCode = postCode;
		}
	}
}