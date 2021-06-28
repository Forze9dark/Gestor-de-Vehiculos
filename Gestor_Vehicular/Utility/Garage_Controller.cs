using Gestor_Vehicular.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Gestor_Vehicular.Utility
{
    public class Garage_Controller
    {

        /// <summary>
        /// Register a new vehicle in database with login user id
        /// </summary>
        /// <param name="current"></param>
        public static string[] register_vehicle(Vehicles current)
        {
            try
            {
                // Data Array
                string[] data = new string[2];

                using (DatabaseEntities db = new DatabaseEntities())
                {

                    db.Cars.Add(new Cars {
                        ID = current.ID,
                        BRAND = current.BRAND,
                        MODEL = current.MODEL,
                        YEAR = current.YEAR,
                        DOORS = current.DOORS,
                        TRANSMISSION = current.TRANSMISSION,
                        FUEL = current.FUEL,
                        COLOR = current.COLOR,
                        INTERIOR_COLOR =  current.INTERIOR_COLOR,
                        IMG_VEHICLE = current.IMG,
                        STATUS = current.STATUS,
                        ASSIGNER_DRIVER = current.ASSIGNER_DRIVER,
                        ID_REGISTER_USER = current.ID_REGISTER_USER
                    });
                    db.SaveChanges();
                }

                data[0] = "success";
                data[1] = "Vehicle Register successfull";

                return data;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        /// <summary>
        /// Get all car register filter by user ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        protected static List<Cars> get_all_vehicle_by_id(int id)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from p in db.Cars where p.ID_REGISTER_USER == id select p).ToList();

                return query;
            }
        }


        /// <summary>
        /// Register new Driver in Database but dont have cars assign
        /// </summary>
        /// <param name="current"></param>
        /// <returns></returns>
        public static string[] register_driver(Model.Drivers current)
        {
            try
            {
                // Data array
                string[] data = new string[2];
                Model.Drivers dr = new Model.Drivers();

                using (DatabaseEntities db = new DatabaseEntities())
                {
                    db.Drivers.Add(new Drivers
                    {
                        FIRSTNAME = current.FIRSTNAME,
                        LASTNAME = current.LASTNAME,
                        DATE_OF_BIRTH = current.BIRTH,
                        IDENTIFICATION = current.IDENTIFICATION,
                        DRIVERS_LICENSE = current.DRIVER_LICENSE,
                        PHONE = current.PHONE,
                        MOBILE = current.MOBILE,
                        IMG = dr.IMG,
                        ID_REGISTER_USER = Convert.ToInt32(HttpContext.Current.Session["ID"])
                    });

                    db.SaveChanges();
                }

                data[0] = "success";
                data[1] = "Driver Register successfull";

                return data;

            }
            catch (Exception ex)
            {

                throw ex;
            }



        }


        /// <summary>
        /// Fill Dropdown with Drivers Datas register by account id
        /// </summary>
        /// <param name="dp"></param>
        /// <param name="dr"></param>
        public static void dropdownlist_fill(DropDownList dp, List<Drivers> dr)
        {
            dp.DataTextField = "Firstname";
            dp.DataValueField = "ID";
            dp.DataSource = dr;
            dp.DataBind();
        }


        /// <summary>
        /// Assign driver to car by id.
        /// </summary>
        /// <param name="driver_id"></param>
        /// <param name="car_id"></param>
        /// <returns></returns>
        public static string[] assign_driver_to_car(int driver_id, int car_id)
        {
            // Instance of data return
            string[] data = new string[2];

            using (DatabaseEntities db = new DatabaseEntities())
            {
                Cars _car = db.Cars.First(i => i.ID == car_id);

                _car.ASSIGNER_DRIVER = driver_id;
                _car.STATUS = 1;

                db.SaveChanges();

                data[0] = "success";
                data[1] = "Assign Complete!";

            }

            return data;
        }

    }
}