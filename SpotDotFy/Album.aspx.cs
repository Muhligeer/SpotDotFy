using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpotDotFy
{
    public partial class Album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            System.Configuration.Configuration configuration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            System.Configuration.ConnectionStringSettings connString;
            connString = configuration.ConnectionStrings.ConnectionStrings["ConnectionString"];
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connString.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Insert into album (album_title, release_date, artist_name, genre_id) values (@title, @release, @artist, @genre)";
            cmd.Parameters.AddWithValue("title", txbTitle.Text);
            cmd.Parameters.AddWithValue("release", cldRelease.SelectedDate);
            cmd.Parameters.AddWithValue("artist", txbArtist.Text);
            cmd.Parameters.AddWithValue("genre", lsbGenre.SelectedItem.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
        }
    }
}