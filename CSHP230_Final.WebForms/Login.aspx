﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Styles/Custom/SiteMaster.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (ViewState["UserLoggedIn"] != null && ViewState["UserLoggedIn"].ToString() == "y")
        { %>
    <h2>Student Info</h2>
    <p>Hi, <%=ViewState["StudentName"].ToString() %>!</p>
    <p>Looks like your login name is <strong><%=ViewState["StudentLogin"] %></strong> and the email address we have on file is<strong> <%=ViewState["StudentEmail"]  %></strong>.</p>
    <% }
        else
        {%>
    <h2>Login</h2>
    <asp:Label ID="LoginName_Label" AssociatedControlID="LoginName_Textbox" Text="Login Name" runat="server" /><br />
    <asp:TextBox ID="LoginName_Textbox" runat="server" />
    <asp:RequiredFieldValidator ID="LoginName_RequiredFieldValidator" class="feedback-text-attention" runat="server" ErrorMessage="Login Name is required" ControlToValidate="LoginName_Textbox"></asp:RequiredFieldValidator><br />

    <asp:Label ID="Password_Label" AssociatedControlID="Password_Textbox" Text="Password" runat="server" /><br />
    <asp:TextBox ID="Password_Textbox" TextMode="Password" runat="server" />
    <asp:RequiredFieldValidator ID="Password_RequiredFieldValidator" class="feedback-text-attention" runat="server" ErrorMessage="A password is required" ControlToValidate="Password_Textbox"></asp:RequiredFieldValidator><br />

    <asp:Button runat="server" ID="Login_Button" Text="Login" OnClick="Login_Button_Click"></asp:Button>
    <% } %>
</asp:Content>
