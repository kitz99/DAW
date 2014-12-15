<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content runat="server" ContentPlaceHolderID="jumbothron">
    <div class="jumbotron">
        <h1 class="text-center" style="color: #d53939; margin-top: -25px;">News Flash!</h1>
        <blockquote>
            <p><i>Ziarul s-a îndepărtat de carte, jurnalismul s-a îndepărtat de televiziune şi s-a apropiat de internet, ziaristul a devenit un prestator de servicii, cetăţeanul a devenit ziarist.</i></p>
            <footer class="text-right">Cristian Tudor Popescu</footer>
        </blockquote>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="alert alert-success" role="alert" id="AlertaVid" runat="server">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">Error:</span>
        Nu exista categorii din care sa listez
    </div>
    <div class="row">
        <div class="col-md-4" runat="server" id="place1">
            <h2>
                <asp:Label runat="server" ID="titlu1"></asp:Label></h2>
            <asp:ListView runat="server" ID="box1">
                <ItemTemplate>
                    <div class="stireIndividual">
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <h4><asp:Label runat="server" Text='<%# Eval("titluStire") %>'></asp:Label></h4></asp:HyperLink>

                        <div class="meta">
                            by <strong>
                                <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label></strong> @
                            <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label>
                        </div>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <asp:Image runat="server" CssClass="adapt-width" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                        </asp:HyperLink>
                        <asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <div class="col-md-4" runat="server" id="place2">
            <h2>
                <asp:Label runat="server" ID="titlu2"></asp:Label></h2>
            <asp:ListView runat="server" ID="box2">
                <ItemTemplate>
                    <div class="stireIndividual">
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <h4><asp:Label runat="server" Text='<%# Eval("titluStire") %>'></asp:Label></h4></asp:HyperLink>

                        <div class="meta">
                            by <strong>
                                <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label></strong> @
                            <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label>
                        </div>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <asp:Image runat="server" CssClass="adapt-width" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                        </asp:HyperLink>
                        <asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="col-md-4" id="listaCategorii" runat="server">
            <h3>Exploreaza categoriile</h3>
            <ul class="lista-categorii">
                <asp:ListView runat="server" ID="listCat">
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink CssClass="list-elem" NavigateUrl='<%# "Category.aspx?cat_id=" + Eval("cat_id") %>' Text='<%# Eval("cat_name") %>' runat="server"></asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
        </div>
    </div>
    <div style="clear: both"></div>
    <div class="row">
        <div class="col-md-4" runat="server" id="place3">
            <h2>
                <asp:Label runat="server" ID="titlu3"></asp:Label></h2>
            <asp:ListView runat="server" ID="box3">
                <ItemTemplate>
                    <div class="stireIndividual">
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <h4><asp:Label runat="server" Text='<%# Eval("titluStire") %>'></asp:Label></h4></asp:HyperLink>

                        <div class="meta">
                            by <strong>
                                <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label></strong> @
                            <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label>
                        </div>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <asp:Image runat="server" CssClass="adapt-width" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                        </asp:HyperLink>
                        <asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="col-md-4" runat="server" id="place4">
            <h2>
                <asp:Label runat="server" ID="titlu4"></asp:Label></h2>
            <asp:ListView runat="server" ID="box4">
                <ItemTemplate>
                    <div class="stireIndividual">
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <h4><asp:Label runat="server" Text='<%# Eval("titluStire") %>'></asp:Label></h4></asp:HyperLink>

                        <div class="meta">
                            by <strong>
                                <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label></strong> @
                            <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label>
                        </div>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <asp:Image runat="server" CssClass="adapt-width" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                        </asp:HyperLink>
                        <asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="col-md-4" runat="server" id="place5">
            <h2>
                <asp:Label runat="server" ID="titlu5"></asp:Label></h2>
            <asp:ListView runat="server" ID="box5">
                <ItemTemplate>
                    <div class="stireIndividual">
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <h4><asp:Label runat="server" Text='<%# Eval("titluStire") %>'></asp:Label></h4></asp:HyperLink>

                        <div class="meta">
                            by <strong>
                                <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label></strong> @
                            <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label>
                        </div>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "News.aspx?id=" + Eval("id") %>'>
                        <asp:Image runat="server" CssClass="adapt-width" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                        </asp:HyperLink>
                        <asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
