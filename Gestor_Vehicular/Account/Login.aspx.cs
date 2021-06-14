using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Security;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gestor_Vehicular.Utility;

namespace Gestor_Vehicular.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/");
            }
        }

        protected void LoginButton_OnClick(object sender, EventArgs e)
        {
            // Checking if exists the user. (true = exists, false = dont exists)
            bool checking_credentials = Login_Controller.checking_credentials(loginUser.UserName, loginUser.Password);

            if (checking_credentials != false)
            {
                // Get all data for user login and constructing the session
                List<Users> data = Login_Controller.get_user_data(loginUser.UserName);

                if (loginUser.RememberMeSet != false)
                {
                    HttpContext.Current.Session["REMEMBER"] = data[0].EMAIL;
                    loginUser.UserNameLabelText = HttpContext.Current.Session["REMEMBER"].ToString();
                }

                // Construncting Session
                HttpContext.Current.Session["ID"] = data[0].ID;
                HttpContext.Current.Session["USERNAME"] = data[0].USERNAME;
                HttpContext.Current.Session["EMAIL"] = data[0].EMAIL;
                HttpContext.Current.Session["PASSWORD"] = data[0].PASSWORD;
                HttpContext.Current.Session["ROLES"] = Login_Controller.get_role_name(Convert.ToInt32(data[0].ROLES));


                FormsAuthentication.SetAuthCookie(data[0].ID.ToString(), true);
                Response.Redirect("~/");

            }
            else
            {
                msg_error_login_title.Text = "Credentials Error";
                msg_error_login_message.Text = "The data entered is wrong, or the user is not registered.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripts", "$('.login-alert').show();", true);
            }


        }

        protected void loginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //// Checking if exists the user. (true = exists, false = dont exists)
            //bool checking_credentials = Login_Controller.checking_credentials(loginUser.UserName, loginUser.Password);

            //if (checking_credentials != false)
            //{
            //    // Get all data for user login and constructing the session
            //    List<Users> data = Login_Controller.get_user_data(loginUser.UserName);

            //    if (loginUser.RememberMeSet != false)
            //    {
            //        HttpContext.Current.Session["REMEMBER"] = data[0].EMAIL;
            //        loginUser.UserNameLabelText = HttpContext.Current.Session["REMEMBER"].ToString();
            //    }

            //    // Construncting Session
            //    HttpContext.Current.Session["ID"] = data[0].ID;
            //    HttpContext.Current.Session["USERNAME"] = data[0].USERNAME;
            //    HttpContext.Current.Session["EMAIL"] = data[0].EMAIL;
            //    HttpContext.Current.Session["PASSWORD"] = data[0].PASSWORD;
            //    HttpContext.Current.Session["ROLES"] = Login_Controller.get_role_name(data[0].ROLES);


            //    e.Authenticated = true;
            //    Response.Redirect("~/");

            //}
        }
    }
}