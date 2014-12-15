<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditorPannel.aspx.cs" Inherits="EditorPannel" MasterPageFile="~/MasterPage.master" EnableEventValidation="true" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="alert alert-danger" role="alert" id="neautorizat" runat="server">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            Nu esti autorizat pentru a vedea aceasta parte a site-ului.
        </div>
    <div class="row" id="contentTabel" runat="server">
        <div class="col-md-4">
            <h2>Adauga o categorie noua</h2>
            <p>
                <asp:TextBox ID="numeCat" runat="server" Width="79%" CssClass="form-control pull-left"></asp:TextBox>
                <asp:Button CausesValidation="true" ID="insertCat" runat="server" OnClick="insertCat_Click" Text="Adauga" CssClass="left btn btn-default" ValidationGroup="singurel" />
            </p>
            <asp:RequiredFieldValidator ID="validCatNoua"  runat="server" ControlToValidate="numeCat"  ErrorMessage='<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Campul nu poate fi vid</div>' Display="Dynamic" ValidationGroup="singurel"></asp:RequiredFieldValidator>
            <div class="alert alert-success" role="alert" id="alertaSucces" runat="server">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only">Succes:</span>
                <asp:Label ID="output" runat="server"></asp:Label>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Categories] ([cat_name]) VALUES (@cat_name)" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [cat_name] = @cat_name WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="cat_name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="cat_name" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="categoriiGrid" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="114px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="cat_name" HeaderText="cat_name" SortExpression="cat_name" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#d53939" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </div>
        <div class="col-md-8">
            <h2>Adauga o stire noua</h2>
            <div class="row">
                <div class="col-md-6">
                    <p>Titlu stire:</p>
                    <asp:TextBox ID="titluStire" runat="server" CssClass="form-control"></asp:TextBox>
                    <p>Categorie:</p>
                    <asp:DropDownList ID="listaCat" runat="server" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="Id" CssClass="form-control">
                    </asp:DropDownList>
                    <p>Incarca o inagine</p>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    <asp:Button Style="margin-top: 25px;" ValidationGroup="titluCategorie" CausesValidation="true" ID="adaugastire" runat="server" Text="Adauga Stire noua" Width="252px" OnClick="adaugastire_Click" CssClass="btn btn-default" />

                </div>
                <div class="col-md-6">
                    <p>Continut stire</p>
                    <asp:TextBox ID="continutStire" runat="server" Height="240px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="alert alert-success" role="alert" id="stireOK" runat="server">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only">Succes:</span>
                Stirea a fost inserata.
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="titluCategorie"  Display="Dynamic" ErrorMessage='<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Stirea trebuie sa aiba un titlu.</div>' ControlToValidate="titluStire" ></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="titluCategorie" ControlToValidate="listaCat" Display="Dynamic" ErrorMessage='<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Alege o categorie</div>' ></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="titluCategorie" ControlToValidate="continutStire" Display="Dynamic" ErrorMessage='<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Continut nu pui?</div>' ></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="locPtStiri" id="locStiri" runat="server">
        <p>Alege o categorie de unde vrei sa vezi stiri</p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="Id" Width="196px" AutoPostBack="true" CssClass="form-control">
                    </asp:DropDownList>
       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" AllowSorting="True" CssClass="table">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="titlu" HeaderText="titlu" SortExpression="titlu" />
                            <asp:BoundField DataField="continut" HeaderText="continut" SortExpression="continut" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="publishDate" HeaderText="publishDate" SortExpression="publishDate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [titlu], [continut], [Id], [publishDate] FROM [Stiri] WHERE ([cat_id] = @cat_id) ORDER BY [publishDate] DESC" DeleteCommand="DELETE FROM [Stiri] WHERE [Id] = @Id" UpdateCommand="UPDATE Stiri SET titlu = @titlu, continut = @continut">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="cat_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="titlu" />
                            <asp:Parameter Name="continut" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
    </div>
    <%--<div>
    
        <div class="auto-style2">
            <em class="newStyle1"><strong>Aceasta este pagina de administrare la care au acces editorii.</strong></em><br />
            <br />
        </div>
        <table id="contentTabel" class="auto-style1" runat="server">
            <tr>
                <td class="auto-style3" colspan="2">Categorii</td>
                <td colspan="2">Adauga o categorie noua</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Categories] ([cat_name]) VALUES (@cat_name)" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [cat_name] = @cat_name WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="cat_name" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="cat_name" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="numeCat" runat="server" Width="187px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="insertCat" runat="server" OnClick="insertCat_Click" Text="Adauga" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:GridView ID="categoriiGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="114px">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="cat_name" HeaderText="cat_name" SortExpression="cat_name" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                </td>
                <td colspan="2">
                    <asp:Label ID="output" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4">
                    <h1 class="auto-style5"><em>Adauga o stire noua</em></h1>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    Alege o categorie pt a vedea stiri</td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="titluCategorie" ControlToValidate="titluStire" Display="Dynamic" ErrorMessage="Introduceti un titlu pentru stire" ForeColor="Red"></asp:RequiredFieldValidator>
                    Titlu</td>
                <td colspan="2">
                    <asp:TextBox ID="titluStire" runat="server" Width="243px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="Id" Height="19px" Width="196px" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="titluCategorie" ControlToValidate="listaCat" ErrorMessage="Alegeti o categorie pentru stire."></asp:RequiredFieldValidator>
                    Categorie</td>
                <td colspan="2">
                    <asp:DropDownList ID="listaCat" runat="server" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="Id" Height="16px" Width="249px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Width="196px" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="titlu" HeaderText="titlu" SortExpression="titlu" />
                            <asp:BoundField DataField="continut" HeaderText="continut" SortExpression="continut" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="publishDate" HeaderText="publishDate" SortExpression="publishDate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [titlu], [continut], [Id], [publishDate] FROM [Stiri] WHERE ([cat_id] = @cat_id) ORDER BY [publishDate] DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="cat_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="titluCategorie" ControlToValidate="continutStire" ErrorMessage="Zi ceva boss!"></asp:RequiredFieldValidator>
                    Continut</td>
                <td colspan="2">
                    <asp:TextBox ID="continutStire" runat="server" Height="246px" TextMode="MultiLine" Width="248px"></asp:TextBox>
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="251px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    &nbsp;</td>
                <td colspan="2">
                    <asp:Button ID="adaugastire" runat="server" Text="Adauga Stire noua" Width="252px" OnClick="adaugastire_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    
    </div>--%>
</asp:Content>
