<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="AgentMessageListUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.AgentMessageList" %>

<%@ Import Namespace="MakeMyPolicyApp.BLL" %>
<%@ Import Namespace="MakeMyPolicyApp.ModelClass" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "AgentMessageListUI"; %>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div class="big-card">
		<div class="container-fluid mb-5">
			<div class="row">
				<h5>All Message List:</h5>
				<br />
			</div>

			<% 
				ChatReplayManager _chatReplayManager = new ChatReplayManager();
				List<ChatReplayStatus> replayStatuses = _chatReplayManager.GetAllChatReplayStatusList();
				foreach (ChatReplayStatus chatReplayStatus in replayStatuses)
				{ %>
			<div class="row align-content-center" style="border: 1px solid cadetblue">
				<div class="col-8 align-self-center">
					<span class="align-self-center"><%=chatReplayStatus.FullName %></span>
					<br />
				</div>
				<div class="offset-2 col-2 align-self-center">
					<a class="btn btn-info" href='ChatWithUserUI.aspx?userId=<%=chatReplayStatus.UserId%>'>View</a>
				</div>
			</div>
			<%	} %>
		</div>

		<div class="container-fluid">
			<%
				//ChatReplayManager _chatReplayManager = new ChatReplayManager();
				List<ChatReplayStatus> unreplayedStatuses = _chatReplayManager.GetUnReplayedStatusList();
				if (unreplayedStatuses.Count > 0)
				{
					
				
				 %>
					<div class="row">
						<h5>New Message List:</h5>
						<br />
					</div>

			<% 
				}
				foreach (ChatReplayStatus chatUnReplayedStatus in unreplayedStatuses)
				{ %>
			<div class="row align-content-center" style="border: 1px solid cadetblue">
				<div class="col-8 align-self-center">
					<span class="align-self-center"><%=chatUnReplayedStatus.FullName %></span>
					<br />
				</div>
				<div class="offset-2 col-2 align-self-center">
					<a class="btn btn-info" href='ChatWithUserUI.aspx?userId=<%=chatUnReplayedStatus.UserId%>'>View</a>
				</div>
			</div>
			<%	} %>
		</div>
	</div>
</asp:Content>
