﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Home.Master" CodeBehind="HomeInsuranceUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.HomeInsuarenceUI" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "HomeInsuranceUI"; %>

	<script>
		$(document).ready(function () {
			$('#homeType').hide();
			$('#issueType').hide();
			
			$('input,ins,label').click(function () {
	
				if ($('.home:first').children(':first-child').children(':first-child').val() === "Apartment" && $('.home:first').children(':first-child').hasClass('checked')) {
					$('#homeType').show();
					$('#<%=apartmentNoRadioButton.ClientID %>').addClass('jqValidate');
				} else {
					$('#homeType').hide();
					$('#<%=apartmentNoRadioButton.ClientID %>').removeClass('jqValidate');
				}

				if ($('.issue:first').children(':first-child').children(':first-child').val() === "Yes" && $('.issue:first').children(':first-child').hasClass('checked')) {
					$('#issueType').show();
					$('#<%=issueTypeRadioButton.ClientID %>').addClass('jqValidate');
				}
				else {
					$('#issueType').hide();
					$('#<%=issueTypeRadioButton.ClientID %>').removeClass('jqValidate');
				}

			});

		});

	</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
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
					<h1 class="outset-border"><u>Home Insurance:</u></h1>
					<br />

					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label1" runat="server" Text="1. Marital Status :"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="maritalStatusRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem >Single</asp:ListItem>
									<asp:ListItem>Married</asp:ListItem>
									<asp:ListItem>Other</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label3" runat="server" Text="2. Residential Situation : "></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="residentialSituationRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem >Apartment</asp:ListItem>
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
									<asp:ListItem >20-28</asp:ListItem>
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
									<asp:ListItem >25000-35000</asp:ListItem>
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
						<asp:Label CssClass="control-label" ID="Label5" runat="server" Text="Home History : "></asp:Label></h3>
					<br />

					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label9" runat="server" Text="5. Type of home?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="homeTypeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem class="home">Apartment</asp:ListItem>
									<asp:ListItem class="home">Banglow</asp:ListItem>
									<asp:ListItem class="home">Multi-storied Building</asp:ListItem>
									<asp:ListItem class="home">Other</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6" id="homeType">
							<div>
								<asp:Label CssClass="control-label" ID="Label10" runat="server" Text="6. No. of apartments per story?"></asp:Label>
								<div class="col-12">
									<asp:RadioButtonList ID="apartmentNoRadioButton" runat="server" CssClass="mandatory jqValidate">
										<asp:ListItem >1</asp:ListItem>
										<asp:ListItem>2</asp:ListItem>
										<asp:ListItem>Above</asp:ListItem>
									</asp:RadioButtonList>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-6 7-2">
							<asp:Label CssClass="control-label" ID="Label6" runat="server" Text="7. How many story?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="storyNoRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem >1</asp:ListItem>
									<asp:ListItem>2-4</asp:ListItem>
									<asp:ListItem>4-8</asp:ListItem>
									<asp:ListItem>8-16</asp:ListItem>
									<asp:ListItem>16-above</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label13" runat="server" Text="8. Monthly premium rate?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="premiumRateRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem >5%-10%</asp:ListItem>
									<asp:ListItem>10%-15%</asp:ListItem>
									<asp:ListItem>15%-20%</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
					</div>
					
					<div class="row">
						
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label11" runat="server" Text="9. Does your property has any law/government relation issues?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="hasIssueRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem class="issue">Yes</asp:ListItem>
									<asp:ListItem class="issue">No</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6" id="issueType">
							<div>
								<asp:Label CssClass="control-label" ID="Label12" runat="server" Text="10. Type of issue?"></asp:Label>
								<div class="col-12">
									<asp:RadioButtonList ID="issueTypeRadioButton" runat="server" CssClass="mandatory jqValidate">
										<asp:ListItem >Govt</asp:ListItem>
										<asp:ListItem>Law</asp:ListItem>
									</asp:RadioButtonList>
								</div>
							</div>
						</div>
					</div>
					<br />
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
