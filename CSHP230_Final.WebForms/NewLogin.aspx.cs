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
                SaveRegistrationInformation(name, email, login, reason, newOrReactivate, needDate);
            }

            Response.Redirect("PostRegistration.aspx");
        }

        private void SaveRegistrationInformation(string name, string email, string login, string reason, string newOrReactivate, DateTime needDate)
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["AdvWebDevProject"].ConnectionString;
            connection.Open();

            OleDbCommand spCommand = new OleDbCommand("pInsLoginRequest", connection);
            spCommand.CommandType = System.Data.CommandType.StoredProcedure;

            OleDbParameter nameParameter = new OleDbParameter("@Name", OleDbType.VarWChar, 50);
            nameParameter.Direction = System.Data.ParameterDirection.Input;
            nameParameter.Value = name;
            spCommand.Parameters.Add(nameParameter);

            OleDbParameter emailParameter = new OleDbParameter("@EmailAddress", OleDbType.VarWChar, 50);
            emailParameter.Direction = System.Data.ParameterDirection.Input;
            emailParameter.Value = email;
            spCommand.Parameters.Add(emailParameter);

            OleDbParameter loginParameter = new OleDbParameter("@LoginName", OleDbType.VarWChar, 50);
            loginParameter.Direction = System.Data.ParameterDirection.Input;
            loginParameter.Value = login;
            spCommand.Parameters.Add(loginParameter);

            OleDbParameter reasonParameter = new OleDbParameter("@ReasonForAccess", OleDbType.VarWChar, 50);
            reasonParameter.Direction = System.Data.ParameterDirection.Input;
            reasonParameter.Value = reason;
            spCommand.Parameters.Add(reasonParameter);

            OleDbParameter newOrReactivateParameter = new OleDbParameter("@NewOrReactivate", OleDbType.VarWChar, 50);
            newOrReactivateParameter.Direction = System.Data.ParameterDirection.Input;
            newOrReactivateParameter.Value = newOrReactivate;
            spCommand.Parameters.Add(newOrReactivateParameter);

            OleDbParameter needDateParameter = new OleDbParameter("@DateNeededBy", OleDbType.DBDate);
            needDateParameter.Direction = System.Data.ParameterDirection.Input;
            needDateParameter.Value = needDate;
            spCommand.Parameters.Add(needDateParameter);

            using (connection)
            {
                try
                {
                    spCommand.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    Console.WriteLine("Exception: " + exception.Message);
                }
            }
        }
    }
}