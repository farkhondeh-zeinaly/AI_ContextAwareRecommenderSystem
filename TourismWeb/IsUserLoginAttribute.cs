using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TourismWeb
{
    /// <summary>
    /// بررسی ورود کاربر
    /// </summary>
    public class IsUserLoginAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            try
            {
                //LoginUser currentUser = UserManager.GetLoginUser();
                //return currentUser != null;

                return httpContext.Session["LoginUserSessionText"] != null;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary { { "action", "Login" }, { "controller", "Account" } });
        }
    }
}