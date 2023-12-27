using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TourismWeb.Models;

namespace TourismWeb.Controllers
{
    public class TourismController : Controller
    {
        private static Random random = new Random();

        private List<POI> GetPoisModel()
        {
            var pois = new List<POI>();

            var context = new TourismDBEntities();

            foreach (var item in context.tbl_POI)
            {
                pois.Add(new POI()
                {
                    Description = item.Description,
                    Domain = new Domain()
                    {
                        Id = item.tbl_TourismDomain.Id,
                        Name = item.tbl_TourismDomain.Name,
                        Title = item.tbl_TourismDomain.Title,
                    },
                    DomainId = item.DomainId,
                    Id = item.Id,
                    Name = item.Name,
                    Latitude = item.Latitude,
                    Longitude = item.Longitude,
                });
            }

            return pois;
        }

        public ActionResult Pois()
        {
            return View(GetPoisModel());
        }

        public ActionResult Ontology()
        {
            var context = new TourismDBEntities();
            return View(context.tbl_TourismDomainRelation.ToList());
        }

        public ActionResult Users()
        {
            var context = new TourismDBEntities();
            return View(context.tbl_User.ToList());
        }

        private AddPoi GetAddPoiModel(AddPoi currentModel)
        {
            AddPoi model = currentModel;
            if (model == null)
            {
                model = new Models.AddPoi();
            }

            List<Domain> domains = new List<Domain>();

            var context = new TourismDBEntities();
            foreach (var item in context.tbl_TourismDomain)
            {
                if (!context.tbl_TourismDomainRelation.Any(t => t.ParentId == item.Id))
                {
                    domains.Add(new Domain()
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Title = item.Title,
                    });
                }
            }

            model.Domains = domains;

            return model;
        }
        private EditPoi GetEditPoiModel(int id, EditPoi currentModel)
        {
            EditPoi model = currentModel;

            var context = new TourismDBEntities();

            if (model == null)
            {
                var poi = context.tbl_POI.FirstOrDefault(t => t.Id == id);
                model = new Models.EditPoi()
                {
                    Description = poi.Description,
                    Id = poi.Id,
                    DomainId = poi.DomainId,
                    Latitude = poi.Latitude,
                    Longitude = poi.Longitude,
                    Name = poi.Name,
                };
            }

            List<Domain> domains = new List<Domain>();

            foreach (var item in context.tbl_TourismDomain)
            {
                if (!context.tbl_TourismDomainRelation.Any(t => t.ParentId == item.Id))
                {
                    domains.Add(new Domain()
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Title = item.Title,
                    });
                }
            }

            model.Domains = domains;

            return model;

        }
        public ActionResult AddPoi()
        {
            return View(GetAddPoiModel(null));
        }
        [HttpPost]
        public ActionResult AddPoi(AddPoi model)
        {
            if (ModelState.IsValid)
            {
                var context = new TourismDBEntities();
                context.tbl_POI.Add(new tbl_POI()
                {
                    Description = model.Description,
                    DomainId = model.DomainId,
                    Latitude = model.Latitude,
                    Longitude = model.Longitude,
                    Name = model.Name,
                });

                context.SaveChanges();

                return RedirectToAction("Pois");
            }

            return View(GetAddPoiModel(model));
        }

        public ActionResult EditPoi(int id)
        {
            return View(GetEditPoiModel(id, null));
        }

        [HttpPost]
        public ActionResult EditPoi(EditPoi model)
        {
            if (ModelState.IsValid)
            {
                var context = new TourismDBEntities();

                var poi = context.tbl_POI.FirstOrDefault(t => t.Id == model.Id);

                poi.Description = model.Description;
                poi.DomainId = model.DomainId;
                poi.Latitude = model.Latitude;
                poi.Longitude = model.Longitude;
                poi.Name = model.Name;

                context.SaveChanges();
                AlertMessage(ViewMessageType.Success, "نقطه علاقه مندی با موفقیت ویرایش شد.");
                return RedirectToAction("EditPoi", new { id = model.Id });
            }

            return View(GetEditPoiModel(model.Id, model));
        }

        [HttpPost]
        public ActionResult DeletePoi(int id)
        {
            var context = new TourismDBEntities();
            var poi = context.tbl_POI.FirstOrDefault(t => t.Id == id);

            context.Entry(poi).State = System.Data.EntityState.Deleted;
            context.SaveChanges();

            return RedirectToAction("Pois");
        }

        [HttpPost]
        public ActionResult AddRandomPois()
        {
            var context = new TourismDBEntities();

            List<Domain> domains = new List<Domain>();

            foreach (var item in context.tbl_TourismDomain)
            {
                if (!context.tbl_TourismDomainRelation.Any(t => t.ParentId == item.Id))
                {
                    domains.Add(new Domain()
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Title = item.Title,
                    });
                }
            }

            for (int i = 0; i < 10; i++)
            {
                var randomDomain=domains.ElementAt(random.Next(domains.Count()));
                context.tbl_POI.Add(new tbl_POI()
                {
                    Description = "نقطه علاقه مندی اضافه شده رندوم",
                    DomainId = randomDomain.Id,
                    Latitude = random.Next(30, 60).ToString(),
                    Longitude = random.Next(30, 60).ToString(),
                    Name = randomDomain.Title +"_" + RandomString(5),
                });
            }

            context.SaveChanges();

            AlertMessage(ViewMessageType.Success, "10 نقطه علاقه مندی با موفقیت افزوده شد.");
            return RedirectToAction("Pois");
        }

        public static string RandomString(int length)
        {
            //const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private void AlertMessage(ViewMessageType messageType, string message)
        {
            TempData["Message"] = new ViewMessage() { MessageType = messageType, Message = message };
        }
    }
}