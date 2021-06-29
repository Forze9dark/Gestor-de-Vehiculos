using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Gestor_Vehicular.Model;
using Gestor_Vehicular.Utility;
using System.Threading;
using System.Threading.Tasks;

namespace Gestor_Vehicular.Account
{
    public partial class Drivers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["ID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }

            Garage_Controller.dropdownlist_fill(ddDriverList, Convert.ToInt32(HttpContext.Current.Session["ID"]));

        }

        protected void btnRegisterDriver_Click(object sender, EventArgs e)
        {

            using(DatabaseEntities db = new DatabaseEntities())
            {
                // Instance Driver Model and fill it with data
                Model.Drivers dr = new Model.Drivers();
                dr.FIRSTNAME = txtFirstname.Text;
                dr.LASTNAME = txtLastname.Text;
                dr.BIRTH = txtDateBirth.Text;
                dr.IDENTIFICATION = txtIdentification.Text;
                dr.PHONE = txtPhone.Text;
                dr.MOBILE = txtMobile.Text;
                dr.DRIVER_LICENSE = Convert.ToInt32(txtLicense.Value);

                if (fuPhotoDriver.HasFile)
                {
                    dr.IMG = fuPhotoDriver.FileName;
                    var path = Server.MapPath("Images/Driver/");
                    var filename = fuPhotoDriver.FileName;
                    fuPhotoDriver.SaveAs(path + filename);
                }

                HttpContext.Current.Session["process"] = "complete";

                string[] result = Garage_Controller.register_driver(dr);

                Response.Redirect("Drivers.aspx");

            }
        }

        protected void btnConsultDriver_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);

            get_driver(Convert.ToInt32(ddDriverList.SelectedValue));
        }

        private void get_driver(int idDriver)
        {

            using(DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from p in db.Drivers where p.ID == idDriver select p).First();

                imgDriverGet.ImageUrl = "~/Account/Images/Driver/" + query.IMG;
                fullNameDriverGet.Text = query.FIRSTNAME + ' ' + query.LASTNAME;
            
            }

            panelDataView.Visible = true;
            panelDataView2.Visible = true;
        }
    }
}