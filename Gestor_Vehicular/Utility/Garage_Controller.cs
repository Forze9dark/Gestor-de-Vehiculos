using Gestor_Vehicular.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

        protected static List<Cars> get_all_vehicle_by_id(int id)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from p in db.Cars where p.ID_REGISTER_USER == id select p).ToList();

                return query;
            }
        }

    }
}