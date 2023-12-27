using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class DomainRelation
    {
        public int Id { get; set; }
        public Domain Parent { get; set; }
        public Domain Child { get; set; }
    }
}