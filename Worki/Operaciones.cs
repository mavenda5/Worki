using DataLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Worki
{
    internal class Operaciones
    {
        private Datos datos { get; set; }

        public Operaciones()
        {
            datos = Datos.GetInstance();
            datos.ActualizarConexion(Properties.Settings.Default.Server,
                Properties.Settings.Default.InitialCatalog,
                Properties.Settings.Default.UserID,
                Properties.Settings.Default.Password,
                Properties.Settings.Default.Others);
        }

        public bool ValidarVerdaderoFalso(string comando, SqlParameter[] sqlParameters = null)
        {
            bool r = false;
            r = Convert.ToBoolean(datos.TraeDatos(comando, sqlParameters).Rows[0].ItemArray[0]);
            return r;
        }
    }
}
