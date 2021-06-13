<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gestor_Vehicular.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="display-4 mb-4">Login in with you account</h1>
    

    <div class="container">
        <div class="row">
            <div class="col col-md-4">
                
                <%-- Error message for login forms --%>
                <div class="alert alert-danger alert-dismissible fade show login-alert" style="display:none;" role="alert">
                    <strong><asp:Label runat="server" ID="msg_error_login_title" Text="{msg_error_login_title}"></asp:Label></strong> <asp:Label runat="server" ID="msg_error_login_message" Text="{msg_error_login_message}"></asp:Label>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <asp:Login ID="loginUser" runat="server" OnAuthenticate="loginUser_Authenticate">
                    <LayoutTemplate>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-user"></i></div>
                                </div>
                                <asp:TextBox ID="Username" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Username" ErrorMessage="El email es obligatorio." ForeColor="red" ToolTip="El nombre de usuario es obligatorio." ValidationGroup="loginUser">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputPassword">Password</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                                </div>
                                <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ForeColor="red" ToolTip="La contraseña es obligatoria." ValidationGroup="loginUser">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        
                        <div class="form-group form-check mb-5">
                            <asp:CheckBox ID="RememberMe" CssClass="form-check-input" runat="server" Text="Remember me" />
                        </div>

                        <asp:Button ID="LoginButton" runat="server" CssClass="btn btn-primary mt-3" OnClick="LoginButton_OnClick" CommandName="btnLoginIn" Text="Login with this account" ValidationGroup="loginUser" />
                        <small id="emailHelp" class="form-text text-muted">If you are a new member, can register account <a href="#">Here.</a></small>
                    </LayoutTemplate>
                </asp:Login>
            </div>

            <div class="col col-md-8">
                <div class="alert alert-warning" role="alert">
                    <h4 class="alert-heading"><i class="fas fa-warehouse"></i> Well done!</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fermentum nibh ac mauris consectetur, nec volutpat orci dapibus. Donec vel erat sed orci placerat porta eget volutpat lacus. Proin venenatis ornare tempus. Etiam sagittis est eget molestie dapibus. Praesent ligula orci, tempus vitae varius eu, consequat et felis. Sed laoreet a odio aliquam semper. Nam iaculis vestibulum ipsum, in dapibus turpis fermentum vel. In nec mi quis erat interdum ullamcorper ut tincidunt lectus. Sed id viverra nunc, vel efficitur massa. Pellentesque elementum maximus metus in consectetur.</p>
                    <hr>
                    <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
                    
                </div>
            </div>
        </div>
    </div>

</asp:Content>
