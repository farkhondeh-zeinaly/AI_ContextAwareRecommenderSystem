using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TourismWeb.Models;

namespace TourismWeb.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult Logout()
        {
            Session["LoginUserSessionText"] = null;
            return RedirectToAction("Login", "Account");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserLogin model)
        {
            if (ModelState.IsValid)
            {
                var context = new TourismDBEntities();

                var username = model.Username;
                var password = model.Password;

                var user = context.tbl_User.FirstOrDefault(t => t.Username == username && t.Password == password);
                if (user != null)
                {
                    Session["LoginUserSessionText"] = user;
                    return RedirectToAction("Index", "Home");
                }

                AlertMessage(ViewMessageType.Warning, "Invalid username or password");
            }

            return View(model);
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserRegister model)
        {
            if (ModelState.IsValid)
            {
                TourismDBEntities context = new TourismDBEntities();

                string username = model.Username;
                var currentUser = context.tbl_User.FirstOrDefault(t => t.Username == username);
                if (currentUser == null)
                {
                    context.tbl_User.Add(new tbl_User()
                    {
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Username = model.Username,
                        Password = model.Password,
                    });

                    context.SaveChanges();
                    AlertMessage(ViewMessageType.Success, "User successfully registered.");

                    return View();
                }
                else
                {
                    AlertMessage(ViewMessageType.Warning, "Username already exists!");
                }
            }

            return View(model);
        }

        private void AlertMessage(ViewMessageType messageType, string message)
        {
            TempData["Message"] = new ViewMessage() { MessageType = messageType, Message = message };
        }


    }
}