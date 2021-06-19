using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gestor_Vehicular.Utility
{
    public class Account_Controller
    {
        /// <summary>
        /// Through this function you can make a password change successfully.
        /// </summary>
        /// <returns></returns>
        public static string[] changePassword(string oldPassword, string newPassword, int id)
        {
            string[] message = new string[2];

            if(!String.IsNullOrEmpty(oldPassword) || !String.IsNullOrEmpty(newPassword))
            {
                using (DatabaseEntities db = new DatabaseEntities())
                {
                    // Encrypted
                    string enc_password = Encrypted_Controller.Encriptar(oldPassword);

                    // Execute Query
                    var query = (from p in db.Users where p.ID == id select p).First();

                    // Decrypt
                    string decrypt_password = Encrypted_Controller.DesEncriptar(query.PASSWORD);

                    // Encrypte new password
                    string enc_new_password = Encrypted_Controller.Encriptar(newPassword);

                    if(decrypt_password == oldPassword)
                    {
                        Users _users = db.Users.First(i => i.ID == id);
                        _users.PASSWORD = enc_new_password;

                        db.SaveChanges();

                        // Return success message
                        message[0] = "success";
                        message[1] = "Password is changed";
                        return message; 


                    } else
                    {
                        message[0] = "error";
                        message[1] = "Passwords do not Match.";
                        return message;
                    }

                }
            }

            message[0] = "n/a";
            return message;
        }


        /// <summary>
        /// Returns the number of vehicles registered by a user.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static int count_cars_register(int id)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var query = (from c in db.Cars where c.ASSIGNER_DRIVER == id select c).Count();
                return query;
            }
        }

    }
}