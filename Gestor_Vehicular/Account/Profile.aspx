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
                        <span class="pull-left"><strong>Drivers Register</strong></span> 125
                    </li>
                    <li class="list-group-item text-right">
                        <span class="pull-left"><strong>Cars Register</strong></span> 13
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
                                <label class="sr-only" for="inlineFormInputGroup">Username</label>
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
                                        <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                                    </div>
                                    <input type="email" class="form-control" value="<%: HttpContext.Current.Session["EMAIL"] %>" id="inlineFormInputGroup" placeholder="Email" required>
                                </div>
                            </div>
                            
                            <br />

                            <h6><i class="fas fa-key"></i> Change Password </h6>
                            <hr />
                            <div>
                                <label for="exampleInputEmail1">Current Password</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-key"></i></div>
                                    </div>
                                    <input type="password" class="form-control" id="inlineFormInputGroup" placeholder="Current Password">
                                </div>
                            </div>
                            
                            <div>
                                <label for="exampleInputEmail1">New Password</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-key"></i></div>
                                    </div>
                                    <input type="password" class="form-control" id="inlineFormInputGroup" placeholder="New Password">
                                </div>
                            </div>
                           
                            <button type="submit" class="btn btn-outline-primary"><i class="fas fa-save"></i> Actualizar perfil</button>
                        </div>

                        <div class="col col-md-6">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
