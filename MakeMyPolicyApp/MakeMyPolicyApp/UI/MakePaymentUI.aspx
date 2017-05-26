<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="MakePaymentUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.MakePaymentUI" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "MakePaymentUI"; %>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content" runat="server">
	<div class="container big-card">
		<div style="height: auto">
			<div class="form-horizontal">
				<h5>Available Payment Methods:</h5>
			<br/>
				<table class="table table-sm table-inverse" style="border: none">
					<thead>
						<tr class="bg-primary">
							<th>#</th>
							<th>Payment Method</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<tr class="bg-success">
							<th scope="row">1</th>
							<td class="bg-success">Pay via credit card</td>
							<td class="bg-success">Active</td>
						</tr>
						<tr class="bg-warning">
							<th scope="row">2</th>
							<td class="bg-warning">Pay by phone/text</td>
							<td class="bg-warning">Active</td>
						</tr>
						<tr class="bg-danger">
							<th scope="row">3</th>
							<td class="bg-danger">Pay by eamil</td>
							<td class="bg-warning">Active</td>
							<%--<td class="bg-danger"><a href="MakePaymentEmail.aspx">Send a mail</a></td>--%>
						</tr>
						<%--<tr class="bg-info">
							<th scope="row">3</th>
							<td colspan="2" class="bg-info">Larry the Bird</td>
							<td class="bg-info">@twitter</td>
						</tr>--%>
					</tbody>
				</table>


			</div>
		</div>
	</div>
</asp:Content>
