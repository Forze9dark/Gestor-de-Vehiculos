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
            }
        }

        protected static List<Gestor_Vehicular.Drivers> get_drivers_by_id(int id)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from p in db.Drivers where p.ID_REGISTER_USER == id select p).ToList();

                return query;
            }
        }

    }
}