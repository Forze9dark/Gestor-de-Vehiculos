using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Gestor_Vehicular.Account
{
    public partial class Garage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["ID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void btnRegisterVehicle_Click(object sender, EventArgs e)
        {
            if (VRimageUpload.HasFile)
            {
                string path_save = $"~/Account/Images/temp{VRimageUpload.FileName}";
                VRimageUpload.PostedFile.SaveAs(Server.MapPath(path_save));

                imgUploadPreview.ImageUrl = $"Images/temp/{VRimageUpload.FileName}";

                return;
            }
        }
    }
}