# pharmacy_supply_chain_management
This project focuses on recognizing and managing the major factors that are transforming the way pharmaceutical drugs are produced, distributed, stored, purchased, and sold throughout the supply chain. 

## Purpose
* Centralized system to maintain supply and distribution of drugs starting from raw materials to patients.
* Standardize data according to healthcare industry standards to make data compliant.
* Promote efficient and secure retrieval and sharing of data.
* Tracking and monitoring data to improve the quality and improve local availability.
* Reducing risks and overheads and increasing speed to market and hospitals.
* Following Strategic approach to monitor, minimize, and control logistic risks.

## Scope
The scope of this project includes all phases of supply chain management for a pharmaceutical company starting from getting raw materials to providing drugs to the end-users i.e., patients. It includes tracking and tracing the supplies during transportation and all phases of logistics till it reaches the end-users. This project does not cover the details of the Manufacturing process but only focuses on logistics and delivery of the drugs through all phases. It also includes storage requirements and quality checks of the supplies. Analyzing data based on market demand and sales are included in this management system.

## DDLScripts

## Contains Create Table Commands for creating all 15 Tables

List of Tables Created
● Vendor 
● Raw Material 
● Supplies 
● Manufacture Plant 
● Logistic
● Distributor 
● Customer 
● Hospital 
● Pharmacy 
● Drug Batches 
● Storage Facility 
● Cold Storage 
● Room Storage 
● Drug
● DistributesCollection

* Contains Data Encryption of Customer SSN Number in Customer Table

## Contains below procedures
* GetMaximumQuantityVendor
* GetDistributorforMaxRevenue
* GetAllDrugBatchesNeedColdStorage
* GetOrderDetails

## Contains below function
* GetDatesBatchManufaturedToDistributed

## Contains below Views
* Distributor_Order_Details_View 
* Supply_Order_View 

## Contains below Trigger
* DrugFDAStatusChange
* And Table DrugFDAApprovalChangeHistory to track history

* DML Script contains procedures to insert records in tables and Execute all Procedures, Functions and Triggers

* Business Intelligence Report contains Dashboard and Reports

