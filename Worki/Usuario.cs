using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Worki
{
    public class Usuario
    {
        Operaciones operaciones = new Operaciones();

        public bool validarLogin(string userName, string passwordSHA512)
        {
            SqlParameter[] sqlParameters = new SqlParameter[] {
                new SqlParameter("@userName", userName),
                new SqlParameter("@Password", passwordSHA512)
            };
            return operaciones.ValidarVerdaderoFalso("spValidarLogin", sqlParameters);
        }
    }
}
