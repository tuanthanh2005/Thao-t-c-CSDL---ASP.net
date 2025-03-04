using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQL.Models
{
    public class KetQua
    {
        public int Id { set; get; }
        public string MaSV { set; get; }
        public string MaMH { set; get; }
        // theem ? để có giá trị null
        public float? Diem { set; get; }
        public string HoTenSV { set; get; }
    }
}