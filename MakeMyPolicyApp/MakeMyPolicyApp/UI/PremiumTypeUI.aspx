<%@ Page Language="C#" MasterPageFile="Home.Master" AutoEventWireup="true" CodeBehind="PremiumTypeUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.PremiumTypeUI" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "PremiumTypeUI"; %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

	<% var message = (string)Session["PremiumType"]; %>

	<div class="big-card">

		<div class="row">
			<h2 style="color: green"><%= message %></h2>
		</div>
		<br />
		<br />
		<div class="row">
			<h5>According to your information, you are suggested to open your account in one of the following insurance.
			</h5>
		</div>
		<br />
		<br />
		<div class="row">
			<% switch (message)
				{
					case "You are selected for High-Premium.": %>
			<div class="col-12 outset-border">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.nlibd.com/" target="_blank" class="insurance-link">National Life Insurance Company Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							Jahangir Tower, N.L.I. 54,, Kazi Nazrul Islam Ave, Dhaka 1215, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-9560241</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.popularlifeins.com/" target="_blank" class="insurance-link">Popular Life Insurance Company Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							B-121, Shugondha Super Market, Dhaka - Aricha Hwy, Savar 1340, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 1942-866566</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.deltalife.org/" target="_blank" class="insurance-link">Delta Life Insurance Company Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							Delta Life Tower, Plot # 37, Rd No 90, Dhaka 1212, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-55051919</p>
					</div>
				</div>
			</div>

			<%
					break;

				case "You are selected for Medium-High Premium.": %>
			<div class="col-12 outset-border">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.metlife.com.bd/en/Individual/index.html" target="_blank" class="insurance-link">MetLife Alico</a></p>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							MetLife Building · 18-20 Motijheel C/A, Dhaka -1000 · Bangladesh, 18-20 Dilkusha Rd, Dhaka 1000, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-9561791 ext. 1633</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.charteredlifebd.com/" target="_blank" class="insurance-link">Chartered Life Insurance Company Ltd.</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							SANARC Complex, 76, Shahid Tajuddin Ahmed Sharani, Tejgaon, Dhaka-1208, Shaheed Tajuddin Ahmed Ave, Dhaka 1208, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-8878196</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.pioneerinsurance.com.bd/" target="_blank" class="insurance-link">Pioneer Insurance Company Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							Rupayan Golden Age (4th Floor), 99, Gulshan Ave, Dhaka 1212, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-8833543</p>
					</div>
				</div>
			</div>
			<%
					break;

				case "You are selected for Medium-Low Premium.": %>
			<div class="col-12 outset-border">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://reliance.com.bd/" target="_blank" class="insurance-link">Reliance Insurance Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							H.M Plaza (8th Floor) House # 34, Road # 2, Dhaka 1230, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 1755-638295</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.standardinsurance.com.bd/" target="_blank" class="insurance-link">Standard Insurance Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							Civil Engineers Bhaban (Level-05), 69, Mohakhali C/A, Bir Uttam AK Khandakar Road, Dhaka 1212, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-9880706</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.eastlandinsurance.com/" target="_blank" class="insurance-link">Eastland Insurance Company Limited</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							88 Motijheel C/A, Motijheel Rd, Dhaka 1000, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-9564600</p>
					</div>
				</div>
			</div>
			<%
					break;

				case "You are selected for Low Premium.": %>
			<div class="col-12 outset-border">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://cicl-bd.com/index.html" target="_blank" class="insurance-link">Central Insurance Company Ltd.</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							7-8, CIC Tower (3rd & 4th Floor), Motijheel C/A, Dhaka-1000, Toyenbee Rd, Dhaka 1000, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-9560251</p>
					</div>
				</div>
			</div>
			
			<div class="col-12 outset-border mt-2">
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-building fa-lg"></i><a href="http://www.pragatilife.com/" target="_blank" class="insurance-link">Pragati Life Insurance Ltd</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p>
							<i class="fa fa-map-marker fa-lg"></i>
							House:20-21,(6th Floor) Kazi Nazrul Islam Ave, Dhaka 1215, Bangladesh
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p><i class="fa fa-phone fa-lg"></i>+880 2-9124024</p>
					</div>
				</div>
			</div>
			<%
					break;
				} %>
		</div>
		<br />
		<br />
		<%--<div class="row">
			<h5>Available Payment Methods:</h5>
			<br/>
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
							<td class="bg-danger"><a href="MakePaymentEmail.aspx">Send a mail</a></td>
						</tr>
						$1$<tr class="bg-info">
							<th scope="row">3</th>
							<td colspan="2" class="bg-info">Larry the Bird</td>
							<td class="bg-info">@twitter</td>
						</tr>#1#
					</tbody>
				</table>
		</div>--%>

		<div class="row justify-content-center">
			<div class="col-6 outset-border">
				<asp:HyperLink ID="makePaymentButton" CssClass="btn btn-success offset-2 col-8" runat="server" NavigateUrl="MakePaymentUI.aspx"><i class="fa fa-dollar fa-lg"></i>&nbsp;Make Payment</asp:HyperLink>
			</div>
		</div>
		
		<div class="row justify-content-center mt-2">
			<div class="col-6 outset-border">
				<asp:HyperLink ID="findAgentButton" CssClass="btn btn-success offset-2 col-8" runat="server" NavigateUrl="FindAgentUI.aspx"><i class="fa fa-search fa-lg"></i>&nbsp;Find Agent</asp:HyperLink>
			</div>
		</div>
	</div>


</asp:Content>
