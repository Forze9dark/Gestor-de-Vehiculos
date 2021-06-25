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
            driver_license = 0;
            img = "avatar_none.png";
        }

        public int id { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string birth { get; set; }
        public string identification { get; set; }
        public string img { get; set; }

        // 0 = No, 1 = Yes
        public int driver_license { get; set; }

        public string phone { get; set; }
        public string mobile { get; set; }
        public string image { get; set; }
    }
}