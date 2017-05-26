<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Home.Master" CodeBehind="SignupUI.aspx.cs" Inherits="MakeMyPolicyApp.SignupUI" %>


<%--<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<style>
		/*.image {
			background-image: url("../Contents/policy-4.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			padding: 0;
			margin-top: -20px;
		}
		.navImage {
			background-image: url("../Contents/Policy2-header.jpg");
			background-repeat: no-repeat;
			background-size: cover;
		}*/
	</style>
	<link href="../Content/bootstrap.css" rel="stylesheet" />
	$1$<link rel="shortcut icon" type="image/x-icon" href="<%=ResolveUrl("~/favicon.ico")%>" />#1#
</asp:Content>--%>

<asp:Content ContentPlaceHolderID="content" ID="Content3" runat="server">

	<div class="form-horizontal big-card">
		<div id="alertDiv">
			
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label" for="" runat="server">Username<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-sm-6">
				<input class="form-control mandatory jqValidate" name="User Name" clientidmode="Static" type="text" id="userNameInputBox" runat="server" placeholder="Type User Name" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label" for="fullNameInputBox" runat="server">Full Name<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-sm-6">
				<input class="form-control mandatory jqValidate" name="Full Name" clientidmode="Static" type="text" id="fullNameInputBox" runat="server" placeholder="Type Full Name" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="passwordInputBox" runat="server">Password<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-sm-6">
				<input class="form-control mandatory jqValidate" name="Password" type="password" id="passwordInputBox" runat="server" placeholder="Type Password" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<!-- You may want to consider adding a "confirm" password box also -->
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="retypePasswordInputBox" runat="server">Confirm Password<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-sm-6">
				<input class="form-control mandatory jqValidate" name="Confirm Password" type="password" id="retypePasswordInputBox" runat="server" placeholder="Retype Password" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="emailInputBox" runat="server">Email<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-sm-6">
				<input class="form-control mandatory jqValidate" name="Email" type="email" id="emailInputBox" runat="server" placeholder="Type Email" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label" for="dobInputBox" runat="server">Date of Birth</label>
			</div>
			<div class="col-sm-6">
				<input class="form-control datepicker jqValidate" style="padding: 8px;" name="Date Of Birth" type="text" id="dobInputBox" data-provide="datepicker" runat="server" placeholder="Type Date Of Birth" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="NIDInputBox" runat="server">NID<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-sm-6">
				<input class="form-control mandatory jqValidate" name="NID" type="text" id="NIDInputBox" runat="server" placeholder="Type National Id Card No." />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="telInputBox" runat="server">Telephone</label>
			</div>
			<div class="col-sm-6">
				<input class="form-control" type="text" name="Telephone" id="telInputBox" runat="server" placeholder="Type Telephone No." />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="addressTextArea" runat="server">Address</label>
			</div>
			<div class="col-sm-6">
				<textarea class="form-control" name="Address" id="addressTextArea" runat="server"></textarea>
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-2 col-sm-3">
				<label class="control-label " for="postCodeInputBox" runat="server">Post Code</label>
			</div>
			<div class="col-sm-6">
				<input class="form-control" name="Post Code" type="text" id="postCodeInputBox" runat="server" placeholder="Type Post Code" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-5 col-sm-7">
				<asp:Button CssClass="btn btn-primary" ID="signupButton" runat="server" Text="Signup" OnClientClick="javascript:return inputFieldValidation();" OnClick="signupButton_Click" />
			</div>
		</div>
	</div>

	<script>
		
		$(document).ready(function () {
			$('.datepicker').datepicker({
				format: "dd/mm/yyyy",
				autoclose: true
			}, function() {
				$(this).datepicker().hide();
			});
		});

	</script>
</asp:Content>
