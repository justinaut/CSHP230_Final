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
    public partial class WebForm4 : System.Web.UI.Page
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
        public List<Class> ClassList { get { return GetAllClasses(); } }
        public List<int> RegisteredClassIds { get { return GetRegisteredClassIds(); } }

        private List<Class> GetAllClasses()
        {
            // TODO: Have this method called once per request. It's called three times.
            CourseRegistrationRepository repo = new CourseRegistrationRepository();
            List<Class> classes;
            repo.GetAllClasses(out classes);
            return classes;
        }

        private List<int> GetRegisteredClassIds()
        {
            List<int> ids = new List<int>();
            int loggedInStudentId;
            if (Session["LoggedInUser"] == null)
            {
                return ids;
            }

            Student student = ((Student)Session["LoggedInUser"]);
            loggedInStudentId = student.StudentId;

            CourseRegistrationRepository repo = new CourseRegistrationRepository();
            repo.GetRegisteredClassIds(loggedInStudentId, out ids);
            return ids;
        }

        protected void Register_Button_Click(object sender, EventArgs e)
        {
            string classIdAsString = RegisterClass_Textbox.Text;
            int classId;

            if (int.TryParse(classIdAsString, out classId))
            {
                if (RegisteredClassIds.Contains(classId))
                {
                    Feedback_Label.Text = "It appears you have already registered for that class.";
                    Feedback_Label.CssClass = "feedback-text-attention";
                }
                else
                {
                    Student student = ((Student)Session["LoggedInUser"]);
                    CourseRegistrationRepository repo = new CourseRegistrationRepository();
                    if (repo.RegisterClassForStudentId(classId, student.StudentId))
                    {
                        Feedback_Label.Text = "Congrats! You have registered for the class.";
                        Feedback_Label.CssClass = "feedback-text-success";
                    }
                    else
                    {
                        Feedback_Label.Text = "Something went wrong -- please try again later.";
                        Feedback_Label.CssClass = "feedback-text-attention";
                    }
                }
            }
            else
            {
                Feedback_Label.Text = "Something went wrong -- Class ID needs to be a number.";
                Feedback_Label.CssClass = "feedback-text-attention";
            }
        }
    }
}