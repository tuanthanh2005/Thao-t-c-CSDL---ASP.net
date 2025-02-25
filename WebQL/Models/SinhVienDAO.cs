using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebQLDaoTao.Models;

namespace WebQL.Models
{
    public class SinhVienDAO
    {
        //phuong thuc them sinh vien vao CSDL
      
        //get all
        public List<SinhVien> getAll()
        {
            List<SinhVien> ds = new List<SinhVien>();
            // kết nối database
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from sinhvien", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            while (rd.Read())
            {
                //tao doi tuong sinhvien
                SinhVien sv = new SinhVien
                {
                    MaSV = rd["MaSV"].ToString(),
                    HoSV = rd["HoSV"].ToString(),
                    TenSV = rd["TenSV"].ToString(),
                    GioiTinh = Boolean.Parse(rd["GioiTinh"].ToString()),
                    NgaySinh = DateTime.Parse(rd["NgaySinh"].ToString()),
                    NoiSinh = rd["noisinh"].ToString(),
                    DiaChi = rd["diachi"].ToString(),
                    MaKH = rd["makh"].ToString()
                };

                //add vao dsSinhVien
                ds.Add(sv);  


            }
            return ds;
        }
        //.....
    }
}