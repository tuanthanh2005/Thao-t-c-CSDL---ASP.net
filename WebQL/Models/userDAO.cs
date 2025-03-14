﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQL.Models
{
    public class userDAO
    {
        public bool ValidateUser(string username, string password)
        {
            bool isValid = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT pwd FROM users WHERE uname = @uname", conn);
            cmd.Parameters.AddWithValue("@uname", username);

            String pwd = (string)cmd.ExecuteScalar();
            if (pwd==null)
            {
                isValid = false;
            }
            else
            {
                isValid=string.Compare(pwd, password, false)==0;
            }
            return isValid;
        }
    }
}