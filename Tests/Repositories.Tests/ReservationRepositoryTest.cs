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
    public class ReservationRepositoryTest
    {
        [TestMethod]
        public void CreateReservationTest()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                ReservationsRepository resRepo = new ReservationsRepository(commander);
                Reservation res = new Reservation();

                res.Id = 0;
                res.CourtId = 2;
                res.PriceId = 0;
                res.UserId = 1;
                res.StatusId = 2;
                res.Comments = "test reservation create";
                DateTime dt = DateTime.Now;
                res.StartTime = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour+1, 0, 0);

                res.EndTime = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour + 2, 0, 0);
                
                res.FacilityId = 2;
                res.PlayersNo = 4;
                res.SlotNo = 5;

                Reservation re1 = resRepo.CreateReservation(res);
                Reservation re2 = resRepo.GetReservationBySlotAndCourt(5,2);
                Assert.AreEqual(re1.Id, re2.Id);
                
            }

        }

        [TestMethod]
        public void UpdateReservationTest()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                ReservationsRepository resRepo = new ReservationsRepository(commander);
                Reservation res = new Reservation();
                res.Id = 0;
                res.CourtId = 10;
                res.PriceId = 0;
                res.UserId = 1;
                res.StatusId = 2;
                res.Comments = "test reservation update";
                DateTime dt = DateTime.Now;
                res.StartTime = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour + 1, 0, 0);
                res.EndTime = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour + 2, 0, 0);
                res.FacilityId = 1;
                res.PlayersNo = 4;
                Reservation re1 = resRepo.CreateReservation(res);
                res.Comments = "test reservation update1";
                res.CourtId = 11;               
                res.PlayersNo = 2;
                res.SlotNo = 10;
                Reservation r1 = resRepo.UpdateReservation(re1.Id, re1);
                List<Reservation> re2 = resRepo.GetReservationById(re1.Id);
                Assert.AreEqual(re1.Id, re2[0].Id);
            }

        }

        [TestMethod]
        public void DeleteReservationTest()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                ReservationsRepository resRepo = new ReservationsRepository(commander);
                Reservation res = new Reservation();
                res.Id = 0;
                res.CourtId = 3;
                res.PriceId = 0;
                res.UserId = 1;
                res.StatusId = 2;
                res.Comments = "test reservation delete";
                DateTime dt = DateTime.Now;

                res.FacilityId = 1;
                res.PlayersNo = 2;
                res.SlotNo = 1;
                Reservation re1 = resRepo.CreateReservation(res);
                
               
                resRepo.DeleteReservation(re1.Id);
                List<Reservation> re2 = resRepo.GetReservationsByCourtId(re1.Id);
                Assert.AreEqual(re2.Count, 0);
            }

        }


        [TestMethod]
        public void GetReservationBySlotAndCourtTest()
        {
            using (var commander = CommanderHelper.CreateCommander())
            {
                ReservationsRepository resRepo = new ReservationsRepository(commander);
                Reservation res = new Reservation();

                res.Id = 0;
                res.CourtId = 3;
                res.PriceId = 0;
                res.UserId = 1;
                res.StatusId = 2;
                res.Comments = "test reservation create";
                DateTime dt = DateTime.Now;
                res.StartTime = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour + 1, 0, 0);
                res.EndTime = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour + 2, 0, 0);
                res.FacilityId = 2;
                res.PlayersNo = 4;
                res.SlotNo = 5;

                Reservation re1 = resRepo.CreateReservation(res);
                Reservation res1= resRepo.GetReservationBySlotAndCourt(5, 3);
                Assert.IsNotNull(res);

            }

        }
    }
}
