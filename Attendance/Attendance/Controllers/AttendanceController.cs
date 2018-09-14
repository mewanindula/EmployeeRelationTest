using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Attendance_DAL.Model;
using MediClaim_DAL.Repository;
using Attendance_DAL.DB;
using Attendance.Common;
using static Attendance.Common.Enum;

namespace Attendance.Controllers
{
    public class AttendanceController : Controller
    {

        UnitOfWork _unitOfWork = new UnitOfWork();

        #region Employee
        public ActionResult EmpIndex()
        {
            return View("EmpIndex", EmployeeModel());
        }

        [HttpPost]
        public ActionResult AddEmployee(EmployeeViewModel model)
        {
            model = EmployeeModel(model);

            try
            {
                var existObj = _unitOfWork.EmployeeRepository.GetAll(x => x.EmpNo == model.EmpNo).FirstOrDefault();

                if (existObj != null) // Validate Emp No as unique
                    ModelState.AddModelError("EmpNo", "This Emp No is already exist");

                if (ModelState.IsValid)
                {
                    Employee emp = new Employee()
                    {
                        EmpNo = model.EmpNo,
                        EmpName = model.EmpName
                    };

                    _unitOfWork.EmployeeRepository.Insert(emp); //Insert Record

                    if (_unitOfWork.Save() > 0)
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._sucess;
                        return RedirectToAction("EmpIndex");
                    }
                    else
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._failed;
                        return View("EmpIndex", model);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return View("EmpIndex", model);


        }

        //Create Common Model With Common Lists
        EmployeeViewModel EmployeeModel(EmployeeViewModel model = null)
        {
            if (model == null)
            {
                model = new EmployeeViewModel()
                {

                };
            }

            model.ListEmployee = _unitOfWork.EmployeeRepository.GetAll().OrderBy(x=>x.EmpNo).ToList();

            return model;
        }
        #endregion

        #region RelationType
        public ActionResult RelIndex()
        {
            return View("RelIndex", RelIndexModel());
        }

        [HttpPost]
        public ActionResult AddRelationType(RelationTypeViewModel model)
        {
            model = RelIndexModel(model);

            try
            {
                var existObj = _unitOfWork.RelationTypeRepository.GetAll(x => x.RelationType1.ToUpper() == model.RelType.ToUpper()).FirstOrDefault();

                if (existObj != null) // Validate relation type as unique
                    ModelState.AddModelError("RelType", "This Relation type is already exist");

                if (ModelState.IsValid)
                {
                    RelationType relType = new RelationType()
                    {
                        RelationType1 = model.RelType
                    };

                    _unitOfWork.RelationTypeRepository.Insert(relType);

                    if (_unitOfWork.Save() > 0)
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._sucess;
                        return RedirectToAction("RelIndex");
                    }
                    else
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._failed;
                        return View("RelIndex", model);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return View("RelIndex", model);


        }

        //Create Common Model With Common Lists
        RelationTypeViewModel RelIndexModel(RelationTypeViewModel model = null)
        {
            if (model == null)
            {
                model = new RelationTypeViewModel()
                {

                };
            }

            model.ListRelationType = _unitOfWork.RelationTypeRepository.GetAll().ToList();

            return model;
        }
        #endregion

        #region RelationDetails
        public ActionResult RelDetailsIndex()
        {
            return View("RelDetailsIndex", RelDetailsModel());
        }

        [HttpPost]
        public ActionResult AddRelationDetails(RelationDetailsViewModel model)
        {
            model = RelDetailsModel(model);

            try
            {
                if (ModelState.IsValid)
                {
                    var maxCount = _unitOfWork.RelationTypeCountRepository.GetAll(x => x.EmpId == model.EmpId && x.RelTypeId == model.RelTypeId).FirstOrDefault();

                    int relCount = 0;


                    //If there hasn't any record according to this empId and relId, Insert Record to DB_RelationTypeCount and get maximum count for relevant empId and relId
                    if (maxCount == null)
                    {
                        RelationTypeCount count = new RelationTypeCount()
                        {
                            EmpId = model.EmpId,
                            RelTypeId = model.RelTypeId,
                            MaxCount = 1
                        };

                        _unitOfWork.RelationTypeCountRepository.Insert(count);

                        if (_unitOfWork.Save() <= 0)
                        {
                            TempData[MessaageEnum.message.ToString()] = Messages._failed;
                            //return RedirectToAction("RelDetailsIndex");
                            return View("RelDetailsIndex", model);
                        }

                        relCount = 1;
                    }
                    else
                    {
                        relCount = (int)maxCount.MaxCount;
                    }

                    var existObj = _unitOfWork.RelationDetailsRepository.GetAll(x => x.EmpId == model.EmpId && x.RelationTypeId == model.RelTypeId).ToList();

                    //If maximum Count is less than counts of db records of relevant empId and relId, Then Insert
                    if(existObj.Count < relCount)
                    {
                        bool hasName = false;

                        //Check whether relation name is already exist or not
                        foreach (var item in existObj)
                        {
                            if(item.RelationName.ToUpper() == model.RelName.ToUpper())
                            {
                                hasName = true;
                            }
                        }

                        if(!hasName)
                        {
                            RelationDetail detail = new RelationDetail()
                            {
                                EmpId = model.EmpId,
                                RelationTypeId = model.RelTypeId,
                                RelationName = model.RelName
                            };

                            _unitOfWork.RelationDetailsRepository.Insert(detail);
                        }
                        else
                        {
                            TempData[MessaageEnum.message.ToString()] = "danger_This relation name is already exist";
                            return View("RelDetailsIndex", model);
                        }

                        
                    }
                    else
                    {
                        TempData[MessaageEnum.message.ToString()] = "danger_You can add maximum " + relCount + ", from this relation type";
                        return View("RelDetailsIndex", model);
                        //ModelState.AddModelError("RelTypeId", "You can add maximum " + relCount + ", from this relation type");
                    }

                    if (_unitOfWork.Save() > 0)
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._sucess;
                        return RedirectToAction("RelDetailsIndex");
                    }
                    else
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._failed;
                        return View("RelDetailsIndex", model);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return View("RelDetailsIndex", model);


        }

        //Create Common Model With Common Lists
        RelationDetailsViewModel RelDetailsModel(RelationDetailsViewModel model = null)
        {
            if (model == null)
            {
                model = new RelationDetailsViewModel();
                //model.RelTypeId = 0;
                //model.EmpId = 0;
            }

            model.ListEmployee = _unitOfWork.EmployeeRepository.GetAll().ToList();
            model.ListRelationType = _unitOfWork.RelationTypeRepository.GetAll().ToList();
            model.ListRelationDetails = _unitOfWork.RelationDetailsRepository.GetAll().OrderBy(x=>x.Employee.EmpName).ToList();

            //List<RelationTypeList> relType = new List<RelationTypeList>();

            //RelationTypeList rel = new RelationTypeList()
            //{
            //    Id = -1,
            //    Name = "Add New Type",
            //};

            //relType.Add(rel);

            //RelationTypeList rel1 = new RelationTypeList()
            //{
            //    Id = 0,
            //    Name = "--Select Relation Type--",
            //};

            //relType.Add(rel1);

            //var relTypeList = _unitOfWork.RelationTypeRepository.GetAll().ToList();

            //foreach (var item in relTypeList)
            //{
            //    RelationTypeList type = new RelationTypeList()
            //    {
            //        Id = item.Id,
            //        Name = item.RelationType1,
            //    };

            //    relType.Add(type);
            //}

            //model.ListRelationType = relType;

            //model.RelTypeId = -1;
            //model.EmpId = 0;

            return model;
        }
        #endregion

        #region RelationTypeMaxCount
        public ActionResult RelTypeCountIndex()
        {
            return View("RelTypeCountIndex", RelTypeModel());
        }

        [HttpPost]
        public ActionResult AddRelationCount(RelationTypeCountViewModel model)
        {
            model = RelTypeModel(model);

            try
            {
                if (ModelState.IsValid)
                {
                    var existObj = _unitOfWork.RelationTypeCountRepository.GetAll(x => x.EmpId == model.EmpId && x.RelTypeId == model.RelTypeId).FirstOrDefault();

                    if (existObj == null) //Insert
                    {
                        RelationTypeCount count = new RelationTypeCount()
                        {
                            EmpId = model.EmpId,
                            RelTypeId = model.RelTypeId,
                            MaxCount = model.MaxCount
                        };

                        _unitOfWork.RelationTypeCountRepository.Insert(count);
                    }
                    else // Update
                    {
                        existObj.MaxCount = model.MaxCount;
                    }

                    if (_unitOfWork.Save() > 0)
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._sucess;
                        return RedirectToAction("RelTypeCountIndex");
                    }
                    else
                    {
                        TempData[MessaageEnum.message.ToString()] = Messages._failed;
                        return View("RelTypeCountIndex", model);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return View("RelTypeCountIndex", model);


        }

        //Create Common Model With Common Lists
        RelationTypeCountViewModel RelTypeModel(RelationTypeCountViewModel model = null)
        {
            if (model == null)
            {
                model = new RelationTypeCountViewModel();
            }

            model.ListEmployee = _unitOfWork.EmployeeRepository.GetAll().ToList();
            model.ListRelationType = _unitOfWork.RelationTypeRepository.GetAll().ToList();
            model.ListRelationTypeCount = _unitOfWork.RelationTypeCountRepository.GetAll().OrderBy(x=>x.Employee.EmpName).ToList();

            return model;
        }
        #endregion
    }
}