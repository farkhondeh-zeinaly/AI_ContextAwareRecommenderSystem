using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class UserLogin
    {
        [Required]
        [Display(Name ="نام کاربری")]
        public string Username { get; set; }

        [Required]
        [Display(Name ="رمز عبور")]
        public string Password { get; set; }
    }
}