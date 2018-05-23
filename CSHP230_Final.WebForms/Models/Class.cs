using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CSHP230_Final.WebForms.Models
{
    public class Class
    {
        public int ClassId { get; set; }
        public string ClassName { get; set; }
        public DateTime ClassDate { get; set; }
        public string ClassDescription { get; set; }
    }
}