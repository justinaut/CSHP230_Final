<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Styles/Custom/SiteMaster.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Register for Classes</h2>
    <div>
        <asp:Label ID="RegisterLabel" Text="Enter Class ID to Register" runat="server"/> 
        <asp:TextBox ID="RegisterClass_Textbox" runat="server" />
        <asp:Label ID="Feedback_Label" runat="server"/><br />
        <asp:Button ID="Register_Button" Text="Register" OnClick="Register_Button_Click" runat="server" />
    </div>
    <br />
    <div>
        <% if (ClassList == null || ClassList.Count == 0)
            { %>
            <p>Sorry, course registration is not avaialable at this time. Please check back later!</p>
        <% } %>
        <% else
        { %>
            <% foreach (var classy in ClassList) { %> 
                <h3>Class ID <%=classy.ClassId %></h3>
                <p><strong><% =classy.ClassName %></strong> (Date: <% =(classy.ClassDate).ToString("yyyy-MM-dd") %>)</p>
                <p><i><% =classy.ClassDescription %></i></p>
                <% if (RegisteredClassIds.Contains(classy.ClassId))
                 { %>
                    <p>(You are registered for this course)</p>
                <% } %>
            <% } %>
        <% } %>
    </div>
</asp:Content>
