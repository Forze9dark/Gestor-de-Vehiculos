using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gestor_Vehicular.Model
{
    public class Drivers
    {
        public Drivers()
        {
            DRIVER_LICENSE = 0;
            IMG = "avatar_none.png";
        }

        public int ID { get; set; }
        public string FIRSTNAME { get; set; }
        public string LASTNAME { get; set; }
        public string BIRTH { get; set; }
        public string IDENTIFICATION { get; set; }
        public string IMG { get; set; }

        // 0 = No, 1 = Yes
        public int DRIVER_LICENSE { get; set; }

        public string PHONE { get; set; }
        public string MOBILE { get; set; }
        public string IMAGE { get; set; }
    }
}