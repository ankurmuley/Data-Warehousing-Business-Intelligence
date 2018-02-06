
-- create views for BI Retail_DW_Test 

use Retail_DW_test
go

drop view DimCustomer_vw
go
Create view DimCustomer_vw
as
SELECT
  CustomerSK
 --, CustomerID
 --, CustomerKey
 --, CustomerLabel
 , 'Person' as CustomerType
 , GeographySK as CustomerGeographySK
 , case when MiddleName is not null then LastName+',  '+FirstName+'  '+MiddleName
        else LastName+',  '+FirstName
        end as CustomerName
 ,YearlyIncome      
 ,BirthDate
 ,MaritalStatus
 ,Gender
 ,TotalChildren
 ,NumberChildrenAtHome
 ,Education
 ,Occupation
 ,HouseOwnerFlag
 ,NumberCarsOwned
 ,DateFirstPurchase
FROM  DimCustomer_Person
union
SELECT
 c. CustomerSK
 --, c.CustomerID
-- , c.CustomerKey
-- , c.CustomerLabel
 , c.CustomerType
 , GeographySK as CustomerGeographySK
 , c.CompanyName as CustomerName
  ,YearlyIncome 
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
FROM   DimCustomer_Company c
GO

drop view DimProductCategory_vw
go
Create view DimProductCategory_vw
as
SELECT
  ProductCategoryKey
 , ProductCategoryLabel
 , ProductCategoryName
 , ProductCategoryDescription
FROM DimProduct
group by   
  ProductCategoryKey
 , ProductCategoryLabel
 , ProductCategoryName
 , ProductCategoryDescription
go

-----------------------------------------------------------------------------------

drop view vbi_DimCustomer
go
Create view vbi_DimCustomer
as
SELECT
  CustomerSK
 --, CustomerID
 --, CustomerKey
 --, CustomerLabel
 , 'Person' as CustomerType
 , GeographySK as CustomerGeographySK
 , case when MiddleName is not null then LastName+',  '+FirstName+'  '+MiddleName
        else LastName+',  '+FirstName
        end as CustomerName
 ,YearlyIncome      
 ,BirthDate
 ,MaritalStatus
 ,Gender
 ,TotalChildren
 ,NumberChildrenAtHome
 ,Education
 ,Occupation
 ,HouseOwnerFlag
 ,NumberCarsOwned
 ,DateFirstPurchase
FROM  DimCustomer_Person
union
SELECT
 c. CustomerSK
 --, c.CustomerID
-- , c.CustomerKey
-- , c.CustomerLabel
 , c.CustomerType
 , GeographySK as CustomerGeographySK
 , c.CompanyName as CustomerName
  ,YearlyIncome 
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
 ,null
FROM   DimCustomer_Company c
GO

/*
drop view vbi_DimCustomer_Company
go
Create view vbi_DimCustomer_Company
as
SELECT
  CustomerSK
 -- , CustomerID
 -- , CustomerKey
 -- , CustomerLabel
 , GeographySK as CustomerGeographySK
 , YearlyIncome
 , CustomerType
 , CompanyName
 -- , GeographyKey
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM DimCustomer_Company
go

drop view vbi_DimCustomer_Person
go
Create view vbi_DimCustomer_Person
as
SELECT
  CustomerSK
--  , CustomerID
--  , CustomerKey
--  , CustomerLabel
 , GeographySK as CustomerGeographySK
, case when MiddleName is not null then LastName+',  '+FirstName+'  '+MiddleName
        else LastName+',  '+FirstName
        end as CustomerName
-- , Title
-- , FirstName
-- , MiddleName
-- , LastName
-- , NameStyle
 , BirthDate
 , MaritalStatus
-- , Suffix
 , Gender 
-- , EmailAddress
 , YearlyIncome
 , TotalChildren
 , NumberChildrenAtHome
 , Education
 , Occupation
 , HouseOwnerFlag
 , NumberCarsOwned
--  , AddressLine1
--  , AddressLine2
--  , Phone
 , DateFirstPurchase
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM DimCustomer_Person
go
*/

---  Geo Dimension -------------------
---  Role-playing views

drop view vbi_DimGeography
go
Create view vbi_DimGeography
as
SELECT
  GeographySK
--  , GeographyKey
--  , GeographyType
 , ContinentName
 , ContinentCode
 , Country
 , Country_name as Country_Formal
-- , RegionCountryName
-- , ISO_3166_numeric
 , ISO_3166_alpha_2 as Country_A2
 , ISO_3166_alpha_3 as Country_A3
-- , Region
 , Subdiv_name as RegionStateProvince
 , ISO_3166_2_subdiv  as Region_A2
 , Subdiv_code  as Region_A4
-- , StateProvinceName
 --, StateProvinceCode
 , City
 , CityName as City_AltName
 --, Latitude
 --, Longitude
 , Latitude_Geometry as Latitude
 , Longitude_Geometry as Longitude
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimGeography
go

drop view vbi_DimGeography_Customer
go
Create view vbi_DimGeography_Customer
as
SELECT
  GeographySK as CustomerGeographySK
--  , GeographyKey
 , ContinentName as Cust_ContinentName
 , ContinentCode as Cust_ContinentCode 
 , Country as Cust_Country 
 , Country_name as Cust_Country_Formal
 , ISO_3166_alpha_2 as Cust_Country_A2
 , ISO_3166_alpha_3 as Cust_Country_A3
 , Subdiv_name as Cust_RegionStateProvince
 , ISO_3166_2_subdiv as Cust_Region_A2
 , Subdiv_code as Cust_Region_A4
 , City as Cust_City
 , CityName as Cust_City_AltName
 , Latitude_Geometry as Cust_Latitude
 , Longitude_Geometry as Cust_Longitude
FROM  DimGeography
go

drop view vbi_DimGeography_Store
go
Create view vbi_DimGeography_Store
as
SELECT
  g.GeographySK as StoreGeographySK
--  , GeographyKey
 , ContinentName as Store_ContinentName
 , ContinentCode as Store_ContinentCode 
 , Country as Store_Country 
 , Country_name as Store_Country_Formal
 , ISO_3166_alpha_2 as Store_Country_A2
 , ISO_3166_alpha_3 as Store_Country_A3
 , Subdiv_name as Store_RegionStateProvince
 , ISO_3166_2_subdiv as Store_Region_A2
 , Subdiv_code as Store_Region_A4
 , City as Store_City
 , CityName as Store_City_AltName
 , Latitude_Geometry as Store_Latitude
 , Longitude_Geometry as Store_Longitude
FROM  DimGeography g
join.DimStore s
on g.GeographySK = s.GeographySK
go

drop view vbi_DimGeography_SalesTerritory
go
Create view vbi_DimGeography_SalesTerritory
as
SELECT
 g.GeographySK as SalesTerritoryGeographySK
--  , GeographyKey
 , ContinentName as ST_ContinentName
 , ContinentCode as ST_ContinentCode 
 , Country as ST_Country 
 , Country_name as ST_Country_Formal
 , ISO_3166_alpha_2 as ST_Country_A2
 , ISO_3166_alpha_3 as ST_Country_A3
 , Subdiv_name as ST_RegionStateProvince
 , ISO_3166_2_subdiv as ST_Region_A2
 , Subdiv_code as ST_Region_A4
 , City as ST_City
 , CityName as ST_City_AltName
 , Latitude_Geometry as ST_Latitude
 , Longitude_Geometry as ST_Longitude
from  DimGeography g
join DimSalesTerritory s
on g.GeographySK = s.GeographySK
go

---  Date Dimension -------------------
---  Role-playing dimensions
---  also limit role-playing to applicabel date range for BI

drop view vbi_DimDate
go
Create view vbi_DimDate
as
SELECT
   DateSK
 , FullDateAK
 , FullDateTimeAK
 , YearID
 , MonthID
 , DayID
 , YearQtr
 , YearMonth
 , DayOfYear
 , WeekOfYear
 , DayofWeek
 , MonthAbr
 , DayAbr
-- , MonthFull
-- , DayFull
-- , FullDateUSA
 --, DayOfMonth
-- , DaySuffix
-- , DayName
 --, DayOfWeekUSA
-- , DayOfWeekInMonth
-- , DayOfWeekInYear
 , DayOfQuarter
 , DayOfYearChar
 , WeekOfMonth
 , WeekOfQuarter
 , WeekOfYearChar
 , MonthChar
 , MonthName
 , MonthOfQuarter
 , Quarter
 , QuarterName
 , YearChar
 , YearName
 , MonthYear
-- , MMYYYY
 , FirstDayOfMonth
 , LastDayOfMonth
 , FirstDayOfQuarter
 , LastDayOfQuarter
 , FirstDayOfYear
 , LastDayOfYear
-- , IsWeekday
-- , IsHolidayUSA
-- , HolidayUSA
-- , EuropeSeason
 --, NorthAmericaSeason
-- , AsiaSeason
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM DimDate
go

drop view vbi_DimDate_Sales
go
Create view vbi_DimDate_Sales
as
SELECT
   DateSK as SalesDateSK
 , FullDateAK as SalesDate
 , YearID
 , MonthID
 , DayID
 , YearQtr
 , YearMonth
 , DayOfYear
 , WeekOfYear
 , DayofWeek
 , MonthAbr
 , MonthChar
 , MonthOfQuarter
 , Quarter
 , FirstDayOfYear
 , LastDayOfYear
 , IsWeekday
 , IsHolidayUSA
 , HolidayUSA
 , EuropeSeason
 , NorthAmericaSeason
 , AsiaSeason
FROM DimDate
-- Limit date range to when sales occured
where datesk >= 20120101 and datesk < 20150101
go

drop view vbi_DimDate_OnlineSales
go
Create view vbi_DimDate_OnlineSales
as
SELECT
   DateSK as OnlineSalesDateSK
 , FullDateAK as OnlineSalesDate
 , YearID
 , MonthID
 , DayID
 , YearQtr
 , YearMonth
 , DayOfYear
 , WeekOfYear
 , DayofWeek
 , MonthAbr
 , MonthChar
 , MonthOfQuarter
 , Quarter
 , FirstDayOfYear
 , LastDayOfYear
 , IsWeekday
 , IsHolidayUSA
 , HolidayUSA
 , EuropeSeason
 , NorthAmericaSeason
 , AsiaSeason
FROM DimDate
-- Limit date range to when sales occured
where datesk >= 20120101 and datesk < 20150101
go

drop view vbi_DimDate_Inventory
go
Create view vbi_DimDate_Inventory
as
SELECT
   DateSK as InventoryDateSK
 , FullDateAK as InventoryDate
 , YearID as Inventory_YearID
 , MonthID  as Inventory_MonthID
 , DayID  as Inventory_DayID
 , YearQtr  as Inventory_YearQtr
 , YearMonth  as Inventory_YearMonth
 , DayOfYear  as Inventory_DayOfYear
 , WeekOfYear  as Inventory_WeekOfYear  
 , DayofWeek  as Inventory_DayofWeek  
 , MonthAbr  as Inventory_MonthAbr  
 , MonthChar  as Inventory_
 , MonthOfQuarter  as Inventory_MonthOfQuarter  
 , Quarter  as Inventory_Quarter
 , FirstDayOfYear  as Inventory_FirstDayOfYear  
 , LastDayOfYear  as Inventory_LastDayOfYear  
FROM DimDate
-- Limit date range to when sales occured
where datesk >= 20120101 and datesk < 20150101
go

drop view vbi_DimDate_SalesQuota
go
Create view vbi_DimDate_SalesQuota
as
SELECT
   DateSK as QuotaDateSK
 , FullDateAK as QuotaDate
 , YearID
 , MonthID
 , DayID
 , YearQtr
 , YearMonth
 , DayOfYear
 , WeekOfYear
 , DayofWeek
 , MonthAbr
 , MonthChar
 , MonthOfQuarter
 , Quarter
 , FirstDayOfYear
 , LastDayOfYear
 , IsWeekday
 , IsHolidayUSA
 , HolidayUSA
 , EuropeSeason
 , NorthAmericaSeason
 , AsiaSeason
FROM DimDate
-- Limit date range to when sales occured
where datesk >= 20120101 and datesk < 20150101
go

drop view vbi_DimDate_StrategyPlan
go
Create view vbi_DimDate_StrategyPlan
as
SELECT
   DateSK as PlanDateSK
 , FullDateAK as PlanDate
 , YearID
 , MonthID
 , DayID
 , YearQtr
 , YearMonth
 , DayOfYear
 , WeekOfYear
 , DayofWeek
 , MonthAbr
 , MonthChar
 , MonthOfQuarter
 , Quarter
 , FirstDayOfYear
 , LastDayOfYear
 , IsWeekday
 , IsHolidayUSA
 , HolidayUSA
 , EuropeSeason
 , NorthAmericaSeason
 , AsiaSeason
FROM DimDate
-- Limit date range to when sales occured
where datesk >= 20120101 and datesk < 20150101
go

---------- Dimensions ----------------------------

drop view vbi_DimAccount
go
Create view vbi_DimAccount
as
SELECT
  AccountSK
 , AccountKey
 , ParentAccountSK
 , ParentAccountKey
 , AccountLabel
 , AccountName
 , AccountDescription
 , AccountType
 , Operator
 , CustomMembers
 , ValueType
 , CustomMemberOptions
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM DimAccount
go

drop view vbi_DimChannel
go
Create view vbi_DimChannel
as
SELECT
  ChannelSK
  , ChannelKey
 --, ChannelLabel
 , ChannelName
 , ChannelDescription
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimChannel
go

drop view vbi_DimCurrency
go
Create view vbi_DimCurrency
as
SELECT
  CurrencySK
 , CurrencyKey
 --, CurrencyLabel
 , CurrencyName
 , CurrencyDescription
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM DimCurrency
go



drop view vbi_DimEmployee
go
Create view vbi_DimEmployee
as
SELECT
  EmployeeSK
 , EmployeeKey
 , ParentEmployeeSK
 , ParentEmployeeKey
, case when MiddleName is not null then LastName+',  '+FirstName+'  '+MiddleName
        else LastName+',  '+FirstName
        end as EmployeeName
-- , FirstName
-- , LastName
-- , MiddleName
-- , Title
 , HireDate as EmployeeHireDate
 , BirthDate as EmployeeBirthDate
--  , EmailAddress
--  , Phone
 , MaritalStatus as EmplyeeMaritalStatus
--  , EmergencyContactName
--  , EmergencyContactPhone
 , Gender as EmployeeGender
 , PayFrequency
 , BaseRate
 , VacationHours
 , SalariedFlag
 , CurrentFlag as EmployeeCurrentFlag
 , SalesPersonFlag
 , DepartmentName
 , StartDate as EmployeeStartDate
 , EndDate as EmployeeEndDate
 , Status as EmployeeStatus
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimEmployee
go
drop view vbi_DimEntity
go
Create view vbi_DimEntity
as
SELECT
  EntitySK
 , EntityKey
 , EntityLabel
 , ParentEntitySK
 -- , ParentEntityKey
 , ParentEntityLabel
 , EntityName
 , EntityDescription
 , EntityType
 , StartDate as EntityStartDate
 , EndDate as EntityEndDate
 , Status as EntityStatus
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimEntity
go


drop view vbi_DimProduct
go
Create view vbi_DimProduct
as
SELECT
  ProductSK
--  , ProductKey
 , Product_ID
 , Brand_ID
 , ProductLabel
 , ProductName
 , ProductDescription
 , ProductSubcategoryKey
 , ProductSubcategoryLabel
 , ProductSubcategoryName
 , ProductSubcategoryDescription
 , ProductCategoryKey
 , ProductCategoryLabel
 , ProductCategoryName
 , ProductCategoryDescription
 , Manufacturer
 , BrandName
 , ClassID
 , ClassName
 , StyleID
 , StyleName
 , ColorID
 , ColorName
 , ProductSize
 , SizeRange
 , SizeUnitMeasureID
 , Weight as ProductWeight
 , WeightUnitMeasureID
 , UnitOfMeasureID
 , UnitOfMeasureName
 , StockTypeID
 , StockTypeName
 , AvailableForSaleDate
 , StopSaleDate
 , Status as Product
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM DimProduct
go


drop view vbi_DimProductCategory
go
Create view vbi_DimProductCategory
as
SELECT
  ProductCategoryKey
 , ProductCategoryLabel
 , ProductCategoryName
 , ProductCategoryDescription
FROM DimProduct
group by   
  ProductCategoryKey
 , ProductCategoryLabel
 , ProductCategoryName
 , ProductCategoryDescription
go

drop view vbi_DimProductCost
go
Create view vbi_DimProductCost
as
SELECT
--   SCD_ProductCostSK
  ProductSK
 , CurrencyKey
 , UnitCost
 , SCD_EffectiveDate
 , SCD_IneffectiveDate
 , SCD_Current_Flag
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimProductCost
go
drop view vbi_DimProductPrice
go
Create view vbi_DimProductPrice
as
SELECT
--   SCD_ProductPriceSK
  ProductSK
 -- , CurrencyKey  -- all currency is USD in this DW
 , UnitPrice
 , SCD_EffectiveDate
 , SCD_IneffectiveDate
 , SCD_Current_Flag
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimProductPrice
go

drop view vbi_DimPromotion
go
Create view vbi_DimPromotion
as
SELECT
  PromotionSK
--  , PromotionID
 -- , PromotionKey
 , PromotionLabel
 , PromotionName
 , PromotionDescription
 , DiscountPercent as PromotionDiscountPercent
 , PromotionType 
 , PromotionCategory
 , StartDate as PromotionStartDate
 , EndDate as PromotionEndDate
--  , MinQuantity
--  , MaxQuantity
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimPromotion
go

drop view vbi_DimSalesTerritory
go
Create view vbi_DimSalesTerritory
as
SELECT
  SalesTerritorySK
 -- , SalesTerritoryKey
 , GeographySK as SalesTerritoryGeographySK
 , SalesTerritoryLabel
 , SalesTerritoryName
 , SalesTerritoryRegion
 , SalesTerritoryCountry
 , SalesTerritoryGroup
 , SalesTerritoryLevel
 , SalesTerritoryManager
 , StartDate as SalesTerritoryStartDate
 , EndDate as SalesTerritoryEndDate 
 , Status as SalesTerritoryStatus 
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimSalesTerritory
go

drop view vbi_DimScenario
go
Create view vbi_DimScenario
as
SELECT
  ScenarioSK
 , ScenarioKey
 , ScenarioLabel
 , ScenarioName
 , ScenarioDescription
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  DimScenario
go

drop view vbi_DimStore
go
Create view vbi_DimStore
as
SELECT
  StoreSK
--  , StoreID
--  , StoreKey
 , SalesTerritorySK
 , GeographySK as StoreGeographySK
 , EntityKey
 , StoreManager
 , StoreType
 , StoreName
 , StoreDescription
 , Status as StoreStatus
 , OpenDate as StoreOpenDate
 , CloseDate as StoreCloseDate
 , CloseReason as StoreCloseReason
 , EmployeeCount
 , SellingAreaSize
 , LastRemodelDate
 , ZipCode
 , ZipCodeExtension
 -- , StorePhone
 -- , StoreFax
 -- , AddressLine1
 -- , AddressLine2
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 -- , DIJob_ID
 -- , DICreate_Date
 -- , DIModified_Date
FROM  DimStore
go

------------------------------------------------------
----------- FACTS
------------------------------------------------------

drop view vbi_FactExchangeRate
go
Create view vbi_FactExchangeRate
as
SELECT
 --  ExchangeRateSK
   CurrencyDateSK
 , CurrencyDateKey as CurrencyDate
 -- , CurrencySK
 , EndOfDayRate
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactExchangeRate
go
drop view vbi_FactInventory
go
Create view vbi_FactInventory
as
SELECT
--   InventorySK
   InventoryDateSK
 , InventoryDate
 , StoreSK
 , ProductSK
 , GeographySK
 , OnHandQuantity
 , OnOrderQuantity
 , SafetyStockQuantity
 , DaysInStock
 , MinDayInStock
 , MaxDayInStock
 , Aging
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactInventory
go

drop view vbi_FactInventory_Rejects
go
Create view vbi_FactInventory_Rejects
as
SELECT
 --  InventorySK
   InventoryDateSK
 , InventoryDate
 , StoreSK
 , ProductSK
 , GeographySK
 , OnHandQuantity
 , OnOrderQuantity
 , SafetyStockQuantity
 , DaysInStock
 , MinDayInStock
 , MaxDayInStock
 , Aging
 , RejectRow
 , RejectReason
 , RejectReasonCode
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM FactInventory_Rejects
go

drop view vbi_FactOnlineSales
go
Create view vbi_FactOnlineSales
as
SELECT
 --  SalesSK
   SalesDateSK 
 , SalesDate
 , CustomerSK
 , ChannelSK
 , StoreSK
 , ProductSK
 , PromotionSK
 , GeographySK
 , SalesOrderNumber
 , SalesOrderLineNumber
 , SalesQuantity
 , ReturnQuantity
 , SalesAmount
 , ReturnAmount
 , DiscountAmount
 , TotalCost
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM   FactOnlineSales
go
drop view vbi_FactOnlineSales_Rejects
go
Create view vbi_FactOnlineSales_Rejects
as
SELECT
--   SalesSK
   SalesDateSK
 , SalesDate
 , ChannelSK
 , CustomerSK
 , StoreSK
 , ProductSK
 , PromotionSK
 , GeographySK
 , SalesOrderNumber
 , SalesOrderLineNumber
 , SalesQuantity
 , ReturnQuantity
 , SalesAmount
 , ReturnAmount
 , DiscountAmount
 , TotalCost
 , RejectRow
 , RejectReason
 , RejectReasonCode
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactOnlineSales_Rejects
go

drop view vbi_FactSalesQuota
go
Create view vbi_FactSalesQuota
as
SELECT
 -- SalesQuotaSK
-- , SalesQuotaKey
   ChannelSK
 , StoreSK
 , ProductSK
 , QuotaDateSK
 , QuotaDateKey
 , CurrencySK
 , ScenarioSK
 , SalesQuantityQuota
 , GrossMarginPct
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactSalesQuota
go
drop view vbi_FactSalesQuota_Rejects
go
Create view vbi_FactSalesQuota_Rejects
as
SELECT
 -- SalesQuotaSK
-- , SalesQuotaKey
   ChannelSK
 , StoreSK
 , ProductSK
 , QuotaDateSK
 , QuotaDateKey
 , CurrencySK
 , ScenarioSK
 , SalesQuantityQuota
 , GrossMarginPct
 , RejectRow
 , RejectReason
 , RejectReasonCode
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM FactSalesQuota_Rejects
go
drop view vbi_FactSales
go
Create view vbi_FactSales
as
SELECT
 --   SalesSK
   SalesDateSK
 , SalesDate
 , ChannelSK
 , StoreSK
 , ProductSK
 , PromotionSK
 , GeographySK
 , SalesQuantity
 , ReturnQuantity
 , SalesAmount
 , ReturnAmount
 , DiscountAmount
 , TotalCost
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactSales
go

drop view vbi_FactSales_Rejects
go
Create view vbi_FactSales_Rejects
as
SELECT
 --   SalesSK
   SalesDateSK
 , SalesDate
 , ChannelSK
 , StoreSK
 , ProductSK
 , PromotionSK
 , GeographySK
 , SalesQuantity
 , ReturnQuantity
 , SalesAmount
 , ReturnAmount
 , DiscountAmount
 , TotalCost
 , RejectRow
 , RejectReason
 , RejectReasonCode
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactStore_Rejects
go

drop view vbi_FactStrategyPlan
go
Create view vbi_FactStrategyPlan
as
SELECT
 -- StrategyPlanSK
   PlanDateSK
 , PlanDatekey as PlanDate
 , EntityKey
 , ScenarioKey
 , AccountKey
 , ProductCategoryKey
 , PlanAmount
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM  FactStrategyPlan
go
drop view vbi_FactStrategyPlan_Rejects
go
Create view vbi_FactStrategyPlan_Rejects
as
SELECT
 -- StrategyPlanSK
   PlanDateSK
 , PlanDatekey as PlanDate
 , EntityKey
 , ScenarioKey
 , AccountKey
 , ProductCategoryKey
 , PlanAmount
 , RejectRow
 , RejectReason
 , RejectReasonCode
 -- , SOR_ID
 -- , SOR_LoadDate
 -- , SOR_UpdateDate
 --  , DIJob_ID
 --  , DICreate_Date
 --  , DIModified_Date
FROM FactStrategyPlan_Rejects
go

