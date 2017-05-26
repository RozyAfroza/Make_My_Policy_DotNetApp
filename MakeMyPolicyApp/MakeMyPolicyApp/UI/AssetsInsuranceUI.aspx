<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Home.Master" CodeBehind="AssetsInsuranceUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.AssetsInsuarenceUI" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "AssetsInsuranceUI"; %>
	<script>
		$(document).ready(function () {


			$('#non-tangible').hide();
			$('#tangible').hide();
			
			$('input, ins, label').click(function () {
				if ($('.asset:first').children(':first-child').children(':first-child').val() === "Tangible" && $('.asset:first').children(':first-child').hasClass('checked'))
				{
					$('#tangible').show();
					$('#non-tangible').hide();
					$('#<%=tangibleGoodwillValueRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=tangibleTypeRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=nonTangibleTypeRadioButton.ClientID %>').removeClass('jqValidate');
				} else {
					$('#tangible').hide();
					$('#non-tangible').show();
					$('#<%=nonTangibleTypeRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=tangibleGoodwillValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=tangibleTypeRadioButton.ClientID %>').removeClass('jqValidate');
				}
			});

			$('#intellectual').hide();
			$('#education').hide();
			$('#copyright').hide();
			$('#business').hide();

			
			$('input, ins, label').click(function () {
				
				
				if ($('.nonTangible:first').children(':first-child').children(':first-child').val() === "Intellectual" && $('.nonTangible:first').children(':first-child').hasClass('checked')) {
					$('#intellectual').show();
					$('#education').hide();
					$('#copyright').hide();
					$('#business').hide();
					$('#<%=intellectualValueRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=educationValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=copyrightValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=businessValueRadioButton.ClientID %>').removeClass('jqValidate');
				}
				else if ($('.nonTangible:eq(1)').children(':first-child').children(':first-child').val() === "Education" && $('.nonTangible:eq(1)').children(':first-child').hasClass('checked')) {
					$('#intellectual').hide();
					$('#education').show();
					$('#copyright').hide();
					$('#business').hide();
					$('#<%=educationValueRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=intellectualValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=copyrightValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=businessValueRadioButton.ClientID %>').removeClass('jqValidate');
				}
				else if ($('.nonTangible:eq(2)').children(':first-child').children(':first-child').val() === "Copyright" && $('.nonTangible:eq(2)').children(':first-child').hasClass('checked')) {
					$('#intellectual').hide();
					$('#education').hide();
					$('#copyright').show();
					$('#business').hide();
					$('#<%=copyrightValueRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=educationValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=intellectualValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=businessValueRadioButton.ClientID %>').removeClass('jqValidate');
				}
				else if ($('.nonTangible:last').children(':first-child').children(':first-child').val() === "Business" && $('.nonTangible:last').children(':first-child').hasClass('checked')) {
					$('#intellectual').hide();
					$('#education').hide();
					$('#copyright').hide();
					$('#business').show();
					$('#<%=businessValueRadioButton.ClientID %>').addClass('jqValidate');
					$('#<%=educationValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=intellectualValueRadioButton.ClientID %>').removeClass('jqValidate');
					$('#<%=copyrightValueRadioButton.ClientID %>').removeClass('jqValidate');
				}
				
			});

			

		});
	</script>

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
					<h1 class="outset-border"><u>Asset Insurance:</u></h1>
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
						<asp:Label CssClass="control-label" ID="Label5" runat="server" Text="Asset History : "></asp:Label>
					</h3>
					<br />

					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label9" runat="server" Text="5. Times for insurance?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="insuranceTimeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem >Life</asp:ListItem>
									<asp:ListItem>Other</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label10" runat="server" Text="6. Type of asset or property?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="assetTypeRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem class="asset">Tangible</asp:ListItem>
									<asp:ListItem class="asset">Non-tangible</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</div>
					</div>
					<div id="tangible">
						<div class="row">
							<div class="form-group col-6">
								<asp:Label CssClass="control-label" ID="Label11" runat="server" Text="7. Goodwill value of tangible property?"></asp:Label>
								<div class="col-12">
									<asp:RadioButtonList ID="tangibleGoodwillValueRadioButton" runat="server" CssClass="mandatory">
										<asp:ListItem >50lac-70lac</asp:ListItem>
										<asp:ListItem>80lac-1cr</asp:ListItem>
										<asp:ListItem>1cr-5cr</asp:ListItem>
										<asp:ListItem>5cr-10cr</asp:ListItem>
									</asp:RadioButtonList>
								</div>
							</div>
							<div class="form-group col-6">
								<asp:Label CssClass="control-label" ID="Label6" runat="server" Text="8. Type of tangible property?"></asp:Label>
								<div class="col-12">
									<asp:RadioButtonList ID="tangibleTypeRadioButton" runat="server" CssClass="mandatory">
										<asp:ListItem >Rented</asp:ListItem>
										<asp:ListItem>Owned</asp:ListItem>
									</asp:RadioButtonList>
								</div>
							</div>
						</div>
					</div>

					<div id="non-tangible">
						<div class="row">
							<div class="form-group col-6">
								<asp:Label CssClass="control-label" ID="Label12" runat="server" Text="7. Type of non-tangible property?"></asp:Label>
								<div class="col-12">
									<asp:RadioButtonList ID="nonTangibleTypeRadioButton" runat="server" CssClass="mandatory">
										<asp:ListItem class="nonTangible">Intellectual</asp:ListItem>
										<asp:ListItem class="nonTangible">Education</asp:ListItem>
										<asp:ListItem class="nonTangible">Copyright</asp:ListItem>
										<asp:ListItem class="nonTangible">Business</asp:ListItem>
									</asp:RadioButtonList>
								</div>
							</div>

							<div class="form-group col-6">
								<div id="intellectual">
									<asp:Label CssClass="control-label" ID="Label7" runat="server" Text="8. Goodwill value of non-tangible property?"></asp:Label>
									<div class="col-12">
										<asp:RadioButtonList ID="intellectualValueRadioButton" runat="server" CssClass="mandatory">
											<asp:ListItem >10lac</asp:ListItem>
											<asp:ListItem>10-30lac</asp:ListItem>
											<asp:ListItem>40-80lac</asp:ListItem>
										</asp:RadioButtonList>
									</div>
								</div>
								<div id="education">
									<asp:Label CssClass="control-label" ID="Label8" runat="server" Text="8. Goodwill value of non-tangible property?"></asp:Label>
									<div class="col-12">
										<asp:RadioButtonList ID="educationValueRadioButton" runat="server" CssClass="mandatory">
											<asp:ListItem >15lac</asp:ListItem>
											<asp:ListItem>15-40lac</asp:ListItem>
											<asp:ListItem>40-80lac</asp:ListItem>
										</asp:RadioButtonList>
									</div>
								</div>
								<div id="copyright">
									<asp:Label CssClass="control-label" ID="Label13" runat="server" Text="8. Goodwill value of non-tangible property?"></asp:Label>
									<div class="col-12">
										<asp:RadioButtonList ID="copyrightValueRadioButton" runat="server" CssClass="mandatory">
											<asp:ListItem >20lac</asp:ListItem>
											<asp:ListItem>20-50lac</asp:ListItem>
											<asp:ListItem>50-1cr</asp:ListItem>
										</asp:RadioButtonList>
									</div>
								</div>
								<div id="business">
									<asp:Label CssClass="control-label" ID="Label14" runat="server" Text="8. Goodwill value of non-tangible property?"></asp:Label>
									<div class="col-12">
										<asp:RadioButtonList ID="businessValueRadioButton" runat="server" CssClass="mandatory">
											<asp:ListItem >30lac</asp:ListItem>
											<asp:ListItem>30-60lac</asp:ListItem>
											<asp:ListItem>60-1cr</asp:ListItem>
										</asp:RadioButtonList>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-6">
							<asp:Label CssClass="control-label" ID="Label15" runat="server" Text="9. Monthly premium rate?"></asp:Label>
							<div class="col-12">
								<asp:RadioButtonList ID="premiumRateRadioButton" runat="server" CssClass="mandatory jqValidate">
									<asp:ListItem >5%-10%</asp:ListItem>
									<asp:ListItem>10%-15%</asp:ListItem>
									<asp:ListItem>15%-20%</asp:ListItem>
								</asp:RadioButtonList>
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
				<% } %>
			</div>
		</div>
	</div>

	
</asp:Content>

