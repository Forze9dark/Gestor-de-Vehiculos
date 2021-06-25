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
    public partial class Garage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["ID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }

            Garage_Controller.dropdownlist_fill(DriverDropList, GetDriver(Convert.ToInt32(HttpContext.Current.Session["ID"])));

        }

        /// <summary>
        /// Get all drivers register by account id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        protected static List<Drivers> GetDriver(int account_id)
        {
            using(DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from p in db.Drivers where p.ID_REGISTER_USER == account_id select p).ToList();
                return query;
            }
        }

        protected static List<Cars> get_cars_by_id(int id)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from p in db.Cars where p.ID_REGISTER_USER == id select p).ToList();

                return query;
            }
        }

        protected void btnRegisterVehicle_Click(object sender, EventArgs e)
        {
            // Instance Vehicle Model and Fill it With Data
            Vehicles vh = new Vehicles();
            vh.BRAND = txtRVBrand.Text;
            vh.MODEL = txtRVModel.Text;
            vh.YEAR = txtRVYear.Text;
            vh.DOORS = txtRVDoors.Text;
            vh.TRANSMISSION = selTransmissionType.Value;
            vh.FUEL = selFuel.Value;
            vh.COLOR = selColorOutVehicle.Text;
            vh.INTERIOR_COLOR = selColorInVehicle.Text;
            vh.ID_REGISTER_USER = Convert.ToInt32(HttpContext.Current.Session["ID"]);

            if (VRimageUpload.HasFile)
            {
                vh.IMG = VRimageUpload.FileName;
                var path = Server.MapPath("Images/Vehicle/");
                var filename = VRimageUpload.FileName;
                VRimageUpload.SaveAs(path + filename);
            }

            string[] result = Garage_Controller.register_vehicle(vh);


        }

        protected void btnRegisterDriver_Click(object sender, EventArgs e)
        {

            // Instance Driver Model and fill it with data
            Drivers dr = new Drivers();
            dr.FIRSTNAME = txtFirstname.Text;
            dr.LASTNAME = txtLastname.Text;
            dr.DATE_OF_BIRTH = txtDateBirth.Text;
            dr.IDENTIFICATION = txtIdentification.Text;
            dr.PHONE = txtPhone.Text;
            dr.MOBILE = txtMobile.Text;
            dr.DRIVERS_LICENSE = Convert.ToInt32(txtLicense.Value);

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
}