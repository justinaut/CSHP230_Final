using CSHP230_Final.WebForms.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;

namespace CSHP230_Final.WebForms.Repository
{
    public class CourseRegistrationRepository
    {
        private string _connectionString;

        public CourseRegistrationRepository()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["AdvWebDevProject"].ConnectionString;
        }

        /// <summary>
        /// Purpose: Serve as a connection factory.
        /// </summary>
        /// <returns></returns>
        private OleDbConnection getConnection()
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = _connectionString;

            return connection;
        }

        /// <summary>
        /// Purpose: Gets a Student Id from a database given a login and password.
        ///         Returns true if database command was successful, false if failure.
        /// </summary>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <param name="studentId"></param>
        /// <returns></returns>
        public bool GetStudentIdFromLoginPassword(string login, string password, out int studentId)
        {
            studentId = 0;
            if (string.IsNullOrWhiteSpace(login) && string.IsNullOrWhiteSpace(password))
            {
                return false;
            }

            OleDbConnection connection = getConnection();
            connection.Open();
            bool successfulQuery = false;

            // Specify stored procedure to use
            OleDbCommand spCommand = new OleDbCommand("pSelLoginIdByLoginAndPassword", connection);
            spCommand.CommandType = System.Data.CommandType.StoredProcedure;

            // Set the StudentLogin input parameter
            OleDbParameter loginParameter = new OleDbParameter("@StudentLogin", OleDbType.VarWChar, 50);
            loginParameter.Direction = System.Data.ParameterDirection.Input;
            loginParameter.Value = login;
            spCommand.Parameters.Add(loginParameter);

            // Set the StudentPassword input parameter
            OleDbParameter passwordParameter = new OleDbParameter("@StudentPassword", OleDbType.VarWChar, 50);
            passwordParameter.Direction = System.Data.ParameterDirection.Input;
            passwordParameter.Value = password;
            spCommand.Parameters.Add(passwordParameter);

            // Set the StudentId output parameter
            OleDbParameter idOutputParameter = new OleDbParameter("@StudentId", OleDbType.Integer);
            idOutputParameter.Direction = System.Data.ParameterDirection.Output;
            idOutputParameter.DbType = System.Data.DbType.Int32;
            spCommand.Parameters.Add(idOutputParameter);

            using (connection)
            {
                try
                {
                    spCommand.ExecuteNonQuery();

                    successfulQuery = int.TryParse(spCommand.Parameters["@StudentId"].Value.ToString(), out studentId);
                }
                catch (Exception exception)
                {
                    Console.WriteLine("Exception: " + exception.Message);
                }
            }

            return successfulQuery;
        }

        /// <summary>
        /// Purpose: Gets a Student object from a given Student Id.
        ///         Returns true if database command was successful, false if failure.
        /// </summary>
        /// <param name="studentId"></param>
        /// <param name="student"></param>
        /// <returns></returns>
        public bool GetStudentFromId(int studentId, out Student student)
        {
            student = null;
            bool successfulQuery = false;

            OleDbConnection connection = getConnection();
            connection.Open();
            using (connection)
            {
                string sql = "SELECT StudentId, StudentName, StudentEmail, StudentLogin FROM vStudents WHERE StudentId = ?";
                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = sql;
                command.Parameters.Add("?", OleDbType.Integer).Value = studentId;

                try
                {
                    OleDbDataReader dataReader = command.ExecuteReader();
                    while (dataReader.Read() == true)
                    {
                        student = new Student();
                        student.StudentId = (int)dataReader["StudentId"];
                        student.StudentName = dataReader["StudentName"].ToString();
                        student.StudentEmail = dataReader["StudentEmail"].ToString();
                        student.StudentLogin = dataReader["StudentLogin"].ToString();
                        successfulQuery = true;
                    }
                    dataReader.Close();
                }
                catch (Exception exception)
                {
                    Console.WriteLine("Exception: " + exception.Message);
                }

                return successfulQuery;
            }
        }
    }
}