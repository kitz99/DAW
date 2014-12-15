<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" MasterPageFile="~/MasterPage.master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="gresit" runat="server" class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Nume de utilizator sau parola gresite</div>
    <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Login</div>
           </div>

            <div style="padding-top: 30px" class="panel-body">
                <div id="loginform" class="form-horizontal">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <asp:TextBox ID="passsword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage='<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Usernname obligatoriu</div>' Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passsword" ErrorMessage='<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Eroare: </span>Parola obligatorie</div>' Display="Dynamic"></asp:RequiredFieldValidator>
                    <div style="margin-top: 10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                            <asp:Button ID="loginButton" runat="server" OnClick="loginButton_Click" Text="Login" CssClass="btn btn-success"/>
                       </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top: 15px; font-size: 85%">
                                Don't have an account! 
                                        <a href="Register.aspx">Sign Up Here</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
