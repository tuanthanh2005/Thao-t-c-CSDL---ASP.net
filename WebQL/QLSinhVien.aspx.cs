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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
           
         
            }
        }
    }
}
//        private void LienKetDuLieuLuoiSinhVien()
//        {
//            gvSinhvien.DataSource = svDao.getAll();
//            gvSinhvien.DataBind();
//        }
//        protected void btThem_Click(object sender, EventArgs e)
//        {
//            //thu thap thong tin sinh vien
//            string masv = txtMaSV.Text;
//            string hosv = txtHoSv.Text;
//            string tensv = txtTenSV.Text;
//            Boolean gioitinh = rdNam.Checked ? true : false;
//            DateTime ngaysinh = DateTime.Parse(txtNgaysinh.Text);
//            string noisinh = txtNoiSinh.Text;
//            string diachi = txtDiaChi.Text;

//            string makh = ddlMaKhoa.SelectedValue;
//            //them sinh vien vao CSDL
//            svDao.Insert(masv, hosv, tensv, gioitinh, ngaysinh, noisinh, diachi, makh);
//            //lien ket lai du lieu cho gvSinhVien
//            LienKetDuLieuLuoiSinhVien();
//        }
//    }
//}