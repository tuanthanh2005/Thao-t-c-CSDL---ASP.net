using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQL.Models;
using WebQLDaoTao.Models;

namespace WebQL
{
    public partial class QLSinhVien : System.Web.UI.Page
    {
        SinhVienDAO svDao = new SinhVienDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


            }
        }

        protected void btShowForm_Click(object sender, EventArgs e)
        {



        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            string masv = txtMaSV.Text;
            string hosv = txtHoSv.Text;
            string tensv = txtTenSV.Text;
            bool gioitinh = rdNam.Checked ? true : false;
            DateTime ngaysinh = DateTime.Parse(txtNgaysinh.Text);
            string noisinh = txtNoiSinh.Text;
            string diachi = txtDiaChi.Text;
            string makh = ddlMaKhoa.SelectedValue;

            SinhVien sv = new SinhVien()
            {
                MaSV = masv,
                HoSV = hosv,
                TenSV = tensv,
                GioiTinh = gioitinh,
                NgaySinh = ngaysinh,
                NoiSinh = noisinh,
                DiaChi = diachi,
                MaKH = makh,
            };
            svDao.Insert(sv);
            gvSinhVien.DataBind();
        }

    }
    
}