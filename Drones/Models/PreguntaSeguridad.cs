using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Drones.Models
{
    public class PreguntaSeguridad
    {

        public static string connectionString = "Server=GENESIS;Database=Drones;Integrated Security=True;";

        public int PreguntaID { get; set; }
        public string Pregunta { get; set; }

    }
}