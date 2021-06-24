<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Garage.aspx.cs" Inherits="Gestor_Vehicular.Account.Garage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="display-4"><i class="fas fa-car"></i>Garage Manager </h1>
    <a class="btn btn-primary" data-toggle="modal" data-target="#modalRegisterVehicle"><i class="fas fa-plus"></i>Add new Vehicle</a>
    <a class="btn btn-primary" data-toggle="modal" data-target="#modalRegisterDriver"><i class="fas fa-plus"></i>Add new Driver</a>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row">

                <%foreach (var item in get_cars_by_id(Convert.ToInt32(HttpContext.Current.Session["ID"])))
                    {%>

                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="Images/Vehicle/<%:item.IMG_VEHICLE %>" class="bd-placeholder img card-img-top" style="width: 100%; height: 225px;" />
                        <div class="card-body">

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group"></div>
                                <small class="text-success font-weight-bold">Register No.#<%: item.ID %></small>
                            </div>

                            <h5 class="card-title"><i class="fas fa-car"></i> <%: item.BRAND + ' ' + item.MODEL %></h5>

                            <ul class="list-group list-group-flush mb-3">
                                <li class="list-group-item"><i class="fas fa-gas-pump"></i><strong> FUEL:</strong> <%: item.FUEL %></li>
                                <li class="list-group-item"><i class="fas fa-car"></i><strong> TRANSMISSION:</strong> <%: item.TRANSMISSION %></li>
                                <li class="list-group-item"><i class="fas fa-car"></i><strong> YEAR:</strong> <%: item.YEAR %></li>
                            </ul>

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
                                    <button type="button" class="btn btn-sm btn-outline-success">Set Driver</button>
                                    <button type="button" class="btn btn-sm btn-outline-danger" id="<%: item.ID %>">Remove</button>
                                </div>
                                <small class="text-success font-weight-bold"><%: (item.STATUS == 0) ? "Available" : "Assigned" %></small>
                            </div>
                        </div>
                    </div>
                </div>

                <% } %>
            </div>
        </div>
    </div>



    <!-- Modal Register New Vehicle -->
    <div class="modal fade" id="modalRegisterVehicle" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Register New Vehicle</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="container">
                        <div class="row">
                            <div class="col col-md-6">
                                <center>
                                    <asp:Image ID="imgUploadPreview" ImageUrl="~/Account/Images/Vehicle/avatar_none.png" CssClass="avatar img-circle img-thumbnail" runat="server" />
                                </center>
                                <br />
                                <asp:FileUpload ID="VRimageUpload" CssClass="form-control" runat="server" />
                                <br />

                                <label for="validationTooltip01">Brand</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Brand" CssClass="form-control" ID="txtRVBrand" runat="server" />
                                </div>

                                <label for="validationTooltip01">Model</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Model" CssClass="form-control" ID="txtRVModel" runat="server" />
                                </div>

                            </div>

                            <div class="col col-md-6">

                                <label for="validationTooltip01">Door</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Doors" TextMode="Number" CssClass="form-control" ID="txtRVDoors" runat="server" />
                                </div>

                                <label for="validationTooltip01">Transmission</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <select class="custom-select" id="selTransmissionType" runat="server">
                                        <option value="0" selected>Select transmission type</option>
                                        <option value="Automatic">Automatic</option>
                                        <option value="Mecanic">Mecanic</option>
                                    </select>
                                </div>

                                <label for="validationTooltip01">Fuel</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <select class="custom-select" id="selFuel" runat="server">
                                        <option value="0" selected>Select fuel type</option>
                                        <option value="Gasoline">Gasoline</option>
                                        <option value="Gas">Gas</option>
                                        <option value="Hybrid">Hybrid</option>
                                    </select>
                                </div>

                                <label for="validationTooltip01">Vehicle Color</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <asp:TextBox TextMode="Color" ID="selColorOutVehicle" CssClass="form-control" runat="server" />
                                </div>


                                <label for="validationTooltip01">Inside Vehicle Color</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <asp:TextBox TextMode="Color" ID="selColorInVehicle" CssClass="form-control" runat="server" />
                                </div>

                                <label for="validationTooltip01">Year</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-car"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Year" TextMode="Number" CssClass="form-control" ID="txtRVYear" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <asp:Button Text="Register Vehicle" CssClass="btn btn-success" OnClick="btnRegisterVehicle_Click" ID="btnRegisterVehicle" runat="server" />
                </div>
            </div>
        </div>
    </div>



    <!-- Modal Register New Driver -->
    <div class="modal fade" id="modalRegisterDriver" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
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
                                    <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                <br />
                                
                                <label for="validationTooltip01">Phone</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-phone-alt"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Phone" CssClass="form-control" ID="TextBox5" runat="server" />
                                </div>

                                <label for="validationTooltip01">Mobile</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-mobile-alt"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Mobile" CssClass="form-control" ID="TextBox6" runat="server" />
                                </div>
                            </div>

                            <div class="col col-md-6">

                                <label for="validationTooltip01">Firstname</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-user"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Firstname" CssClass="form-control" ID="TextBox1" runat="server" />
                                </div>


                                <label for="validationTooltip01">Lastname</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-user"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="Lastname" CssClass="form-control" ID="TextBox3" runat="server" />
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
                                    <asp:TextBox placeholder="Identification" CssClass="form-control" ID="TextBox2" runat="server" />
                                </div>

                                <label for="validationTooltip01">License</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="far fa-id-card"></i></div>
                                    </div>
                                    <asp:TextBox placeholder="License" CssClass="form-control" ID="TextBox4" runat="server" />
                                </div>

                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
