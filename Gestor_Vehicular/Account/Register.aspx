<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Gestor_Vehicular.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="display-4 mb-4">Register a new account.</h1>

    <div class="container">
        <div class="alert alert-primary" role="alert">
            A simple primary alert with <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
        </div>
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
                        <asp:TextBox ID="TextBox2" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="exampleInputEmail1">Password</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-key"></i></div>
                        </div>
                        <asp:TextBox ID="TextBox1" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="exampleInputEmail1">Confirm Password</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fas fa-key"></i></div>
                        </div>
                        <asp:TextBox ID="TextBox3" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <asp:Button runat="server" CssClass="btn btn-primary" Text="Register new Account"/>
                <small id="emailHelp" class="form-text text-muted">If you already have account, can <a href="Login.aspx">Login in.</a></small>
                
                

            </div>
            
            <div class="col col-md-8">
                
            </div>
        </div>
    </div>
    
    

</asp:Content>
