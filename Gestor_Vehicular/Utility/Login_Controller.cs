using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.EntitySql;
using System.Linq;
using System.Net.Sockets;
using System.Threading;
using System.Web;
using Microsoft.Ajax.Utilities;

namespace Gestor_Vehicular.Utility
{
    public class Login_Controller
    {

        public static bool checking_credentials(string email, string password)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                // Checking for black fields
                if (String.IsNullOrWhiteSpace(email) || String.IsNullOrWhiteSpace(password))
                {
                    return false;
                }

                // Query to database
                var query = (from u in db.Users where u.EMAIL == email && u.PASSWORD == password select u).Count();

                if (query != 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public static List<Users> get_user_data(string email)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from u in db.Users where u.EMAIL == email select u).First();

                List<Users> data = new List<Users>()
                {
                    new Users()
                    {
                        ID = query.ID,
                        USERNAME = query.USERNAME,
                        EMAIL = query.EMAIL,
                        PASSWORD = query.PASSWORD,
                        ROLES = query.ROLES
                    }
                };

                return data;
            }
        }

        public static string get_role_name(int id)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from r in db.Roles where r.ID == id select r).First();

                return query.NAME;
            }
        }

        public static string[] users_exists(string username, string email)
        {
            string[] data;

            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query_username = (from p in db.Users where p.USERNAME == username select p).Count();
                var query_email = (from p in db.Users where p.EMAIL == email select p).Count();

                if (query_email == 1 && query_username == 1)
                {
                    data = new[]
                    {
                        "The username and email already exists on the platform.",
                        "Error, Username and email exists",
                        "true"
                    };
                    return data;
                }

                if (query_username == 1)
                {
                    data = new[]
                    {
                        "The username already exists on the platform.",
                        "Error, Username exists",
                        "true"
                    };
                    return data;
                }

                if (query_email == 1)
                {
                    data = new[]
                    {
                        "The email already exists on the platform.",
                        "Error, Email exists!",
                        "true"
                    };
                    return data;
                }

                data = null;

                return data;
            }
        }
    }
}