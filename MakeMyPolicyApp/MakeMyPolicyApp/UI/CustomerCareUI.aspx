<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="CustomerCareUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.CustomerCareUI" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "CustomerCareUI"; %>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div class="container big-card">
		<div class="row">
			<div class="col-5">
				<img align="right" src="../Contents/helpline_icon.png" alt="Help Line" height="150px" width="170px"/>
			</div>
			<div class="col-7">
				<div class="row">
					<h5 class="offset-1" style="color: burlywood">Contact with us:</h5>
					<br />
				</div>
				<div class="row">
					<span class="offset-1">042527</span><br />
				</div>
				<div class="row">
					<span class="offset-1">0882567</span><br />
				</div>
				<div class="row">
					<span class="offset-1">01706325976</span><br />
				</div>
				<div class="row">
					<span class="offset-1">01843199582</span><br />
				</div>
			</div>
		</div>
		<hr />
		<div class="form-group row">
			<div class="offset-1 col-4">
				<h5 class="control-label" for="commentTextArea" runat="server" style="color: lightseagreen">Leave a comment:</h5>
			</div>
		</div>

		<div class="form-group row">
			<div class="offset-1 col-2">
				<label class="control-label " for="commentTitleInputBox" runat="server">Title<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-8">
				<input class="form-control mandatory jqValidate" name="NID" type="text" id="commentTitleInputBox" runat="server" placeholder="Type Comment Title" />
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>

		<div class="form-group row">
			<div class="offset-1 col-sm-2">
				<label class="control-label " for="commentTextArea" runat="server">Comment<abbr title="Required" class="required"></abbr></label>
			</div>
			<div class="col-8">
				<textarea class="form-control mandatory jqValidate" name="Address" id="commentTextArea" runat="server" placeholder="Type Comment" style="height: 100px;"></textarea>
				<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-5 col-sm-7">
				<asp:Button CssClass="btn btn-primary feedbackAlert" ID="submitButton" runat="server" Text="Submit" OnClientClick="javascript:return inputFieldValidation();" OnClick="submitButton_Click" />
			</div>
		</div>
	</div>
</asp:Content>
