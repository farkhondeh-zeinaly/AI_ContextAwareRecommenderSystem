using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public class UserPreference
    {
        public int UserId { get; set; }
        public Domain Domain { get; set; }
        public ContextFactor ContextFactor { get; set; }
        public decimal PreferenceValue { get; set; }
        public decimal ConfidenceValue { get; set; }
    }
}