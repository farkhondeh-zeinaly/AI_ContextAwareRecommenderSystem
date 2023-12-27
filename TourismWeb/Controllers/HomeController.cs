using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TourismWeb.Models;

namespace TourismWeb.Controllers
{
    [IsUserLogin]
    public class HomeController : Controller
    {
        int[] _domainValues = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

        List<DomainRelation> _domainRelations = new List<DomainRelation>();
        List<UserPreference> _userPreferences;

        decimal _alpha;
        decimal _beta;

        tbl_User _loginUser;

        public HomeController()
        {
            _alpha = 0.2M;
            _beta = 0.5M;

            var context = new TourismDBEntities();

            foreach (var item in context.tbl_TourismDomainRelation)
            {
                _domainRelations.Add(new DomainRelation()
                {
                    Id = item.Id,
                    Child = new Domain()
                    {
                        Id = item.ChildId,
                        Name = item.tbl_TourismDomain1.Name,
                        Title = item.tbl_TourismDomain1.Title,
                    },
                    Parent = new Domain()
                    {
                        Id = item.ParentId,
                        Name = item.tbl_TourismDomain.Name,
                        Title = item.tbl_TourismDomain.Title,
                    },
                });
            }
        }

        public ActionResult Index(int? contextId)
        {
            if (Session["LoginUserSessionText"] != null)
            {
                _loginUser = (tbl_User)Session["LoginUserSessionText"];
            }

            //LoadUserPreferences(contextId);
            return View(GetHomePageViewModel(contextId));
        }

        private void LoadUserPreferences(int? contextId)
        {
            var context = new TourismDBEntities();
            tbl_ContextFactor contextFactor = null;

            if (contextId != null)
            {
                contextFactor = context.tbl_ContextFactor.FirstOrDefault(t => t.Id == contextId.Value);
                foreach (var item in context.tbl_UserPreferences.Where(t => t.UserId == _loginUser.Id && t.ContextFactorId == contextFactor.Id))
                {
                    _userPreferences.Add(new UserPreference()
                    {
                        ConfidenceValue = Convert.ToDecimal(item.ConfidenceValue),
                        PreferenceValue = Convert.ToDecimal(item.PreferenceValue),
                        UserId = _loginUser.Id,
                        ContextFactor = new ContextFactor()
                        {
                            Id = item.ContextFactorId.Value,
                            Name = item.tbl_ContextFactor.Name,
                            Title = item.tbl_ContextFactor.Title,
                        },
                        Domain = new Domain()
                        {
                            Id = item.DomainId,
                            Name = item.tbl_TourismDomain.Name,
                            Title = item.tbl_TourismDomain.Title,
                        }
                    });
                }
            }
            else
            {
                foreach (var item in context.tbl_UserPreferences.Where(t => t.UserId == _loginUser.Id && t.ContextFactorId == null))
                {
                    _userPreferences.Add(new UserPreference()
                    {
                        ConfidenceValue = Convert.ToDecimal(item.ConfidenceValue),
                        PreferenceValue = Convert.ToDecimal(item.PreferenceValue),
                        UserId = _loginUser.Id,
                        Domain = new Domain()
                        {
                            Id = item.DomainId,
                            Name = item.tbl_TourismDomain.Name,
                            Title = item.tbl_TourismDomain.Title,
                        }
                    });
                }
            }
        }
        private HomePageViewModel GetHomePageViewModel(int? contextId)
        {
            var context = new TourismDBEntities();
            tbl_ContextFactor contextFactor = null;

            if (contextId != null)
            {
                contextFactor = context.tbl_ContextFactor.FirstOrDefault(t => t.Id == contextId.Value);
            }

            List<ActivationValue> activationValues = new List<ActivationValue>();

            List<tbl_UserPreferences> userPreferences = null;
            if (contextId == null)
            {
                userPreferences = context.tbl_UserPreferences.Where(t => t.UserId == _loginUser.Id && t.ContextFactorId == null).ToList();
            }
            else
            {
                userPreferences = context.tbl_UserPreferences.Where(t => t.UserId == _loginUser.Id && t.ContextFactorId == contextId.Value).ToList();
            }

            if (userPreferences != null)
            {

                foreach (var preference in userPreferences)
                {
                    decimal value = Convert.ToDecimal(preference.ConfidenceValue * preference.PreferenceValue);
                    activationValues.Add(new ActivationValue()
                    {
                        Preference = preference.GetEntity(),
                        Value = value,
                    });
                }
            }
            else
            {
                foreach (var item in context.tbl_TourismDomain)
                {
                    activationValues.Add(new ActivationValue()
                    {
                        Preference = new UserPreference()
                        {
                            ConfidenceValue = 0,
                            ContextFactor = null,
                            Domain = new Domain()
                            {
                                Id = item.Id,
                                Name = item.Name,
                                Title = item.Title,
                            },
                            PreferenceValue = 0,
                            UserId = _loginUser.Id,
                        },

                        Value = 0
                    });
                }
            }

            double lat = 35;
            double lon = 51;

            List<POI> pois = new List<POI>();

            foreach (var item in activationValues.OrderByDescending(t => t.Value))
            {
                var domainPois = context.tbl_POI.Where(t => t.DomainId == item.Preference.Domain.Id);
                foreach (var dpoi in domainPois)
                {
                    if (Math.Sqrt(Math.Pow(Math.Abs(Convert.ToDouble(dpoi.Latitude) - lat), 2) + Math.Pow(Math.Abs(Convert.ToDouble(dpoi.Longitude) - lon), 2)) < 15)
                    {
                        pois.Add(dpoi.GetEntity());
                    }
                }
            }

            List<ContextFactor> _contextFactors = new List<ContextFactor>();

            foreach (var item in context.tbl_ContextFactor)
            {
                _contextFactors.Add(new ContextFactor()
                {
                    Id = item.Id,
                    Name = item.Name,
                    Title = item.Title,
                });
            }

            var model = new HomePageViewModel()
            {
                DomainVals = _domainValues,
                Alpha = _alpha,
                Beta = _beta,
                LoginUser = _loginUser,
                ContextFactors = _contextFactors,
                ContextFactorId = contextId,
                ContextFactorName = contextFactor == null ? "Undefined" : contextFactor.Name,
                Preferences = userPreferences.GetEntity(),
                POIs = pois,
            };

            return model;
        }

        [HttpPost]
        public ActionResult UpdatePreferences(HomePageViewModel model)
        {
            _loginUser = (tbl_User)Session["LoginUserSessionText"];

            var context = new TourismDBEntities();

            ContextFactor contextFactor = null;
            if (model.ContextFactorId != null)
            {
                var cf = context.tbl_ContextFactor.FirstOrDefault(t => t.Id == model.ContextFactorId.Value);
                contextFactor = new ContextFactor()
                {
                    Id = cf.Id,
                    Name = cf.Name,
                    Title = cf.Title,
                };
            }
            List<Domain> _domains = new List<Domain>();
            foreach (var item in context.tbl_TourismDomain)
            {
                _domains.Add(new Domain()
                {
                    Id = item.Id,
                    Name = item.Name,
                    Title = item.Title,
                });

            }

            List<Domain> firstLevelDomains = new List<Domain>();
            foreach (var item in _domains)
            {
                if (!_domainRelations.Any(t => t.Child.Id == item.Id))
                {
                    firstLevelDomains.Add(item);
                }
            }

            var leisure = firstLevelDomains.First(t => t.Name == "Leisure");
            var sport = firstLevelDomains.First(t => t.Name == "Sport");
            var nature = firstLevelDomains.First(t => t.Name == "Nature");
            var culture = firstLevelDomains.First(t => t.Name == "Culture");

            //int[] firstDomainIds = firstLevelDomains.Select(t => t.Id).ToArray();
            foreach (var item in firstLevelDomains)
            {
                UserPreference currentPreference = null;
                if (_userPreferences != null)
                {
                    if (contextFactor == null)
                    {
                        currentPreference = _userPreferences.FirstOrDefault(t =>
                              t.Domain.Id == item.Id
                              && t.UserId == _loginUser.Id
                              && t.ContextFactor == null);
                    }
                    else
                    {
                        currentPreference = _userPreferences.FirstOrDefault(t =>
                              t.Domain.Id == item.Id
                              && t.UserId == _loginUser.Id
                              && t.ContextFactor.Id == contextFactor.Id);
                    }
                }

                if (currentPreference == null)
                {
                    if (_userPreferences == null)
                    {
                        _userPreferences = new List<UserPreference>();
                    }

                    _userPreferences.Add(new UserPreference()
                    {
                        ConfidenceValue = 1,
                        PreferenceValue =
                            item.Name == "Leisure" ? Math.Round((decimal)model.LeisurePVal / 10, 2) :
                            item.Name == "Sport" ? Math.Round((decimal)model.SportPVal / 10, 2) :
                            item.Name == "Nature" ? Math.Round((decimal)model.NaturePVal / 10, 2) :
                            item.Name == "Culture" ? Math.Round((decimal)model.CulturePVal / 10, 2) : 0,
                        ContextFactor = contextFactor,
                        UserId = _loginUser.Id,
                        Domain = new Domain()
                        {
                            Id = item.Id,
                            Name = item.Name,
                            Title = item.Title,
                        },
                    });
                }
                else
                {
                    currentPreference.ConfidenceValue = 1;
                    currentPreference.PreferenceValue =
                          item.Name == "Leisure" ? model.LeisurePVal :
                            item.Name == "Sport" ? model.SportPVal :
                            item.Name == "Nature" ? model.NaturePVal :
                            item.Name == "Culture" ? model.CulturePVal : 0;
                    currentPreference.ContextFactor = contextFactor;
                    currentPreference.UserId = _loginUser.Id;
                    currentPreference.Domain = new Domain()
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Title = item.Title,
                    };
                }

                foreach (var child in _domainRelations.Where(t => t.Parent.Id == item.Id))
                {
                    SpreadActivation(child, contextFactor);
                }
            }

            SavePreferences(contextFactor == null ? null : new int?(contextFactor.Id));

            return RedirectToAction("Index", new { contextId = contextFactor == null ? null : new int?(contextFactor.Id) });

            //return View("Index", GetHomePageViewModel(contextFactor == null ? null : new int?(contextFactor.Id)));
        }

        private void SavePreferences(int? contextfactorId)
        {
            var context = new TourismDBEntities();

            foreach (var item in _userPreferences)
            {
                tbl_UserPreferences currentUserPreference = null;
                if (contextfactorId == null)
                {
                    currentUserPreference = context.tbl_UserPreferences.FirstOrDefault(t => t.UserId == _loginUser.Id && t.DomainId == item.Domain.Id && t.ContextFactorId == null);

                }
                else
                {
                    currentUserPreference = context.tbl_UserPreferences.FirstOrDefault(t => t.UserId == _loginUser.Id && t.DomainId == item.Domain.Id && t.ContextFactorId == contextfactorId.Value);
                }

                if (currentUserPreference == null)
                {
                    context.tbl_UserPreferences.Add(new tbl_UserPreferences()
                    {
                        ConfidenceValue = Convert.ToDouble(item.ConfidenceValue),
                        ContextFactorId = contextfactorId,
                        DomainId = item.Domain.Id,
                        PreferenceValue = Convert.ToDouble(item.PreferenceValue),
                        UserId = _loginUser.Id,
                    });
                }
                else
                {
                    currentUserPreference.ConfidenceValue = Convert.ToDouble(item.ConfidenceValue);
                    currentUserPreference.PreferenceValue = Convert.ToDouble(item.PreferenceValue);
                }

                context.SaveChanges();
            }
        }

        private void SpreadActivation(DomainRelation relation, ContextFactor contextFactor)
        {
            var parents = _domainRelations.Where(t => t.Child.Id == relation.Child.Id);

            decimal sumC = 0;
            decimal sumCP = 0;

            foreach (var item in parents)
            {
                UserPreference parent = null;
                if (contextFactor == null)
                {
                    parent = _userPreferences.FirstOrDefault(t => t.Domain.Id == item.Parent.Id && t.ContextFactor == null);
                }
                else
                {
                    parent = _userPreferences.FirstOrDefault(t => t.Domain.Id == item.Parent.Id && t.ContextFactor.Id == contextFactor.Id);
                }

                if (parent != null)
                {
                    sumC += Convert.ToDecimal(parent.ConfidenceValue);
                    sumCP += Convert.ToDecimal(parent.ConfidenceValue * parent.PreferenceValue);
                }
            }

            decimal p = sumC == 0 ? 0 : Math.Round(sumCP / sumC, 2);
            decimal c = parents.Count() == 0 ? 0 : (Math.Round(sumC / parents.Count(), 2) - _alpha);

            UserPreference currentPreference = null;
            if (contextFactor == null)
            {
                currentPreference = _userPreferences.FirstOrDefault(t =>
                          t.Domain.Id == relation.Child.Id
                          && t.UserId == _loginUser.Id
                          && t.ContextFactor == null);
            }
            else
            {
                currentPreference = _userPreferences.FirstOrDefault(t =>
                      t.Domain.Id == relation.Child.Id
                      && t.UserId == _loginUser.Id
                      && t.ContextFactor.Id == contextFactor.Id);
            }

            if (currentPreference == null)
            {
                _userPreferences.Add(new UserPreference()
                {
                    ConfidenceValue = c,
                    PreferenceValue = p,
                    ContextFactor = contextFactor,
                    UserId = _loginUser.Id,
                    Domain = new Domain()
                    {
                        Id = relation.Child.Id,
                        Name = relation.Child.Name,
                        Title = relation.Child.Title,
                    },
                });
            }
            else
            {
                currentPreference.ConfidenceValue = c;
                currentPreference.PreferenceValue = p;
                currentPreference.ContextFactor = contextFactor;
                currentPreference.UserId = _loginUser.Id;
                currentPreference.Domain = new Domain()
                {
                    Id = relation.Child.Id,
                    Name = relation.Child.Name,
                    Title = relation.Child.Title,
                };
            }

            foreach (var childer in _domainRelations.Where(t => t.Parent.Id == relation.Child.Id))
            {
                SpreadActivation(childer, contextFactor);
            }


        }

        public ActionResult About()
        {
            ViewBag.Message = "سيستم توصيه گر توريسم";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "فرخنده زينالي";

            return View();
        }

        public ActionResult UserAssign(int domainId, int? contextId, int preferValue)
        {
            _loginUser = (tbl_User)Session["LoginUserSessionText"];

            var context = new TourismDBEntities();

            List<tbl_UserPreferences> userReferences = null;
            if (contextId == null)
            {
                userReferences = context.tbl_UserPreferences.Where(t => t.UserId == _loginUser.Id && t.ContextFactorId == null).ToList();
            }
            else
            {
                userReferences = context.tbl_UserPreferences.Where(t => t.UserId == _loginUser.Id && t.ContextFactorId == contextId.Value).ToList();
            }

            if (_userPreferences == null)
            {
                _userPreferences = new List<UserPreference>();
            }

            foreach (var item in userReferences)
            {
                UserPreference currentRefrence = null;

                if (contextId == null)
                {
                    currentRefrence = _userPreferences.FirstOrDefault(t => t.UserId == _loginUser.Id && t.Domain.Id == item.DomainId && t.ContextFactor == null);
                }
                else
                {
                    currentRefrence = _userPreferences.FirstOrDefault(t => t.UserId == _loginUser.Id && t.Domain.Id == item.DomainId && t.ContextFactor.Id == contextId.Value);
                }

                if (currentRefrence == null)
                {
                    _userPreferences.Add(item.GetEntity());
                }
                else
                {
                    currentRefrence.ConfidenceValue = Convert.ToDecimal(item.ConfidenceValue);
                    currentRefrence.PreferenceValue = Convert.ToDecimal(item.PreferenceValue);
                }
            }

            UserPreference currentUserDomainPreference = null;

            if (contextId == null)
            {
                currentUserDomainPreference = _userPreferences.FirstOrDefault(t => t.UserId == _loginUser.Id && t.Domain.Id == domainId && t.ContextFactor == null);
            }
            else
            {
                currentUserDomainPreference = _userPreferences.FirstOrDefault(t => t.UserId == _loginUser.Id && t.Domain.Id == domainId && t.ContextFactor.Id == contextId.Value);
            }

            currentUserDomainPreference.PreferenceValue = Math.Min(1, currentUserDomainPreference.PreferenceValue + _beta * preferValue / 10);
            currentUserDomainPreference.ConfidenceValue = _beta * currentUserDomainPreference.ConfidenceValue + (1 - _beta) * 1;

            foreach (var relation in _domainRelations.Where(t => t.Child.Id == domainId))
            {
                SpreadActivationUpward(relation, contextId);
            }

            SavePreferences(contextId);

            return RedirectToAction("Index", new { contextId = contextId });
            //return View("Index", GetHomePageViewModel(contextId));
        }


        private void SpreadActivationUpward(DomainRelation relation, int? contextFactorId)
        {
            var children = _domainRelations.Where(t => t.Parent.Id == relation.Parent.Id);

            decimal sumC = 0;
            decimal sumCP = 0;

            foreach (var item in children)
            {
                UserPreference child = null;
                if (contextFactorId == null)
                {
                    child = _userPreferences.FirstOrDefault(t => t.Domain.Id == item.Child.Id && t.ContextFactor == null);

                }
                else
                {
                    child = _userPreferences.FirstOrDefault(t => t.Domain.Id == item.Child.Id && t.ContextFactor.Id == contextFactorId.Value);
                }

                if (child != null)
                {
                    sumC += Convert.ToDecimal(child.ConfidenceValue);
                    sumCP += Convert.ToDecimal(child.ConfidenceValue * child.PreferenceValue);
                }
            }

            decimal pAggregated = sumC == 0 ? 0 : Math.Round(sumCP / sumC, 2);
            decimal cAggregated = children.Count() == 0 ? 0 : Math.Round(sumC / children.Count(), 2);

            UserPreference currentPreference = null;
            if (contextFactorId == null)
            {
                currentPreference = _userPreferences.FirstOrDefault(t =>
                          t.Domain.Id == relation.Child.Id
                          && t.UserId == _loginUser.Id
                          && t.ContextFactor == null);
            }
            else
            {
                currentPreference = _userPreferences.FirstOrDefault(t =>
                      t.Domain.Id == relation.Child.Id
                      && t.UserId == _loginUser.Id
                      && t.ContextFactor.Id == contextFactorId.Value);
            }

            if (currentPreference == null)
            {

            }
            else
            {
                decimal p = Math.Round(((1 - _beta) * currentPreference.ConfidenceValue * currentPreference.PreferenceValue + _beta * cAggregated * pAggregated) / ((1 - _beta) * currentPreference.PreferenceValue + _beta * pAggregated), 2);
                decimal c = Math.Round(_beta * currentPreference.ConfidenceValue + (1 - _beta) * cAggregated, 2);

                currentPreference.ConfidenceValue = c;
                currentPreference.PreferenceValue = p;
            }

            foreach (var parenter in _domainRelations.Where(t => t.Child.Id == relation.Parent.Id))
            {
                SpreadActivationUpward(parenter, contextFactorId);
            }

        }
    }
}