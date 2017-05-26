<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Home.Master" CodeBehind="HomeUI.aspx.cs" Inherits="MakeMyPolicyApp.UI.HomeUI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<% Session["PageName"] = "HomeUI"; %>

    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .link {
            position: relative;
            margin: auto;
            text-align: center;
            width: 50%;
            border: 3px solid green;
            padding: 10px;
            top: 69px;
            left: -3px;
        }

        h1 {
            background-color: green;
        }
    </style>

</asp:Content>

<asp:Content ID="Contents" ContentPlaceHolderID="content" runat="server">

    <%--<div>
        <h1>Welcome <%= String.Format("{0}",((User) Session["user"]).FullName) %></h1>
        <h1>Welcome <%= ((User) Session["user"]).FullName %></h1>
    </div>--%>

    <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="PersonelInsuarenceUI.aspx">Personel Insuarence Setup Page</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="BusinessInsuarenceUI.aspx">Business Insuarence Setup Page</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AssetsInsuarenceUI.aspx">Assets Insuarence Setup Page</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="HealthInsuarenceMedicalUI.aspx">Health Insuarence Medical Setup Page</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="MiscellaneousUI.aspx">Miscellaneous Setup Page</asp:HyperLink>
        <br />
        <br />--%>

    <div class="card" style="width: 100%; background: #117864; color: #e1ffff;">
        <img class="card-img-top" src="../Contents/insurance.jpg" height="332px" width="auto" alt="Card image cap">
        <div class="card-block">
            <h4 class="card-title">INSURANCE</h4>
            <p>
                Insurance is a means of protection from financial loss. It is a form of risk management primarily used to hedge against the risk of a contingent, uncertain loss. An entity which provides insurance is known as an insurer, insurance company, or insurance carrier. A person or entity who buys insurance is known as an insured or policyholder. The insurance transaction involves the insured assuming a guaranteed and known relatively small loss in the form of payment to the insurer in exchange for the insurer's promise to compensate the insured in the event of a covered loss. The loss may or may not be financial, but it must be reducible to financial terms, and must involve something in which the insured has an insurable interest established by ownership, possession, or preexisting relationship. The insured receives a contract, called the insurance policy, which details the conditions and circumstances under which the insured will be financially compensated. The amount of money charged by the insurer to the insured for the coverage set forth in the insurance policy is called the premium. If the insured experiences a loss which is potentially covered by the insurance policy, the insured submits a claim to the insurer for processing by a claims adjuster.
            </p>
        </div>
    </div>

    <div class="card" style="width: 100%; background: #117864; color: #e1ffff; margin-top: 15px;">
        <img class="card-img-top" src="../Contents/lifeinsurance.jpg" height="332px" width="auto" alt="Card image cap">
        <div class="card-block">
            <h4 class="card-title">LIFE INSURANCE</h4>
            <p>
                In its simplest form, life insurance is a promise between an insurance company and you, the policy owner. If you pay a certain amount of money (premium) to the insurance company, the insurance company will pay a certain amount of money (death benefit) to the person (beneficiary) you tell us to when the person whose life is being insured dies. There are many types of life insurance. Term insurance only provides a death benefit for a limited period of time. By contrast permanent insurance can provide a death benefit and the potential to build policy cash value that you can access during your lifetime using policy loans and withdrawals. Permanent insurance can also offer the flexibility to increase or decrease your death benefit as your needs change, as well as the potential to reduce or skip premium payments.
            </p>
        </div>
    </div>
</asp:Content>
