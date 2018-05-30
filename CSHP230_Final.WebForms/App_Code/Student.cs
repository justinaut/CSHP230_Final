using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CSHP230_Final.WebForms.App_Code
{
    [Serializable]
    public class Student
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string StudentEmail { get; set; }
        public string StudentLogin { get; set; }
    }
}