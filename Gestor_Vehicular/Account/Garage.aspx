<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Garage.aspx.cs" Inherits="Gestor_Vehicular.Account.Garage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="display-4"><i class="fas fa-car"></i> Garage Manager</h1>

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



</asp:Content>
