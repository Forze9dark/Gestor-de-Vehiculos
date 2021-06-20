<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Garage.aspx.cs" Inherits="Gestor_Vehicular.Account.Garage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="display-4"><i class="fas fa-car"></i> Garage Manager </h1> 
    <a class="btn btn-primary" data-toggle="modal" data-target="#modalRegisterVehicle"><i class="fas fa-plus"></i> Add new Vehicle</a>
    <a class="btn btn-primary" data-toggle="modal" data-target="#modalRegisterDriver"><i class="fas fa-plus"></i> Add new Driver</a>

    <div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
              <asp:Image CssClass="bd-placeholder-img card-img-top" width="100%" height="225" ImageUrl="https://images.pexels.com/photos/4141962/pexels-photo-4141962.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" runat="server" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
                  <button type="button" class="btn btn-sm btn-outline-danger">Delete</button>
                </div>
                <small class="text-muted">Asignado</small>
              </div>
            </div>
          </div>
        </div>


      </div>
    </div>
  </div>



    <!-- Modal Register New Vehicle -->
    <div class="modal fade" id="modalRegisterVehicle" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Register New Vehicle</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          
              <form>
                  <div class="row">
                      <div class="col col-md-6">
                          <asp:Image ID="imgUploadPreview" ImageUrl="~/Account/Images/avatar_none.png" CssClass="avatar img-circle img-thumbnail"  runat="server" />
                          <label for="validationTooltip01">Vehicle Photo</label>
                          <asp:FileUpload ID="VRimageUpload" CssClass="form-control" runat="server"/>

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
                            <select class="custom-select">
                                <option value="0" selected>Select transmission type</option>
                                <option value="1">Automatic</option>
                                <option value="2">Mecanic</option>
                            </select>
                        </div>

                          <label for="validationTooltip01">Fuel</label>                      
                          <div class="input-group mb-2">
                            <div class="input-group-prepend">
                              <div class="input-group-text"><i class="fas fa-car"></i></div>
                            </div>
                                <select class="custom-select">
                                  <option value="0" selected>Select fuel type</option>
                                  <option value="1">Gasoline</option>
                                  <option value="2">Gas</option>
                                  <option value="3">Hybrid</option>
                                </select>
                          </div>

                          <label for="validationTooltip01">Vehicle Color</label>
                          <div class="input-group mb-2">
                            <div class="input-group-prepend">
                              <div class="input-group-text"><i class="fas fa-car"></i></div>
                            </div>
                              <asp:TextBox TextMode="Color" CssClass="form-control" runat="server" />
                          </div>


                          <label for="validationTooltip01">Inside Vehicle Color</label>
                          <div class="input-group mb-2">
                            <div class="input-group-prepend">
                              <div class="input-group-text"><i class="fas fa-car"></i></div>
                            </div>
                                <asp:TextBox TextMode="Color" CssClass="form-control" runat="server" />
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
                </form>

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
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            ...
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>



</asp:Content>
