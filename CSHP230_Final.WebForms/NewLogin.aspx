﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewLogin.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Styles/Custom/NewLogin.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Request a New Login</h2>
    <p>To request a login, enter the information below and an admin will process your request.</p>

    <asp:Label ID="Name_Label" class="left" AssociatedControlID="Name_Textbox" Text="Name" runat="server" /><br />
    <asp:TextBox ID="Name_Textbox" runat="server" />
    <asp:RequiredFieldValidator ID="Name_RequiredFieldValidator" runat="server" ErrorMessage="Name is required" ControlToValidate="Name_Textbox"></asp:RequiredFieldValidator><br />

    <asp:Label ID="Email_Label" class="left" AssociatedControlID="Email_Textbox" Text="Email" runat="server" /><br />
    <asp:TextBox ID="Email_Textbox" runat="server" />
    <asp:RequiredFieldValidator ID="Email_RequiredFieldValidator" runat="server" ErrorMessage="Email is required" ControlToValidate="Email_Textbox"></asp:RequiredFieldValidator><br />

    <asp:Label ID="LoginName_Label" class="left" AssociatedControlID="LoginName_Textbox" Text="Login Name" runat="server" /><br />
    <asp:TextBox ID="LoginName_Textbox" runat="server" />
    <asp:RequiredFieldValidator ID="LoginName_RequiredFieldValidator" runat="server" ErrorMessage="Login Name is required" ControlToValidate="LoginName_Textbox"></asp:RequiredFieldValidator><br />

    <asp:Label ID="Reason_Label" class="left" AssociatedControlID="Reason_Textbox" Text="Reason for Access?" runat="server" /><br />
    <asp:TextBox ID="Reason_Textbox" runat="server" TextMode="multiLine" Columns="50" Rows="5" />
    <asp:RequiredFieldValidator ID="Reason_RequiredFieldValidator" runat="server" ErrorMessage="A Reason is required" ControlToValidate="Reason_Textbox"></asp:RequiredFieldValidator><br />
    
    <asp:Button runat="server" ID="RegistrationSubmit_Button" Text="Submit Login Request" OnClick="RegistrationSubmit_Button_Click"></asp:Button>
</asp:Content>
