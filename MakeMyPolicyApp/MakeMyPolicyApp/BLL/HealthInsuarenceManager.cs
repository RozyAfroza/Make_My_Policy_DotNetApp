using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MakeMyPolicyApp.DAL;
using MakeMyPolicyApp.ModelClass;

namespace MakeMyPolicyApp.BLL
{
    public class HealthInsuarenceManager
    {
        HealthInsuarenceGateway _healthInsuarenceGateway = new HealthInsuarenceGateway();

        public string InsertHealthInsuarence(HealthInsuarence healthInsuarence)
        {
             if (IsHealthInsuarenceExists(healthInsuarence))
            {
                return "This Insuarence is Already Exists for that person!";
            }
            var rowAffected = _healthInsuarenceGateway.InsertHealthInsuarence(healthInsuarence); ;

            if (rowAffected > 0)
            {
                return "Saved Successfully!";
            }
            return "Insertion Failed!";
        }

        private bool IsHealthInsuarenceExists(HealthInsuarence healthInsuarence)
        {
            var isHealthInsuarenceExists = false;
            if (healthInsuarence == null)
            {
                return isHealthInsuarenceExists;
            }

            var existingInsuarence = _healthInsuarenceGateway.GetHealthInsuarenceByUserId(healthInsuarence.UserId);

            isHealthInsuarenceExists = existingInsuarence != null;

            return isHealthInsuarenceExists;
        }
    }
}
