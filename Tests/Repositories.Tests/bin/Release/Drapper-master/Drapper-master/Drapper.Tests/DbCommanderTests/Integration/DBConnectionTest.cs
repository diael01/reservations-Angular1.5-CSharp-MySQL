using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
//using Repositories;
using Drapper;
using System.Collections.Generic;
//using Contracts.Models;
using Drapper.Tests.Common;

namespace Drapper.Tests.DbCommanderTests.Integration
{
    [TestClass]
    public class DBConnectionTest
    {
        [TestMethod]
        public void AATestDrapperConnection()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                MenuItemsRepository miRepo = new MenuItemsRepository(commander);
                IEnumerable<MenuItems> menuItems = miRepo.GetMenuItems();
                Assert.IsNotNull(menuItems);
            }
           
        }
    }
}
