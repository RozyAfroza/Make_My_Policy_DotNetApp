<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="ChatWithUserUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.ChatWithUser" %>
<%@ Import Namespace="MakeMyPolicyApp.BLL" %>
<%@ Import Namespace="MakeMyPolicyApp.ModelClass" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div id="mesgDiv" class="row">
		<div></div>
		<div></div>
	</div>
	<div class="container big-card">
		<div style="height: auto">
			<div class="form-horizontal">
				

				<div class="container-fluid">
					<%
			ChatManager _chatManager = new ChatManager();
			//int userId = int.Parse(ViewState["UserIdFromAdmin"].ToString());
			int userId = int.Parse(Request.QueryString["userId"]);
			List<ChatModel> chatModelList = _chatManager.GetIndividualChatMessageList(userId);
			
			foreach (ChatModel chatModel in chatModelList)
			{
			%>
				<div class="container-fluid mb-4">
					<div class="row">
						<h5 class="" style="color: darksalmon;"><% if (chatModel.UserType == "Me") {Response.Write(ViewState["FullName"].ToString());}else{Response.Write(chatModel.UserType);}%>
						</h5>
					</div>
					
					<div class="row">
						<span class="ml-4"><%=chatModel.Message %></span>
					</div>
					<hr/>
				</div>
			<%
			}
		%>
				</div>
				

				<div class="form-group row">
					<div class="offset-1 col-8">
						<textarea class="form-control mandatory jqValidate" name="Address" id="chatBoxTextArea" runat="server" placeholder="Type Message" style="height: 100px;"></textarea>
						<label class="validation-summary-errors field-validation-error" style="display: none;"></label>
					</div>
					<div class="col-3 mt-4">
						<asp:Button CssClass="btn btn-primary col-10" ID="submitButton" runat="server" Text="Send" OnClientClick="javascript:return inputFieldValidation();" OnClick="submitButton_Click" />
					</div>
				</div>
				<div class="form-group row">
					
				</div>
			</div>
		</div>
	</div>
</asp:Content>
