<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Rezultatele cautarii</h2>
    <div class="row">
        <asp:ListView runat="server" ID="box1">
            <ItemTemplate>
                <div class="col-md-6">
                    <h2>
                        <asp:Label runat="server" ID="titluStire" Text='<%# Eval("titlu") %>'></asp:Label></h2>
                    <div class="meta">
                        <small>
                            <span>Published by:<strong>
                                <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label>
                            </strong></span>
                            <span>@
                                <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label></span>
                            <span>in <a href="Category.aspx?cat_id=<%# Eval("cat_id") %>"><%# Eval("category") %></a></span>
                        </small>
                    </div>
                    <asp:Image runat="server" ID="imagine" ImageUrl='<%# ("~/images/") + Eval("image")%>' AlternateText="IMAGINE" />
                    <p class="excerpt">
                        <asp:Label runat="server" Text='<%# Eval("continut") %>'></asp:Label></p>
                    <asp:HyperLink CssClass="btn btn-default pull-right" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>' Text="Citeste mai mult" runat="server"></asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
