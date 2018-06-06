<%@ Page Title="My Classes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyClasses.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>My Classes</h2>
    <div id="classListing">
        <% if (ClassList == null || ClassList.Count == 0) { %>
            <p>You have not registered for clases yet. Why not <a href="Register.aspx">registerfor a class</a>?</p>
        <% } else
            { %>
            <p>Hey, <%=ViewState["StudentName"].ToString() %>, here are the classes you have registered for:</p>
            <% foreach (var classy in ClassList) { %>
                <p><strong><%=classy.ClassName %></strong> (Date: <%=(classy.ClassDate).ToString("yyyy-MM-dd") %>)</p>
                <p><i><%=classy.ClassDescription %></i></p>
        <% }
        } %>
    </div>
</asp:Content>
