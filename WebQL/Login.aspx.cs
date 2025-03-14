using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using WebQL.Models;

namespace WebQL
{
    public partial class Login : System.Web.UI.Page
    {
        userDAO uDAO= new userDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text;
            string passw = txtPassword.Text;
            if (uDAO.ValidateUser(username,passw))
            {
                FormsAuthentication.RedirectFromLoginPage(username, true); // true la co luu cookie hay khong
            }
            else
            {
                lblthongbao.Text = " Dang Nhap Khong Thanh Cong !";
            }
        }
    }
}