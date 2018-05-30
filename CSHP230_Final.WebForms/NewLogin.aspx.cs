using CSHP230_Final.WebForms.Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
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
            NewOrReactivate_RadioButtonList.SelectedIndex = 0;
        }

        protected void RegistrationSubmit_Button_Click(object sender, EventArgs e)
        {
            string name = string.IsNullOrWhiteSpace(Name_Textbox.Text) ? "" : Name_Textbox.Text;
            string email = string.IsNullOrWhiteSpace(Email_Textbox.Text) ? "" : Email_Textbox.Text;
            string login = string.IsNullOrWhiteSpace(LoginName_Textbox.Text) ? "" : LoginName_Textbox.Text;
            string reason = string.IsNullOrWhiteSpace(Reason_Textbox.Text) ? "" : Reason_Textbox.Text;
            string newOrReactivate = string.IsNullOrWhiteSpace(NewOrReactivate_RadioButtonList.SelectedItem.Value) ? "" : NewOrReactivate_RadioButtonList.SelectedItem.Value;
            DateTime needDate = DateTime.MinValue;
            if (!DateTime.TryParse(DateNeeded_Textbox.Text, out needDate))
            {
                needDate = DateTime.Now;
            }

            if (!string.IsNullOrWhiteSpace(name)
                && !string.IsNullOrWhiteSpace(email)
                && !string.IsNullOrWhiteSpace(login)
                && !string.IsNullOrWhiteSpace(reason)
                && !string.IsNullOrWhiteSpace(newOrReactivate))
            {
                //SaveRegistrationInformation(name, email, login, reason, newOrReactivate, needDate);
                CourseRegistrationRepository repo = new CourseRegistrationRepository();
                int loginId;
                repo.SaveRegistrationData(name, email, login, reason, newOrReactivate, needDate, out loginId);
            }

            Response.Redirect("PostRegistration.aspx");
        }
    }
}