Create database project_healthcare_analytics;
use project_healthcare_analytics;

#Question-1
#Total Patients
select count(patientID) FROM patient_1;

#Question-2
#Total Doctors
select count(doctorID) FROM doctor_1;

#Question-3
#Total Visits
select count(visitID) FROM visit_1;

#Question-4
#Average Age of Patients
select avg(age) from patient_1;

#Question-5
#Top 5 Diagnised Conditions
select diagnosis from visit_1 limit 4;

#Question-6
#Follow-Up Rate
select (count(case when `Follow up Required`="Yes" then 1 else null end)*100)/count(*) as yes_count from visit_1 ;

#Question-7
#Treatment Cost Per visit(Avg)
select avg(cost) from treatment_1;

#Question-8
#Total Lab Tests Conducted
select count(labtestID) from lab_test_1;

#Question-9
#Percentage of Abnormal Results
select (count(case when `Test Result`="Abnormal" then 1 else null end)*100)/count(*) as abnormal_count from lab_test_1 ;

#Question-10
#Doctor Workload(Avg. Patients per doctor)
select avg(visitor_count) as avg_visitor_count from (seleCT d.doctorID,count(v.`doctor ID`) as visitor_count From visit_1 as v
 left join doctor_1 as d on v.`doctor ID`=d.DoctorID group by d.DoctorID) as doc_visit;

#Question-11
#Total Revenue
select TC+C as Total_Revenue from (select sum(`Treatment cost`) as TC ,sum(cost) as C from treatment_1) as Cost;