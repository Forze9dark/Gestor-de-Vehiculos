<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Gestor_Vehicular.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="display-4 mb-4">Register a new account.</h1>
    
    <%-- Error message for login forms --%>
    <div class="alert alert-danger alert-dismissible fade show register-alert" style="display:none;" role="alert">
        <strong><asp:Label runat="server" ID="msg_error_register_title" Text="{msg_error_register_title}"></asp:Label></strong> <asp:Label runat="server" ID="msg_error_register_message" Text="{msg_error_register_message}"></asp:Label>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class="container">
        <div class="row">
            <div class="col col-md-4">
                <div class="form-group">
                    <label for="exampleInputEmail1">Username</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-user"></i></div>
                        </div>
                        <asp:TextBox ID="txtRUsername" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                        </div>
                        <asp:TextBox ID="txtREmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="exampleInputEmail1">Password</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-key"></i></div>
                        </div>
                        <asp:TextBox ID="txtRPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="exampleInputEmail1">Confirm Password</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-key"></i></div>
                        </div>
                        <asp:TextBox ID="txtRPasswordConfirm" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <asp:Button runat="server" ID="btnRegisterNewAccount" CssClass="btn btn-primary" Text="Register new Account" OnClick="btnRegisterNewAccount_OnClick" Enabled="False"/>
                <small id="emailHelp" class="form-text text-muted">If you already have account, can <a href="Login.aspx">Login in.</a></small>
                
                

            </div>
            
            <div class="col col-md-8">

                <div class="alert alert-warning" role="alert">
                    <h4 class="alert-heading"><i class="fas fa-exclamation"></i> Let's clarify a few points before creating your account.</h4>
                    <p class="text-justify">By registering your account on the platform, you will have access to manage your vehicles and their respective drivers.

                        By having this service, you accept that all inconveniences with your vehicles are the responsibility of the person registering the account, thus discarding any responsibility for the vehicles that you register.</p>
                    <hr>
                    <p class="mb-0"><asp:Button runat="server" CssClass="btn btn-primary" ID="btnAcceptsTerm" OnClick="btnAcceptsTerm_OnClick" Text="I read and I accept" /> ☚ If you accept, click on this link to activate the button.</p>
                </div>

            </div>

        </div>
    </div>
    
    

</asp:Content>
