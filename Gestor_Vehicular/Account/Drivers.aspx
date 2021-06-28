<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Drivers.aspx.cs" Inherits="Gestor_Vehicular.Account.Drivers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h1 class="display-4"><i class="fas fa-car"></i>Drivers Manager </h1>
    <a class="btn btn-primary" data-toggle="modal" data-target="#modalRegisterDriver"><i class="fas fa-plus"></i>Add new Driver</a>


    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row">

                <%foreach (var item in get_drivers_by_id(Convert.ToInt32(HttpContext.Current.Session["ID"])))
                    { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="Images/Vehicle/<%:item.IMG %>" class="bd-placeholder img card-img-top" style="width: 100%; height: 225px;" />
                        <div class="card-body">

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group"></div>
                                <small class="text-success font-weight-bold">Register No.#<%:item.ID %></small>
                            </div>

                            <h5 class="card-title"><i class="fas fa-car"></i><%: item.FIRSTNAME + ' ' + item.LASTNAME %></h5>

                            <ul class="list-group list-group-flush mb-3">
                                <li class="list-group-item"><i class="fas fa-phone-alt"></i><strong> PHONE:</strong> <%: item.PHONE %></li>
                                <li class="list-group-item"><i class="fas fa-mobile-alt"></i><strong> MOBILE:</strong> <%: item.MOBILE %></li>
                                <li class="list-group-item"><i class="fas fa-id-card"></i><strong> IDENTIFICATION:</strong> <%: item.IDENTIFICATION %></li>
                            </ul>

                            <%--<div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
                                    <% if (item.STATUS == 0)
                                        { %>
                                    <button type="button" id="btnShowModalSetDriver" class="btn btn-sm btn-outline-success" data-toggle="modal" data-target="#setDrivertoVehicle" data-driverID="<%: item.ID %>">Set Driver</button>
                                    <%}
                                        else
                                        { %>
                                    <button type="button" class="btn btn-sm btn-outline-success" data-toggle="modal" data-target="#setDrivertoVehicle" data-whatever="<%: item.ID %>">Driver Remove</button>

                                    <%} %>
                                    <button type="button" class="btn btn-sm btn-outline-danger" id="btnRemoveCars" runat="server">Remove</button>
                                </div>
                                <small class="text-success font-weight-bold"><%: (item.STATUS == 0) ? "Available" : "Assigned" %></small>
                            </div>--%>
                        </div>
                    </div>
                </div>

                <% } %>
            </div>
        </div>
    </div>


    <!-- Modal Register New Driver -->
    <div class="modal fade" id="modalRegisterDriver" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="container">
                        <div class="row">
                            <div class="col col-md-6">
                                <center>
                                    <asp:Image ID="Image1" ImageUrl="~/Account/Images/Vehicle/avatar_none.png" CssClass="avatar img-circle img-thumbnail" runat="server" />
                                </center>
                                <br />

                                <br />
                                <asp:FileUpload ID="fuPhotoDriver" CssClass="form-control" runat="server" />
                                <br />

                                <label for="validationTooltip01">Phone</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-phone-alt"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Phone" CssClass="form-control" ID="txtPhone" runat="server" />
                                </div>

                                <label for="validationTooltip01">Mobile</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-mobile-alt"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Mobile" CssClass="form-control" ID="txtMobile" runat="server" />
                                </div>
                            </div>

                            <div class="col col-md-6">

                                <label for="validationTooltip01">Firstname</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-user"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Firstname" CssClass="form-control" ID="txtFirstname" runat="server" />
                                </div>


                                <label for="validationTooltip01">Lastname</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-user"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Lastname" CssClass="form-control" ID="txtLastname" runat="server" />
                                </div>


                                <label for="validationTooltip01">Date of birth</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Date of birth" TextMode="Date" CssClass="form-control" ID="txtDateBirth" runat="server" />
                                </div>

                                <label for="validationTooltip01">Identification</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-id-badge"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Identification" CssClass="form-control" ID="txtIdentification" runat="server" />
                                </div>

                                <label for="validationTooltip01">Fuel</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <select class="custom-select" id="txtLicense" runat="server">
                                        <option value="00" selected>You have license?</option>
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <asp:Button Text="Register Driver" CssClass="btn btn-success" runat="server" ID="btnRegisterDriver" OnClick="btnRegisterDriver_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
