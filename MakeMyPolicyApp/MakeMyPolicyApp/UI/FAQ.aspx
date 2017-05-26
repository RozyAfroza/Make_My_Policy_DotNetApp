<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="MakeMyPolicyApp.UI.FAQ" %>

<%@ Import Namespace="MakeMyPolicyApp.BLL" %>
<%@ Import Namespace="MakeMyPolicyApp.ModelClass" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div class="big-card">
		<%
			FaqManager _faqManager = new FaqManager();
			List<FaqCommentModel> faqCommentList = _faqManager.GetFaqComment();
			int i = 0;
			foreach (FaqCommentModel faqCommentModel in faqCommentList)
			{
			%>
				<div class="container-fluid mb-4">
					<div class="row">
						<h5 class="" style="color: darksalmon;"><% Response.Write(++i +". " + faqCommentModel.Title); %></h5>
					</div>
					
					<div class="row">
						<span class="ml-4"><%=faqCommentModel.Comment %></span>
					</div>
					<hr/>
				</div>
			<%
			}
		%>
	</div>
</asp:Content>
