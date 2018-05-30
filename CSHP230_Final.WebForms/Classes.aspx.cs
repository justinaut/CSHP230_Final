using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSHP230_Final.WebForms.Models;
using CSHP230_Final.WebForms.Repository;

namespace CSHP230_Final.WebForms
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public List<Class> ClassList { get { return GetAllClasses(); } }

        private List<Class> GetAllClasses()
        {
            // TODO: Have this method called once per request. It's called three times.
            CourseRegistrationRepository repo = new CourseRegistrationRepository();
            List<Class> classes;
            repo.GetAllClasses(out classes);
            return classes;
        }
    }
}