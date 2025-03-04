using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using WebQLDaoTao.Models;

namespace WebQL.Models
{
    public class KetQuaDAO
    {
        //--------doc danh sach cac kết quả theo mã môn học trong CSDL-----------------
        public List<KetQua> getAll()
        {
            List<KetQua> dsKetQua = new List<KetQua>();
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_Constr1"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("select * from ketqua", conn);
            
            //3.thuc thi ket qua;
            SqlDataReader rd = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            while (rd.Read())
            {
                //tao doi tuong ketqua
                KetQua kq = new KetQua();
                kq.Id = int.Parse(rd["Id"].ToString());
                kq.MaSV = rd["Masv"].ToString();
                kq.MaMH = rd["mamh"].ToString();
                kq.Diem = string.IsNullOrEmpty(rd["diem"].ToString()) ? 0 : float.Parse(rd["diem"].ToString()); 
 
                //add vao list
                dsKetQua.Add(kq);
            }
            return dsKetQua;
        }
      
    }
}