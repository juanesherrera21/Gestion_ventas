using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
//using Common.Cache;

namespace DataAccess
{
    public class UserDao : ConnectionToSql
    {
        public bool Login(string user, string pass)
        {
            using (var connection = GetConnection())
            {
                connection.Open();
                using (var command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "select *from Users where LoginName=@user and Password=@pass";
                    command.Parameters.AddWithValue("@user", user);
                    command.Parameters.AddWithValue("@pass", pass);
                    command.CommandType = CommandType.Text;
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                           // UserCache.IdUser = reader.GetInt32(0);
                            //UserCache.LoginName = reader.GetString(1);
                            //UserCache.Password = reader.GetString(2);
                            //UserCache.FirstName = reader.GetString(3);
                            //UserCache.LastName = reader.GetString(4);
                            //UserCache.Position = reader.GetString(5);
                            //UserCache.Email = reader.GetString(6);
                        }
                        return true;
                    }
                    else
                        return false;
                }
            }
        }
    }

}
