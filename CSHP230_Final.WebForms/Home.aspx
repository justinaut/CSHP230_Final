<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (ViewState["UserLoggedIn"] != null && ViewState["UserLoggedIn"].ToString() == "y")
        { %>
    <h2>Welcome</h2>
    <p>Thank you for being a student with us, <%=ViewState["StudentName"].ToString() %>!</p>
    <% }
    else
    {%>
    <h2>Student Registration</h2>
    <p>Log on with your student login.<br>
        If you do not have a student login, <a href="Login.aspx">enter a request</a> to create one!</p>
    <% } %>
</asp:Content>
