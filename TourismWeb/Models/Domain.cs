using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class Domain
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }

        public string NameTitle { get { return Title + " [" + Name + "]"; } }
    }
}