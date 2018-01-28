using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Drapper;
//using Contracts.Models;

namespace Drapper.Tests.DbCommanderTests.Integration
{
    public class MenuItems
    {
        public int Id { get; set; }
        public string MenuItem { get; set; }
    }

    public class MenuItemsRepository
    {
        IDbCommander dbCommander;
        public MenuItemsRepository(IDbCommander _dbC)
        {
            dbCommander = _dbC;
        }

        public IEnumerable<MenuItems> GetMenuItems()
        {
            return dbCommander.Query<MenuItems>();
        }
    }
}
