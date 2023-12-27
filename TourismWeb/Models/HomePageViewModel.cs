using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class HomePageViewModel
    {
        public decimal Alpha { get; set; }
        public decimal Beta { get; set; }

        public tbl_User LoginUser { get; set; }

        public List<ContextFactor> ContextFactors { get; set; }
        public List<POI> POIs { get; set; }
        public List<UserPreference> Preferences { get; set; }




        public int? ContextFactorId { get; set; }
        public string ContextFactorName { get; set; }

        public int[] DomainVals { get; set; }
        public int LeisurePVal { get; set; }
        public int SportPVal { get; set; }
        public int NaturePVal { get; set; }
        public int CulturePVal { get; set; }
    }
}