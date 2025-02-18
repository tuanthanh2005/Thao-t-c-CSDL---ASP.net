using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQL.Models
{
    public class KhoaDAO
    {
        // đọc all các khoa
        public List<Khoa> getAll()
        {
            List<Khoa> ds = new List<Khoa>();
            // kết nối database
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Khoa", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            // dùng vòng lặp để lấy ra

            while (rd.Read())
            {
                ds.Add(new Khoa
                {
                    MaKH = rd["makh"].ToString(),
                    TenKH = rd["tenkh"].ToString(),
                    
                });

            }
            return ds;
        }
        //cập nhật môn học 
        public int Update(Khoa mk)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update Khoa set tenkh=@tenkh  where makh=@makh", conn);
            cmd.Parameters.AddWithValue("@tenkh", mk.TenKH);
            cmd.Parameters.AddWithValue("@makh", mk.MaKH);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        // xóa môn học 
        public int Delete(Khoa kh)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("delete from Khoa where makh=@makh", conn);
                   
                        cmd.Parameters.AddWithValue("@makh", kh.MaKH);
                        return cmd.ExecuteNonQuery();
                    
                }
            }
            catch (Exception ex)
            {
                return 0; // Trả về 0 nếu có lỗi xảy ra
            }
        }




        // thêm môn học
        public int Insert(Khoa mk)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString))
            {
                conn.Open();
                string query = "INSERT INTO Khoa (makh, tenkh) VALUES (@makh, @tenkh)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@makh", mk.MaKH);
                    cmd.Parameters.AddWithValue("@tenkh", mk.TenKH);
                    return cmd.ExecuteNonQuery();
                }
            }
        }
    }
}