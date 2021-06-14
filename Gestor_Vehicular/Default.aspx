<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Gestor_Vehicular._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LoginView runat="server">
        
        <AnonymousTemplate>
            <div class="alert alert-warning" role="alert">
                <div class="row container">
                    <div class="col col-md-3">
                        <center>
                            <i class="fas fa-exclamation fa-10x"></i>
                            <i class="fas fa-car fa-10x"></i>
                        </center>
                    </div>
                    <div class="col col-md-9">
                        <h4 class="alert-heading">WELCOME TO THE PLATFORM</h4>
                        <p>In order to access our tools you must be a registered user, it is totally free. You automatically log in to the platform, all our tools that we have prepared for you will be enabled.</p>
                        <hr>
                        <p class="mb-0">It should be noted that as we update, the new functions will only be enabled for registered users.</p>
                    </div>
                </div>
            </div>
        </AnonymousTemplate>
        
        <LoggedInTemplate>

            <div class="jumbotron">
                <h1>ASP.NET</h1>
                <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
                <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
            </div>

        </LoggedInTemplate>
        
    </asp:LoginView>

</asp:Content>
