<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category"  MasterPageFile="~/MasterPage.master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="alert alert-danger" role="alert" id="faraStiri" runat="server">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            Nu exista stiri asignate acestei categorii!
        </div>
    <div class="row" runat="server" id="mainZone">
        <div class="col-md-4 pull-right">
            Order by: <strong>Publish date: </strong> &nbsp;&nbsp;<asp:ImageButton ImageUrl="~/App_Themes/images/upArrow.png" runat="server" ID="sortASC" Text="ASC" OnClick="sortASC_Click" /> <asp:ImageButton ImageUrl="~/App_Themes/images/downArrow.png" runat="server" ID="sortDESC" Text="DESC" OnClick="sortDESC_Click" /> | 
            <strong>titlu </strong> <asp:ImageButton ImageUrl="~/App_Themes/images/upArrow.png" runat="server" ID="ASCnume" Text="ASC" OnClick="ASCnume_Click" /> <asp:ImageButton ImageUrl="~/App_Themes/images/downArrow.png" runat="server" ID="DESCnume" Text="DESC" OnClick="DESCnume_Click" />
        </div>
    </div>
    <div class="row">
    <asp:ListView runat="server" ID="listaCuStiri">
        <ItemTemplate>
            <div class="col-md-6">
                <h2><asp:Label runat="server" ID="titluStire" Text='<%# Eval("titluStire") %>'></asp:Label></h2>
                <div class="meta">
                    <span>Autor: <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label> </span>
                    <span>Publish date: <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label></span>
                </div>
                <asp:Image runat="server" ID="imagine" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                <p class="excerpt"><asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label></p>
                <asp:HyperLink  CssClass="btn btn-default pull-right" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>' Text ="Citeste mai mult" runat="server"></asp:HyperLink>
            </div>
        </ItemTemplate>
    </asp:ListView>
        </div>
</asp:Content>