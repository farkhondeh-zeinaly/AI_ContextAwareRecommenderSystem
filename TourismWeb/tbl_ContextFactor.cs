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
    
    public partial class tbl_ContextFactor
    {
        public tbl_ContextFactor()
        {
            this.tbl_ContextFactorRelation = new HashSet<tbl_ContextFactorRelation>();
            this.tbl_ContextFactorRelation1 = new HashSet<tbl_ContextFactorRelation>();
            this.tbl_UserPreferences = new HashSet<tbl_UserPreferences>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
    
        public virtual ICollection<tbl_ContextFactorRelation> tbl_ContextFactorRelation { get; set; }
        public virtual ICollection<tbl_ContextFactorRelation> tbl_ContextFactorRelation1 { get; set; }
        public virtual ICollection<tbl_UserPreferences> tbl_UserPreferences { get; set; }
    }
}