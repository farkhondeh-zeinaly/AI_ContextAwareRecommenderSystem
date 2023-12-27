using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public static class EntityMapper
    {
        public static UserPreference GetEntity(this tbl_UserPreferences entity)
        {
            if (entity == null)
            {
                return null;
            }

            return new UserPreference()
            {
                ConfidenceValue = Convert.ToDecimal(entity.ConfidenceValue),
                ContextFactor = entity.tbl_ContextFactor.GetEntity(),
                Domain = entity.tbl_TourismDomain.GetEntity(),
                PreferenceValue = Convert.ToDecimal(entity.PreferenceValue),
                UserId = entity.UserId,
            };
        }
        public static List<UserPreference> GetEntity(this IEnumerable<tbl_UserPreferences> entity)
        {

            return entity.Select(t => t.GetEntity()).ToList();
        }

        public static ContextFactor GetEntity(this tbl_ContextFactor entity)
        {
            if (entity == null)
            {
                return null;
            }

            return new ContextFactor()
            {
                Id = entity.Id,
                Name = entity.Name,
                Title = entity.Title,
            };
        }
        public static List<ContextFactor> GetEntity(this IEnumerable<tbl_ContextFactor> entity)
        {

            return entity.Select(t => t.GetEntity()).ToList();
        }

        public static Domain GetEntity(this tbl_TourismDomain entity)
        {
            if (entity == null)
            {
                return null;
            }

            return new Domain()
            {
                Id = entity.Id,
                Name = entity.Name,
                Title = entity.Title,
            };
        }
        public static List<Domain> GetEntity(this IEnumerable<tbl_TourismDomain> entity)
        {

            return entity.Select(t => t.GetEntity()).ToList();
        }

        public static POI GetEntity(this tbl_POI entity)
        {
            if (entity == null)
            {
                return null;
            }

            return new POI()
            {
                Description = entity.Description,
                Domain = entity.tbl_TourismDomain.GetEntity(),
                Name = entity.Name,
                Id = entity.Id,
                DomainId = entity.DomainId,
                Latitude = entity.Latitude,
                Longitude = entity.Longitude,
            };
        }
        public static List<POI> GetEntity(this IEnumerable<tbl_POI> entity)
        {

            return entity.Select(t => t.GetEntity()).ToList();
        }
    }
}