//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TourismWeb
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_TourismDomain
    {
        public tbl_TourismDomain()
        {
            this.tbl_TourismDomainRelation = new HashSet<tbl_TourismDomainRelation>();
            this.tbl_TourismDomainRelation1 = new HashSet<tbl_TourismDomainRelation>();
            this.tbl_UserPreferences = new HashSet<tbl_UserPreferences>();
            this.tbl_POI = new HashSet<tbl_POI>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
    
        public virtual ICollection<tbl_TourismDomainRelation> tbl_TourismDomainRelation { get; set; }
        public virtual ICollection<tbl_TourismDomainRelation> tbl_TourismDomainRelation1 { get; set; }
        public virtual ICollection<tbl_UserPreferences> tbl_UserPreferences { get; set; }
        public virtual ICollection<tbl_POI> tbl_POI { get; set; }
    }
}
