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
    
    public partial class tbl_TourismDomainRelation
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public int ChildId { get; set; }
    
        public virtual tbl_TourismDomain tbl_TourismDomain { get; set; }
        public virtual tbl_TourismDomain tbl_TourismDomain1 { get; set; }
    }
}
