<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="FindAgentUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.FindAgentUI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "FindAgentUI"; %>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div class="container big-card">
        
		<% if (Session["UserId"] == null || Session["UserId"].ToString() == "undefined")
		   { %>
					<div class="row align-content-center">
						<h2 class="col-12 text-center" style="color: green">Please login first to continue.</h2>
					</div>
					<br/>
					<div class="col-12">
						
						<div class="form-group row">
							<div class="offset-1 col-sm-4">
								<label class="control-label" for="userNameLoginInputBox" runat="server">Username or Email</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control" name="User Name" type="text" id="userNameLoginInputBox" runat="server" placeholder="Type User Name or Email" />
								<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group row">
							<div class="offset-1 col-sm-4">
								<label class="control-label " for="passwordLoginInputBox" runat="server">Password</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control" name="Password" type="password" id="passwordLoginInputBox" runat="server" placeholder="Type Password" />
								<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group row">
							<div class="offset-5 col-7">
								<asp:Button CssClass="btn btn-primary paddingButton col-5" ID="LoginButton" runat="server" Text="Login" UseSubmitBehavior="True" OnClick="Login_Button_Click" />
							</div>
						</div>
						<br/>
						<div class="row justify-content-center">
							<h6 class="text-center alert-danger" style="background: none; width: 100%; margin: auto;">Don't have an account?<br />Create one.
							</h6>
							<br/>
							<br/>
							<a id="signup"  href="SignupUI.aspx">
								<h5 class="">Click Here to Signup</h5>
							</a>
						</div>
				
					</div>
		
				<% }
		   else
		   {
				%>
		<div class="row justify-content-center">
			<div class="col-11 outset-border m-2">
				<p>
					<span>1) Syed Monjurul Islam</span> <br/>
					<span class="ml-3">Director of delta life insurance company ltd.</span> <br/>
					<span class="ml-3" style="color: royalblue">syed.monjur36@gmail.com</span>
				</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-11 outset-border m-2">
				<p>
					<span>2) M.A zaman Biplob</span> <br/>
					<span class="ml-3">Assistant director of Metlife Alico.</span><br/>
					<span class="ml-3" style="color: royalblue">biplob_zaman@gmail.com</span>
				</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-11 outset-border m-2">
				<p>
					<span>3) Mahamuduzzaman Pulak</span> <br/>
					<span class="ml-3">Director of Popular life insurance ltd.</span><br/>
					<span class="ml-3" style="color: royalblue">md_mahmud_pulap42@yahoo.com</span>
				</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-11 outset-border m-2">
				<p>
					<span>4) Sumaiya Khanom</span> <br/>
					<span class="ml-3">Director of  Eastland Insurance Company Ltd.</span><br/>
					<span class="ml-3" style="color: royalblue">khanom.sumaiya.69@live.com</span>
				</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-11 outset-border  m-2">
				<p>
					<span>5) Syed Abdullah</span> <br/>
					<span class="ml-3">Managing director of Standard Insurance Ltd.</span><br/>
					<span class="ml-3" style="color: royalblue">abdullah_maaz6006@gmail.com</span>

				</p>
			</div>
		</div>
		
		<br/>
		
		<div class="row justify-content-center">
			<div class="col-10 outset-border m-2">
				<p class="text-center">Contact them directly. <a href="FindAgentManagerAuthenticator.aspx">click here</a></p>
			</div>
			
		</div>
		<% } %>
    </div>

</asp:Content>
