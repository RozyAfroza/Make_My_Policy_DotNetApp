<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="FindAgentManagerAuthenticator.aspx.cs" Inherits="MakeMyPolicyApp.UI.CustomerManagerAuthenticator" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "FindAgentUI"; %>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div class="container big-card">
		<div style="height: auto">
			<div class="form-horizontal">
				<%--<asp:Label CssClass="control-label" ID="Label6" runat="server" Text="Customer Manager Authentication:"></asp:Label>--%>
				<%-- <div class="col-12">
                    <asp:Label ID="Label1" runat="server" Text="Label">NID Number:</asp:Label>
                &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-5"></div>
                    <asp:Button ID="submitButton" CssClass="btn btn-primary" runat="server" Text="Submit"/>
                </div>--%>
				<div class="form-group row">
					<div class="offset-1 col-sm-4">
						<label class="control-label " for="ageInputBox" runat="server">How old are you?<abbr title="Required" class="required"></abbr></label>
					</div>
					<div class="col-sm-6">
						<input class="form-control mandatory jqValidate" name="NID" type="number" id="ageInputBox" runat="server" placeholder="Type age" />
						<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
					</div>
				</div>
				<div class="form-group row">
					<div class="offset-1 col-sm-4">
						<label class="control-label " for="professionInputBox" runat="server">What are you doing?<abbr title="Required" class="required"></abbr></label>
					</div>
					<div class="col-sm-6">
						<input class="form-control mandatory jqValidate" name="NID" type="text" id="professionInputBox" runat="server" placeholder="Type profession" />
						<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
					</div>
				</div>
				<div class="form-group row">
					<div class="offset-1 col-sm-4">
						<label class="control-label " for="NIDInputBox" runat="server">Please give your NID.<abbr title="Required" class="required"></abbr></label>
					</div>
					<div class="col-sm-6">
						<input class="form-control mandatory jqValidate" name="NID" type="number" id="NIDInputBox" runat="server" placeholder="Type national id card number" />
						<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
					</div>
				</div>

				<div class="form-group row">
					<div class="offset-5 col-sm-7">
						<asp:Button CssClass="btn btn-primary" ID="submitButton" runat="server" Text="Submit" OnClientClick="javascript:return inputFieldValidation();" OnClick="submitButton_Click" />
					</div>
				</div>

			</div>
		</div>
	</div>
</asp:Content>
