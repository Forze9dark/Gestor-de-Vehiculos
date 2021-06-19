using Gestor_Vehicular.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestor_Vehicular.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["ID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }

            cars_register.Text = Account_Controller.count_cars_register(Convert.ToInt32(HttpContext.Current.Session["ID"])).ToString();
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {

            if(!String.IsNullOrEmpty(txtNewPassword.Text) || !String.IsNullOrEmpty(txtOldPassword.Text))
            {
                int id = Convert.ToInt32(HttpContext.Current.Session["ID"]);

                var change_password_process = Account_Controller.changePassword(txtOldPassword.Text, txtNewPassword.Text, id);

                if (change_password_process[0] != "false")
                {
                    msg_update_message.Text = change_password_process[1];
                } else
                {
                    msg_update_message.Text = change_password_process[1];
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripts", "$('.update-profile-alert').show();", true);

            }

        }
    }
}