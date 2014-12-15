<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" MasterPageFile="~/MasterPage.master"  EnableEventValidation="true"%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:ListView runat="server" ID="listaCuStire">
            <ItemTemplate>
                <div class="col-md-6">
                    <h2>
                        <asp:Label runat="server" ID="titluStire" Text='<%# Eval("titluStire") %>'></asp:Label></h2>
                    <div class="meta">
                        <span>Autor:
                            <asp:Label runat="server" Text='<%# Eval("autor") %>'></asp:Label>
                        </span>
                        <span>Publish date:
                            <asp:Label runat="server" Text='<%# Eval("publishDate") %>'></asp:Label></span>
                    </div>
                    <asp:Image runat="server" ID="imagine" ImageUrl='<%# ("~/images/") + Eval("imagine")%>' AlternateText="IMAGINE" />
                    <p class="excerpt">
                        <asp:Label runat="server" Text='<%# Eval("content") %>'></asp:Label></p>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="sursaComentarii" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [username], [continut], [pubDate], [avatarAutor] FROM [Comentarii] WHERE ([newsID] = @newsID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="newsID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-md-6">
            <div class="comments">
                <asp:ListView runat="server" ID="listaComentarii" DataSourceID="sursaComentarii">
                    <ItemTemplate>
                        <div class="row comentariu">
                            <div class="col-md-2">
                                <asp:Image runat="server" ImageUrl='<%# "~/avatars/" + Eval("avatarAutor") %>' CssClass="avatarComment" />
                            </div>
                            <div class="col-md-10">
                                by <strong>
                                    <asp:Label runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                </strong>@ 
                <asp:Label runat="server" Text='<%# Eval("pubDate") %>'></asp:Label><br />
                                <asp:Label runat="server" Text='<%# Eval("continut") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div class="comment-box" runat="server" id="commBox">
                <div class="comment-text">
                    <asp:TextBox CssClass="form-control modificat" ID="commentContent" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="comment-button">
                    <asp:Button CssClass="btn btn-default buton-comm" ID="submitComment" runat="server" OnClick="submitComment_Click" Text="Trimite Comentariu" />
                </div>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
