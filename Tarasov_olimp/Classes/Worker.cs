using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tarasov_olimp
{
    public partial class Worker
    {
        public string FullName
        {
            get
            {
                return Fname + " " + Sname + " " + Lname;
            }
        }
    }
}
