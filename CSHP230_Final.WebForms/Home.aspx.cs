﻿using CSHP230_Final.WebForms.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSHP230_Final.WebForms
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                Student student = ((Student)Session["LoggedInUser"]);
                ViewState["UserLoggedIn"] = "y";
                ViewState["StudentName"] = student.StudentName;
            }
            else
            {
                ViewState["UserLoggedIn"] = "n";
            }
        }
    }
}