<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Login</h2>
    
    <asp:Label ID="LoginName_Label" AssociatedControlID="LoginName_TextBox" Text="Login Name" runat="server" /><br />
    <asp:TextBox ID="LoginName_TextBox" runat="server" /><br />

    <asp:Label ID="Password_Label" AssociatedControlID="Password_TextBox" Text="Password" runat="server" /><br />
    <asp:TextBox ID="Password_TextBox" TextMode="Password" runat="server" /><br />

    <asp:Button runat="server" ID="Login_Button" Text="Login" OnClick="Login_Button_Click"></asp:Button>
</asp:Content>
