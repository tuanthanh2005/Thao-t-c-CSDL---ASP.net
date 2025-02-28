using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
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
        public int Update(SinhVien sv)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update sinhvien set hosv=@hosv , tensv=@tensv ,gioitinh=@gioitinh," +
                "ngaysinh=@ngaysinh,noisinh=@noisinh,diachi=@diachi,makh=@makh  where masv=@masv", conn);
            cmd.Parameters.AddWithValue("@masv", sv.MaSV);
            cmd.Parameters.AddWithValue("@hosv", sv.HoSV);
            cmd.Parameters.AddWithValue("@tensv", sv.TenSV);
            cmd.Parameters.AddWithValue("@gioitinh", sv.GioiTinh);
            cmd.Parameters.AddWithValue("@ngaysinh", sv.NgaySinh);
            cmd.Parameters.AddWithValue("@noisinh", sv.NoiSinh);
            cmd.Parameters.AddWithValue("@diachi", sv.DiaChi);
            cmd.Parameters.AddWithValue("@makh", sv.MaKH);
            //3.thuc thi ket qua;

            return cmd.ExecuteNonQuery();
         }
        public int Delete(SinhVien sv)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("delete from sinhvien where masv=@masv", conn);

                    cmd.Parameters.AddWithValue("@masv", sv.MaSV);
                    return cmd.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
                return 0; // Trả về 0 nếu có lỗi xảy ra
            }
        }

    }

  }