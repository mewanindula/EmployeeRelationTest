using Attendance_DAL.DB;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Attendance_DAL.Model
{
    public class EmployeeViewModel
    {
        public int EmpId { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Emp No is required")]
        public string EmpNo { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Emp Name is required")]
        public string EmpName { get; set; }
        public List<Employee> ListEmployee { get; set; }
    }

    public class RelationTypeViewModel
    {
        public int RelTypeId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Relation Type is required")]
        public string RelType { get; set; }
        public List<RelationType> ListRelationType { get; set; }
    }

    public class RelationDetailsViewModel
    {
        public int RelDetailsId { get; set; }

        public int EmpId { get; set; }

        public int RelTypeId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Relation name is required")]
        public string RelName { get; set; }
        public List<Employee> ListEmployee { get; set; }
        //public List<RelationTypeList> ListRelationType { get; set; }
        public List<RelationType> ListRelationType { get; set; }
        public List<RelationDetail> ListRelationDetails { get; set; }
    }

    public class RelationTypeList
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class RelationTypeCountViewModel
    {
        public int EmpId { get; set; }

        public int RelTypeId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Max count is required")]
        public int MaxCount { get; set; }
        public List<Employee> ListEmployee { get; set; }
        public List<RelationType> ListRelationType { get; set; }
        public List<RelationTypeCount> ListRelationTypeCount { get; set; }
    }
}
