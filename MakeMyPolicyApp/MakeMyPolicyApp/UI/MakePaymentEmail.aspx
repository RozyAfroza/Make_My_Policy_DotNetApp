<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="MakePaymentEmail.aspx.cs" Inherits="MakeMyPolicyApp.UI.MakePaymentEmail" %>


<asp:Content runat="server" ID="Head" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="content">
	<div class="form-horizontal big-card">
        
        <div class="form-group row">
            <div class="col-sm-2"></div>
            <div class=" col-sm-3">
                <label class="control-label" for="policyIdInputBox" runat="server">Policy Id</label>
            </div>
            <div class="col-sm-6">
                <input class="form-control" type="number" id="policyIdInputBox" runat="server" readonly="readonly" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-2"></div>
            <div class=" col-sm-3">
                <label class="control-label" for="fullNameInputBox" runat="server">Name</label>
            </div>
            <div class="col-sm-6">
                <input class="form-control" type="text" id="fullNameInputBox" runat="server" readonly="readonly" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-2"></div>
            <div class=" col-sm-3">
                <label class="control-label " for="amountInputBox" runat="server">Amount</label>
            </div>
            <div class="col-sm-6">
                <input class="form-control" type="number" id="amountInputBox" runat="server" placeholder="Type Amount" />
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-2"></div>
            <div class=" col-sm-3">
                <label class="control-label " for="insuranceNoInputBox" runat="server">Insurance No</label>
            </div>
            <div class="col-sm-6">
                <input class="form-control" type="number" id="insuranceNoInputBox" runat="server" placeholder="Type Insurance Number" />
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-5"></div>
            <div class=" col-sm-7">
                <asp:Button CssClass="btn btn-primary" ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>

