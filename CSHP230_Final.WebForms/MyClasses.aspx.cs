using CSHP230_Final.WebForms.App_Code;
using CSHP230_Final.WebForms.Models;
using CSHP230_Final.WebForms.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSHP230_Final.WebForms
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                Student student = ((Student)Session["LoggedInUser"]);
                ViewState["UserLoggedIn"] = "y";
                ViewState["StudentName"] = student.StudentName;
                ViewState["StudentLogin"] = student.StudentLogin;
                ViewState["StudentEmail"] = student.StudentEmail;
                Title = "User Page";
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        public List<Class> ClassList { get { return GetClassesByStudentId(); } }

        private List<Class> GetClassesByStudentId()
        {
            // TODO: Have this method called once per request. It's called three times.
            if (Session["LoggedInUser"] == null)
            {
                return null;
            }

            int studentId;
            studentId = ((Student)Session["LoggedInUser"]).StudentId;
            CourseRegistrationRepository repo = new CourseRegistrationRepository();
            List<Class> classes;
            repo.GetClassesByStudentId(studentId, out classes);
            return classes;
        }
    }
}