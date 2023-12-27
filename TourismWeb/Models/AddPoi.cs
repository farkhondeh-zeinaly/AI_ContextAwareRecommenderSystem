using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class AddPoi
    {
        [Required]
        [Display(Name ="نام")]
        public string Name { get; set; }

        [Display(Name ="توضیحات")]
        public string Description { get; set; }

        [Required]
        [Display(Name ="عرض جغرافیایی")]
        public string Latitude { get; set; }

        [Required]
        [Display(Name ="طول جغرافیایی")]
        public string Longitude { get; set; }

        [Required]
        [Display(Name ="دامنه")]
        public int DomainId { get; set; }

        public List<Domain> Domains { get; set; }
    }
}