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
    public class FacilitiesRepositoryTest
    {
        [TestMethod]
        public void FacilitiesRepositoryGetAllTest()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                FacilitiesRepository facilRepo = new FacilitiesRepository(commander);
                IEnumerable<Facility> facilItems = facilRepo.GetFacilities();
                List<Facility> lFacil = (List < Facility >) facilItems;
                Assert.IsTrue(lFacil.Count > 0);
                Assert.IsNotNull(facilItems);
            }
           
        }

        [TestMethod]
        public void FacilitiesRepositoryGetBySearchCriteriaTest()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                FacilitiesRepository facilRepo = new FacilitiesRepository(commander);
                List<Facility> items = facilRepo.GetFacilitiesBySearchCriteria("Jersey");
                Assert.IsTrue(items.Count >= 0);
            }

        }
    }
}
