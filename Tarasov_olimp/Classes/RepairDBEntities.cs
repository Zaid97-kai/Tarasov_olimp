using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tarasov_olimp
{
    public partial class RepairDBEntities : DbContext
    {

        private static RepairDBEntities _context;
        public static RepairDBEntities GetContext()
        {
            if (_context == null)
            {
                _context = new RepairDBEntities();
            }
            return _context;
        }
    }
}
