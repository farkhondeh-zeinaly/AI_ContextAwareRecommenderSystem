using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class UserRegister
    {
        [Required]
        [Display(Name ="نام کاربری")]
        public string Username { get; set; }

        [Required]
        [Display(Name ="رمز عبور")]
        public string Password { get; set; }

        [Required]
        [Compare("Password")]
        [Display(Name ="تکرار رمز عبور")]
        public string ConfirmPassword { get; set; }

        [Required]
        [Display(Name ="نام")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name ="نام خانوادگی")]
        public string LastName { get; set; }
    }
}