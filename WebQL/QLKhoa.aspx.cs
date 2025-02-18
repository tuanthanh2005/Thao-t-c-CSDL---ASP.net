using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQL.Models;

namespace WebQL
{
    public partial class QLKhoa : System.Web.UI.Page
    {
        KhoaDAO khoaDAO = new KhoaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btShowForm_Click(object sender, EventArgs e)
        {
            string makh = txtMaMH.Text;
            string tenkh = txtTenMH.Text;
            Khoa kh = new Khoa { MaKH = makh, TenKH = tenkh };
            khoaDAO.Insert(kh);
            gvKhoa.DataBind();
        }
    }
}