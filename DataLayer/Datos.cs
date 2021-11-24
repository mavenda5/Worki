using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public sealed class Datos
    {
        private static Datos _instancia;
        private string _cadenaConexion;
        private Datos() { }

        public static Datos GetInstance()
        {
            if (_instancia == null)
                _instancia = new Datos();
            return _instancia;
        }

        /// <summary>
        /// Permite la creación de la cadena de conexión. Metodo inseguro.
        /// </summary>
        /// <param name="server">servidor</param>
        /// <param name="initialCatalog">BD inicial.</param>
        /// <param name="user">Usuario de BD</param>
        /// <param name="password">Contraseña de usuario de BD.</param>
        /// <param name="aditionalOptions">Otros parámetros para la cadena de conexión.</param>
        public void ActualizarConexion(string server, string initialCatalog, string user, string password, string aditionalOptions)
        {
            //Server=tcp:mavendano.database.windows.net,1433;Initial Catalog=SALESDB;Persist Security Info=False;User ID=mavendano;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
            _cadenaConexion = "Server=" + server +
                ";Initial Catalog=" + initialCatalog +
                ";User ID=" + user + ";Persist Security Info=False;Password=" + password + ";" + aditionalOptions;
        }

        /// <summary>
        /// Consulta a la base de datos y trae un <see cref="DataTable"/> con los resultados.
        /// </summary>
        /// <param name="query">Nombre del procedimiento almacenado</param>
        /// <param name="sqlParameter">Listado de parámetros requeridos por el procedimiento almacenado.</param>
        /// <returns>Set de resultados como <see cref="DataTable"/></returns>
        public DataTable TraeDatos(string query, SqlParameter[] sqlParameter = null)
        {
            if (_cadenaConexion == null)
                throw new ConnectionStringVoidException("No se ha definido una cadena de conexión válida.");

            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(_cadenaConexion))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    connection.Open();
                    if (sqlParameter != null)
                        command.Parameters.AddRange(sqlParameter);

                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
                catch (Exception)
                {
                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }
            return dt;
        }

        /// <summary>
        /// Consulta a la base de datos pero no retorna ningún set de resultados.
        /// </summary>
        /// <param name="query">Nombre del procedimiento almacenado</param>
        /// <param name="sqlParameter">Listado de parámetros requeridos por el procedimiento almacenado.</param>
        public void GuardarDatos(string query, SqlParameter[] sqlParameter = null) => TraeDatos(query, sqlParameter);
    }
}
