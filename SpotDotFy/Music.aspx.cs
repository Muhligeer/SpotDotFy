using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpotDotFy
{
    public partial class Music : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListView1.DataBind();
        }

        //public IQueryable<Music> music_GetData()
        //{
        //    System.Configuration.Configuration configuration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
        //    System.Configuration.ConnectionStringSettings connString;
        //    connString = configuration.ConnectionStrings.ConnectionStrings["ConnectionString"];
        //    SqlConnection con = new SqlConnection();
        //    con.ConnectionString = connString.ToString();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;
        //    cmd.CommandText = "SELECT * FROM music WHERE Id = @albumID";
        //    cmd.Parameters.AddWithValue("albumID", lbAlbum.SelectedValue);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    GridView1.DataBind();
        //}
    }
}