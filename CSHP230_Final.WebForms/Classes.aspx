<%@ Page Title="Classes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="CSHP230_Final.WebForms.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Course Catalog</h2>
    <div id="classListing">
        <% if (ClassList == null || ClassList.Count <= 0) { %>
        <p>No Classes to show right now. Check back later!</p>
        <% } else { foreach (var classy in ClassList) { %>
                    <p><strong><%=classy.ClassName %></strong> (Date: <%=(classy.ClassDate).ToString("yyyy-MM-dd") %>)</p>
                    <p><i><%=classy.ClassDescription %></i></p>
                <%}
        } %>
    </div>
</asp:Content>
