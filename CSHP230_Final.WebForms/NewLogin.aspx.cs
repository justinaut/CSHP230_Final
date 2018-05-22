using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSHP230_Final.WebForms
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegistrationSubmit_Button_Click(object sender, EventArgs e)
        {
            string name = string.IsNullOrWhiteSpace(Name_Textbox.Text) ? "" : Name_Textbox.Text;
            string email = string.IsNullOrWhiteSpace(Email_Textbox.Text) ? "" : Email_Textbox.Text;
            string login = string.IsNullOrWhiteSpace(LoginName_Textbox.Text) ? "" : LoginName_Textbox.Text;
            string reason = string.IsNullOrWhiteSpace(Reason_Textbox.Text) ? "" : Reason_Textbox.Text;

            if (!string.IsNullOrWhiteSpace(name)
                && !string.IsNullOrWhiteSpace(email)
                && !string.IsNullOrWhiteSpace(login)
                && !string.IsNullOrWhiteSpace(reason))
            {
                SaveRegistrationInformation(name, email, login, reason);
            }

            Response.Redirect("PostRegistration.aspx");
        }

        private void SaveRegistrationInformation(string name, string email, string login, string reason)
        {
            try
            {
                // Do SQL
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
            }
        }
    }
}