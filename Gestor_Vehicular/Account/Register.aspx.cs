using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gestor_Vehicular.Utility;

namespace Gestor_Vehicular.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/");
            }
        }

        protected void btnAcceptsTerm_OnClick(object sender, EventArgs e)
        {
            btnAcceptsTerm.Text = "Thanks for accepting!.";
            btnAcceptsTerm.Enabled = false;
            btnRegisterNewAccount.Enabled = true;
        }

        protected void btnRegisterNewAccount_OnClick(object sender, EventArgs e)
        {

            if (String.IsNullOrWhiteSpace(txtRUsername.Text) || String.IsNullOrWhiteSpace(txtREmail.Text) || String.IsNullOrWhiteSpace(txtRPassword.Text))
            {
                msg_error_register_title.Text = "Error, white space detected.";
                msg_error_register_message.Text = "You cannot leave blank spaces, fill in all the spaces.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripts", "$('.register-alert').show();", true);
                return;
            }

            if (txtRPassword.Text != txtRPasswordConfirm.Text)
            {
                msg_error_register_title.Text = "Error, Passwords do not match.";
                msg_error_register_message.Text = "Passwords must be the same. Check it out!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripts", "$('.register-alert').show();", true);
                return;
            }

            string[] if_exists_user = Login_Controller.users_exists(txtRUsername.Text, txtREmail.Text);

            if (if_exists_user == null)
            {

            }
            else
            {
                msg_error_register_title.Text = if_exists_user[1];
                msg_error_register_message.Text = if_exists_user[0];
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripts", "$('.register-alert').show();", true);
                return;
            }

            using (DatabaseEntities db = new DatabaseEntities())
            {
                
            }


            // Store data in list users type
            List<Users> get_users = new List<Users>()
            {
                new Users()
                {
                    USERNAME = txtRUsername.Text,
                    EMAIL = txtREmail.Text,
                    PASSWORD = txtRPassword.Text
                }
            };


        }
    }
}