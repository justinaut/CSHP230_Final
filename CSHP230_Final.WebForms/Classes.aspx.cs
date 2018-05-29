using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSHP230_Final.WebForms.Models;

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
            var classes = new List<Class>();

            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["AdvWebDevProject"].ConnectionString;
            connection.Open();
            using (connection)
            {
                string sql = "SELECT ClassId, ClassName, ClassDate, ClassDescription FROM vClasses";
                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = sql;

                try
                {
                    OleDbDataReader dataReader = command.ExecuteReader();
                    while (dataReader.Read() == true)
                    {
                        var classy = new Class();
                        classy.ClassId = (int)dataReader["ClassId"];
                        classy.ClassName = dataReader["ClassName"].ToString();
                        classy.ClassDate = dataReader.GetDateTime(dataReader.GetOrdinal("ClassDate"));
                        classy.ClassDescription = dataReader["ClassDescription"].ToString();
                        classes.Add(classy);
                    }
                    dataReader.Close();
                }
                catch (Exception exception)
                {
                    Console.WriteLine("Exception: " + exception.Message);
                }
            }

            return classes;
        }
    }
}