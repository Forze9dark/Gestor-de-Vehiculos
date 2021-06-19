using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gestor_Vehicular.Model
{
    public class Vehicle
    {
        public int ID { get; set; }
        public string BRAND { get; set; }
        public string MODEL { get; set; }
        public string YEAR { get; set; }
        public string DOORS { get; set; }
        public string TRANSMISSION { get; set; }
        public string FUEL { get; set; }
        public string COLOR { get; set; }
        public string INTERIOR_COLOR { get; set; }

        // 0 = disponible, 1 = in use
        public int STATUS { get; set; }

        // Driver id for this car
        public int ASSIGNER_DRIVER { get; set; }

        // Other Feacture
        public bool AIR_CONDITIONING { get; set; }
        public bool RADIO { get; set; }
        public bool USB { get; set; }

    }
}