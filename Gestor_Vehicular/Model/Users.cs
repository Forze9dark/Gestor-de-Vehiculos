using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gestor_Vehicular.Model
{
    public class Users
    {
        public int ID { get; set; }

        public string USERNAME { get; set; }

        public string EMAIL { get; set; }

        public string PASSWORD { get; set; }

        public int ROLES_ID { get; set; }

        public string ROLES_NAME { get; set; }
    }
}