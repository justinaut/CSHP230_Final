using CSHP230_Final.WebForms.App_Code;
using CSHP230_Final.WebForms.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSHP230_Final.WebForms
{
    public partial class WebForm1 : System.Web.UI.Page
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
                ViewState["UserLoggedIn"] = "n";
            }
        }

        protected void Login_Button_Click(object sender, EventArgs e)
        {
            string login = LoginName_Textbox.Text;
            string password = Password_Textbox.Text;
            int id = 0;

            CourseRegistrationRepository repo = new CourseRegistrationRepository();
            if (repo.GetStudentIdFromLoginPassword(login, password, out id))
            {
                var student = new Student();
                if (repo.GetStudentFromId(id, out student))
                {
                    Session["LoggedInUser"] = student;
                }
            }

            Response.Redirect("Login.aspx");
        }
    }
}