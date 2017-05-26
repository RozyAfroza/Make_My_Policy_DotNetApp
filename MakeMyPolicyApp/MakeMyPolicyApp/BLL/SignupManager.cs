using MakeMyPolicyApp.DAL;
using MakeMyPolicyApp.ModelClass;
using System;
using System.Collections.Generic;

namespace MakeMyPolicyApp.BLL
{
	public class SignupManager
	{
		SignupGateway _signupGateway = new SignupGateway();
		public string SignupUser(User user)
		{
			try
			{
				IsUserExists(user);
			}
			catch (Exception exception)
			{
				return exception.Message;
			}
			var rowAffected = _signupGateway.InsertUser(user);

			if (rowAffected > 0)
			{
				return "Saved Successfully!";
			}
			return "Insertion Failed!";
		}

		private bool IsUserExists(User user)
		{
			var emailExist = _signupGateway.GetUserByEmail(user.Email);
			var nidExist = _signupGateway.GetUserByNid(user.Nid);

			if (emailExist == null && nidExist == null)
			{
				return true;
			}
			else
			{
				if (emailExist != null)
				{
					throw new Exception("Email Already Exist. Please enter a valid email address.");
				}
				else
				{
					throw new Exception("NID Already Exist. Please enter a valid NID Number");
				}
			}
		}

		public List<User> GetAllUsers()
		{
			return _signupGateway.GetAllUsers();
		}

		public User LoginUser(string userNameOrEmail, string password)
		{
			return _signupGateway.LoginUser(userNameOrEmail, password);
		}

		public User GetUserById(int userId)
		{
			return _signupGateway.GetUserById(userId);
		}
	}
}