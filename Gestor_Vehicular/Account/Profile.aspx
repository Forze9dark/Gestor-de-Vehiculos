<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Gestor_Vehicular.Account.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 class="display-4 mb-4"><%: HttpContext.Current.Session["USERNAME"] %> Profile.</h3>
    <hr />
    <br />
    
    <div class="container">
        <div class="row">
  		    <div class="col-sm-3">
                <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                </div>
                <hr />
                <ul class="list-group">
                    <li class="list-group-item text-muted">
                        User Statistics <i class="fas fa-car fa-1x"></i>
                    </li>
                    <li class="list-group-item text-right">
                        <span class="pull-left"><strong>Drivers Register => </strong></span> <asp:Label ID="drivers_register" runat="server" />
                    </li>
                    <li class="list-group-item text-right">
                        <span class="pull-left"><strong>Cars Register => </strong></span> <asp:Label ID="cars_register" runat="server" />
                    </li>
                </ul>
  		    </div>
            
            <div class="col col-md-9">
                <div class="container">
                    <div class="row">
                        <div class="col col-md-6">
                            <div>
                                <h6><i class="fas fa-user"></i> User Information </h6>
                                <hr />

                                <label for="exampleInputEmail1">Username</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-user"></i></div>
                                    </div>
                                    <input type="text" class="form-control is-invalid" id="validationServer01" value="<%: HttpContext.Current.Session["USERNAME"] %>" disabled>
                                    <div class="invalid-feedback">
                                    The username if verifique and cant change!
                                  </div>
                                </div>
                            </div>

                            
                            <div>

                                <label for="exampleInputEmail1">Email</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-user"></i></div>
                                    </div>
                                    <input type="email" class="form-control is-invalid" id="validationServer01" value="<%: HttpContext.Current.Session["EMAIL"] %>" disabled>
                                    <div class="invalid-feedback">
                                    The username if verifique and cant change!
                                  </div>
                                </div>
                            </div>
                            
                            <br />
                            
                            <h6><i class="fas fa-key"></i> Change Password </h6>
                            <hr />

                            <!-- Message Box, (error and success) -->

                            <div class="alert alert-warning  alert-dismissible fade show update-profile-alert" style="display: none;" role="alert">
                                <asp:Label runat="server" ID="msg_update_message" Text="{msg_update_message}"></asp:Label>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div>
                                <label for="exampleInputEmail1">Current Password</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-key"></i></div>
                                    </div>
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtOldPassword" placeholder="Current Password" />

                                </div>
                            </div>
                            
                            <div>
                                <label for="exampleInputEmail1">New Password</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-key"></i></div>
                                    </div>
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtNewPassword" placeholder="New Password" />
                                </div>
                            </div>
                            <br />
                            <asp:Button ID="btnUpdateProfile" CssClass="btn btn-outline-primary" Text="Actualizar Perfil" OnClick="btnUpdateProfile_Click" runat="server" />
                        </div>

                        <div class="col col-md-6">
                            <!-- Aditional information soon -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
