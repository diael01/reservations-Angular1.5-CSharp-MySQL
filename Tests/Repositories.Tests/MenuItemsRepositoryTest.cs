using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repositories;
using Drapper;
using System.Collections.Generic;
using Contracts.Models;
using Drapper.Tests.Common;
using Reservations.Repositories;

namespace Repositories.Tests
{
    [TestClass]
    public class MenuItemsRepositoryTest
    {
        [TestMethod]
        public void MenuItemsRepositoryGetItemsTest()
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
