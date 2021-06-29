<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Drivers.aspx.cs" Inherits="Gestor_Vehicular.Account.Drivers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script type="text/javascript">

        function successalert() {
            let timerInterval
            Swal.fire({
                title: 'Getting data from driver...',
                timer: 3500,
                timerProgressBar: true,
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        const content = Swal.getHtmlContainer()
                        if (content) {
                            const b = content.querySelector('b')
                            if (b) {
                                b.textContent = Swal.getTimerLeft()
                            }
                        }
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            }).then((result) => {
                /* Read more about handling dismissals below */
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log('I was closed by the timer')
                }
            })
        }

    </script>

    <h1 class="display-4"><i class="fas fa-car"></i>Drivers Manager </h1>
    <a class="btn btn-primary" data-toggle="modal" data-target="#modalRegisterDriver"><i class="fas fa-plus"></i>Add new Driver</a>


    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row">

                <div class="col col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <label><i class="fas fa-user"></i><strong>Select a Driver:</strong></label>
                            <asp:DropDownList ID="ddDriverList" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                            <asp:Button Text="Consult Driver" ID="btnConsultDriver" OnClick="btnConsultDriver_Click" CssClass="btn btn-outline-primary mt-3" Width="100%" runat="server" />
                        </div>
                    </div>
                </div>


                <!-- Panel -->
                <asp:Panel runat="server" ID="panelDataView" CssClass="col col-md-6" Visible="false">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-5">
                                <asp:Image ImageUrl="Images/Driver/avatar_none.png" Width="200" Height="250" ID="imgDriverGet" runat="server" />
                            </div>
                            <div class="col-md-7">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <asp:Label Text="{GetFullName}" ID="fullNameDriverGet" runat="server" /></h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!-- Actions -->
                <asp:Panel ID="panelDataView2" Visible="false" CssClass="col col-md-2" runat="server">
                    <div style="width: 100%">
                        <button class="btn btn-success mb-2"><i class="fas fa-money-bill-alt"></i></button>
                        <br />
                        <button class="btn btn-success mb-2"><i class="fas fa-wallet"></i></button>
                        <br />
                        <button class="btn btn-warning mb-2"><i class="fas fa-edit"></i></button>
                        <br />
                        <button class="btn btn-danger mb-2"><i class="fas fa-ban"></i></button>
                    </div>
                </asp:Panel>
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
                                    <asp:Image ID="Image1" ImageUrl="~/Account/Images/Driver/avatar_none.png" CssClass="avatar img-circle img-thumbnail" runat="server" />
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
