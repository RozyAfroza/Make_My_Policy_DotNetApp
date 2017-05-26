using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace MakeMyPolicyApp.ModelClass
{
    public class HealthInsuarence
    {
        public int Id { get; set; }
        public string MaritalStatus { get; set; }
        public int MinAge { get; set; }
        public int MaxAge { get; set; }
        public string ResidentialSituation { get; set; }
        public int MinIncome { get; set; }
        public int MaxIncome { get; set; }
        public bool HasMedicalHistory { get; set; }
        public int HowManyTimeSurgery { get; set; }
        public int TotalExpencePerYear { get; set; }
        public string HealthCareNeeded { get; set; }
        public int MinDoctor { get; set; }
        public int MaxDoctor { get; set; }
        public string SingleHealthCare { get; set; }
        public int MinHospital { get; set; }
        public int MaxHospital { get; set; }
        public int UserId { get; set; }

        public HealthInsuarence(string maritalStatus, int minAge, int maxAge, string residentialSituation, int minIncome, int maxIncome, bool hasMedicalHistory, int howManyTimeSurgery, int totalExpencePerYear, string healthCareNeeded, int minDoctor, int maxDoctor, string singleHealthCare, int minHospital, int maxHospital, int userId)
        {
            MaritalStatus = maritalStatus;
            MinAge = minAge;
            MaxAge = maxAge;
            ResidentialSituation = residentialSituation;
            MinIncome = minIncome;
            MaxIncome = maxIncome;
            HasMedicalHistory = hasMedicalHistory;
            HowManyTimeSurgery = howManyTimeSurgery;
            TotalExpencePerYear = totalExpencePerYear;
            HealthCareNeeded = healthCareNeeded;
            MinDoctor = minDoctor;
            MaxDoctor = maxDoctor;
            SingleHealthCare = singleHealthCare;
            MinHospital = minHospital;
            MaxHospital = maxHospital;
            UserId = userId;
        }

        public HealthInsuarence(int id, string maritalStatus, int minAge, int maxAge, string residentialSituation, int minIncome, int maxIncome, bool hasMedicalHistory, int howManyTimeSurgery, int totalExpencePerYear, string healthCareNeeded, int minDoctor, int maxDoctor, string singleHealthCare, int minHospital, int maxHospital, int userId) : 
            this(maritalStatus, minAge, maxAge, residentialSituation, minIncome, maxIncome, hasMedicalHistory, howManyTimeSurgery, totalExpencePerYear, healthCareNeeded, minDoctor, maxDoctor, singleHealthCare, minHospital, maxHospital, userId)
        {
            Id = id;
        }
    }
}