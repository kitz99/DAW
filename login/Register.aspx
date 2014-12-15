<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="_Default"  MasterPageFile="~/MasterPage.master"%>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <h1>Inregistrare pe site</h1>
        <div class="col-md-6">
            <div class="form-group col-lg-12">
					<label>Nume de utilizator</label>
                    <asp:TextBox  CssClass="form-control" ID="username" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" CssClass="auto-style5" ErrorMessage="Insert username"></asp:RequiredFieldValidator>
		   </div>
            <div class="form-group col-lg-6">
					<label>Parola</label>
                    <asp:TextBox ID="passwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passwd" CssClass="auto-style5" ErrorMessage="insert pass"></asp:RequiredFieldValidator>
		    </div>

            <div class="form-group col-lg-6">
					<label>Repeta parola</label>
					<asp:TextBox ID="cpasswd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cpasswd" CssClass="auto-style5" ErrorMessage="confirm pass"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwd" ControlToValidate="cpasswd" CssClass="auto-style5" ErrorMessage="password are not the same"></asp:CompareValidator>
				</div>
            <div class="form-group col-lg-6">
					<label>Adresa de email</label>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" CssClass="auto-style5" ErrorMessage="Insert email"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Not a email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
				</div>
            <div class="form-group col-lg-6">
                <label>Alege un rol</label>
                <asp:DropDownList ID="listatari" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Select a role"></asp:ListItem>
                        <asp:ListItem Value="editor"></asp:ListItem>
                        <asp:ListItem Value="normal">normal</asp:ListItem>
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="listatari" CssClass="auto-style5" ErrorMessage="Alege un rol" InitialValue="Select Country"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group col-lg-12">
                <label>Alege un avatar</label>
                <asp:FileUpload runat="server" ID="avatar" CssClass="form-control"/>
            </div>
        </div>
        <div class="col-md-6">
            <h2>Termeni si conditii</h2>
            <p>Prin inregistrarea pe acest site va dati acordul scris pentru prelucrarea datelor cu caracter personal in scopuri necomerciale.</p>
            <p>Va asumati regulile de utilizare si va angajati sa respectati aceste reguli.</p>
            <p>Va angajati sa folositi un limbaj adecvat, care sa nu jigneasca membrii si sa aiba caracter relevant.</p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" CssClass="btn btn-default" />
        </div>
    </div>
    <%--<div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Username</td>
                <td class="auto-style4">
                    <asp:TextBox ID="username" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email</td>
                <td class="auto-style4">
                    <asp:TextBox ID="email" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" CssClass="auto-style5" ErrorMessage="Insert email"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Not a email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td class="auto-style4">
                    <asp:TextBox ID="passwd" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passwd" CssClass="auto-style5" ErrorMessage="insert pass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Confirm Password</td>
                <td class="auto-style4">
                    <asp:TextBox ID="cpasswd" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cpasswd" CssClass="auto-style5" ErrorMessage="confirm pass"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwd" ControlToValidate="cpasswd" CssClass="auto-style5" ErrorMessage="password are not the same"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Select a role</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="listatari" runat="server" Width="250px">
                        <asp:ListItem Value="Select a role"></asp:ListItem>
                        <asp:ListItem Value="editor"></asp:ListItem>
                        <asp:ListItem Value="normal">normal</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="listatari" CssClass="auto-style5" ErrorMessage="Alege un rol" InitialValue="Select Country"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>--%>
</asp:Content>