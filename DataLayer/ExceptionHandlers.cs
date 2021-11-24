using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{

    [Serializable]
    public class ConnectionStringVoidException : Exception
    {
        public ConnectionStringVoidException() { }
        public ConnectionStringVoidException(string message) : base(message) { }
        public ConnectionStringVoidException(string message, Exception inner) : base(message, inner) { }
        protected ConnectionStringVoidException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }
}
