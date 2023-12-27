using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class POI
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public int DomainId { get; set; }
        public Domain Domain { get; set; }
    }
}