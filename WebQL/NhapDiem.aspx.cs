using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQL.Models;

namespace WebQL
{
    public partial class NhapDiem : System.Web.UI.Page
    {
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btLuu_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < gvKetQua.Rows.Count; i++)
                {
                    // lấy id (datakeys) của dòng
                    int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                    float diem = float.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
                    kqDAO.Update(id, diem); 
                }
                Response.Write("<script> alert('Lưu Điểm thành Công </script>");
                }
                catch (Exception ex) {
                Response.Write("<script> alert('Lưu Điểm Thất Bại </script>");
            }
        }
    }
}