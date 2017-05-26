<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="BusinessInsuranceUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.BusinessInsurance" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "BusinessInsuranceUI"; %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
	
	<div class="container big-card">
		<div style="height: auto">
			<div class="form-horizontal">
				<% if (Session["UserId"] == null || Session["UserId"].ToString()=="undefined")
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
				<div class="col-12 questions">
					<h1 class="outset-border"><u>Business Insurance:</u></h1>
					<br />
					
					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label1" runat="server" Text="1. Marital Status :"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="maritalStatusRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>Single</asp:ListItem>
									<asp:ListItem>Married</asp:ListItem>
									<asp:ListItem>Other</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label3" runat="server" Text="2. Residential Situation : "></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="residentialSituationRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>Apartment</asp:ListItem>
									<asp:ListItem>Rental</asp:ListItem>
									<asp:ListItem>Supported</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label2" runat="server" Text="3. Age :"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="AgeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>20-28</asp:ListItem>
									<asp:ListItem>29-34</asp:ListItem>
									<asp:ListItem>35-42</asp:ListItem>
									<asp:ListItem>43-50</asp:ListItem>
									<asp:ListItem>50-Above</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label4" runat="server" Text="4. Income Range : "></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="incomeRangeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>25000-35000</asp:ListItem>
									<asp:ListItem>36000-48000</asp:ListItem>
									<asp:ListItem>49000-60000</asp:ListItem>
									<asp:ListItem>62000-75000</asp:ListItem>
									<asp:ListItem>75000 Above</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
					</div>
					<br />

					<h3 class="outset-border">
						<asp:Label CssClass="control-label" ID="Label5" runat="server" Text="Business History : "></asp:Label></h3>
					<br />

					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label9" runat="server" Text="5. What type of business financing are you interested ?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="financeTypeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>Business loan</asp:ListItem>
									<asp:ListItem>Equipment lease</asp:ListItem>
									<asp:ListItem>Loan for equipment purchase</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label10" runat="server" Text="6. Approximately how much money are you seeking?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="loanAmountRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>1500-10000</asp:ListItem>
									<asp:ListItem>110000-150000</asp:ListItem>
									<asp:ListItem>151000-200000</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label6" runat="server" Text="7. What are your approximate total business over the past 12 months?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="businessAmountRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>0 revenue (start-up)</asp:ListItem>
									<asp:ListItem>3000-4000</asp:ListItem>
									<asp:ListItem>4100-5000</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label11" runat="server" Text="8. How long has your business been in operator ?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="businessDurationRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>0-6 month(start-up)</asp:ListItem>
									<asp:ListItem>4-5 month</asp:ListItem>
									<asp:ListItem>6-2 year's</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-7">
							<asp:Label CssClass="control-label" ID="Label12" runat="server" Text="9. For what type of business are you seeking a loan?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="businessTypeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>A business that I am about to start</asp:ListItem>
									<asp:ListItem>A business that I currently own</asp:ListItem>
									<asp:ListItem>A business that I would like to acquire</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-5">
							<asp:Label CssClass="control-label" ID="Label13" runat="server" Text="10. Monthly premium rate?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="premiumRateRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem>5%-10%</asp:ListItem>
									<asp:ListItem>10%-15%</asp:ListItem>
									<asp:ListItem>15%-20%</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
					</div>
					<br/>
					<div class="row justify-content-center">
						<div class="col-6 outset-border">
							<asp:Button ID="submitButton" CssClass="btn btn-primary offset-3 col-6" runat="server" Text="Submit" OnClientClick="javascript:return radioButtonValidation();" OnClick="submitButton_Click" />
						</div>
					</div>
				</div>
				<% }

				%>
			</div>
		</div>
	</div>
</asp:Content>
