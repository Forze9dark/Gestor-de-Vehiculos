using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Gestor_Vehicular.Model
{
    public class Vehicles
    {

        public Vehicles()
        {
            IMG = "avatar_none.png";
            STATUS = 0;
        }

        public int ID { get; set; }
        public string BRAND { get; set; }
        public string MODEL { get; set; }
        public string YEAR { get; set; }
        public string DOORS { get; set; }
        public string TRANSMISSION { get; set; }
        public string FUEL { get; set; }
        public string COLOR { get; set; }
        public string INTERIOR_COLOR { get; set; }
        public string IMG { get; set; }
        public int ID_REGISTER_USER { get; set; }

        // User Register Vehicle
        public int USER_REGISTER_ID { get; set; }

        // 0 = disponible, 1 = in use
        public int STATUS { get; set; }

        // Driver id for this car
        public int ASSIGNER_DRIVER { get; set; }

        // Aditional Feacture
        public bool AIR_CONDITIONING { get; set; }
        public bool RADIO { get; set; }
        public bool USB { get; set; }

        // Specification
        public float MAX_FUEL { get; set; }
        public int CURRENT_KM { get; set; }

    }
}