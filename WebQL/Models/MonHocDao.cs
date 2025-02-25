using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;// cho phpes lập trình sử dụng thư viện kết nối server d
using System.Configuration;
using System.Net.Sockets;
namespace WebQL.Models
{
    public class MonHocDao
    {
      // đọc all các môn học
        public List<MonHoc> getAll()
        {
         List<MonHoc> ds = new List<MonHoc>();
            // kết nối database
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from monhoc", conn);
             SqlDataReader rd = cmd.ExecuteReader();
            // dùng vòng lặp để lấy ra

            while (rd.Read())
            {
                ds.Add(new MonHoc
                {
                    MaMH = rd["mamh"].ToString(),
                    TenMH = rd["tenmh"].ToString(),
                    SoTiet = int.Parse(rd["sotiet"].ToString())
                });
                
            }
            return ds;
        }
      //cập nhật môn học 
        public int Update(MonHoc mh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update monhoc set tenmh=@tenmh , sotiet=@sotiet where mamh=@mamh", conn);
            cmd.Parameters.AddWithValue("@tenmh", mh.TenMH);
            cmd.Parameters.AddWithValue("@sotiet", mh.SoTiet);
            cmd.Parameters.AddWithValue("@makh", mh.MaMH);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        // xóa môn học 
        public int Delete(string mamh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            
                conn.Open();

                // Xóa dữ liệu trong bảng KetQua trước
                SqlCommand cmd1 = new SqlCommand("DELETE FROM KetQua WHERE MAMH = @mamh", conn);
                cmd1.Parameters.AddWithValue("@mamh", mamh);
                cmd1.ExecuteNonQuery();

                // Sau khi xóa dữ liệu liên quan, mới xóa môn học
                SqlCommand cmd2 = new SqlCommand("DELETE FROM monhoc WHERE mamh = @mamh", conn);
                cmd2.Parameters.AddWithValue("@mamh", mamh);
                return cmd2.ExecuteNonQuery(); 
            }



        // thêm môn học
        public int Insert(MonHoc mh)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString))
            {
                conn.Open();
                string query = "INSERT INTO monhoc (mamh, tenmh, sotiet) VALUES (@mamh, @tenmh, @sotiet)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@mamh", mh.MaMH);
                    cmd.Parameters.AddWithValue("@tenmh", mh.TenMH);
                    cmd.Parameters.AddWithValue("@sotiet", mh.SoTiet);
                    return cmd.ExecuteNonQuery();
                }
            }
        }


        // lấy thông tin 1 môn học
    }
}