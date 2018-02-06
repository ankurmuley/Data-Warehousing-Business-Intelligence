
-- create views for BI Retail_DW_Test 

use Retail_DW_Test
go


drop view vbi_DimCustomer
go
Create view vbi_DimCustomer
as
SELECT
  CustomerSK
 ,CustomerID
 ,CustomerKey
 ,CustomerLabel
 ,'Person' as CustomerType
 ,GeographySK
,case when MiddleName is not null then LastName+', '+FirstName+'  '+MiddleName
        else LastName+', '+FirstName
        end as CustomerName
FROM  Retail_DW.dbo.DimCustomer_Person
union
SELECT
 c. CustomerSK
 ,c.CustomerID
 ,c.CustomerKey
 ,c.CustomerLabel
 ,c.CustomerType
 ,c.GeographySK
 ,c.CompanyName as CustomerName
FROM   DimCustomer_Company c
go

drop view vbi_DimProductCategory
go
Create view vbi_DimProductCategory
as
SELECT
  ProductCategoryKey
 ,ProductCategoryLabel
 ,ProductCategoryName
 ,ProductCategoryDescription
FROM DimProduct
group by   
  ProductCategoryKey
 ,ProductCategoryLabel
 ,ProductCategoryName
 ,ProductCategoryDescription
go

drop view vbi_DimDate_Sales
go
Create view vbi_DimDate_Sales
as
SELECT
  DateSK as SalesDateSK
 ,FullDateAK as SalesDate
 ,FullDateTimeAK
 ,YearID
 ,MonthID
 ,DayID
 ,YearQtr
 ,YearMonth
 ,DayOfYear
 ,WeekOfYear
 ,DayofWeek
 ,MonthAbr
 ,MonthChar
 ,MonthOfQuarter
 ,Quarter
 ,FirstDayOfYear
 ,LastDayOfYear
 ,IsWeekday
 ,IsHolidayUSA
 ,HolidayUSA
 ,EuropeSeason
 ,NorthAmericaSeason
 ,AsiaSeason
FROM DimDate
where datesk >= 20120101 and datesk < 20150101
go

drop view vbi_DimDate_OnlineSales
go
Create view vbi_DimDate_OnlineSales
as
SELECT
  DateSK as OnlineSalesDateSK
 ,FullDateAK as OnlineSalesDate
 ,FullDateTimeAK
 ,YearID
 ,MonthID
 ,DayID
 ,YearQtr
 ,YearMonth
 ,DayOfYear
 ,WeekOfYear
 ,DayofWeek
 ,MonthAbr
 ,MonthChar
 ,MonthOfQuarter
 ,Quarter
 ,FirstDayOfYear
 ,LastDayOfYear
 ,IsWeekday
 ,IsHolidayUSA
 ,HolidayUSA
 ,EuropeSeason
 ,NorthAmericaSeason
 ,AsiaSeason
FROM DimDate
where datesk >= 20120101 and datesk < 20150101
go

drop view vbi_DimAccount
go
Create view vbi_DimAccount
as
SELECT
  AccountSK
 --,AccountKey
 ,ParentAccountSK
 --,ParentAccountKey
 ,AccountLabel
 ,AccountName
 ,AccountDescription
 ,AccountType
 ,Operator
 ,CustomMembers
 ,ValueType
 ,CustomMemberOptions
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM DimAccount
go
drop view vbi_DimChannel
go
Create view vbi_DimChannel
as
SELECT
  ChannelSK
 --,ChannelKey
 ,ChannelLabel
 ,ChannelName
 ,ChannelDescription
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimChannel
go
drop view vbi_DimCurrency
go
Create view vbi_DimCurrency
as
SELECT
  CurrencySK
 --,CurrencyKey
 ,CurrencyLabel
 ,CurrencyName
 ,CurrencyDescription
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM DimCurrency
go
drop view vbi_DimCustomer_Company
go
Create view vbi_DimCustomer_Company
as
SELECT
  CustomerSK
 -- ,CustomerID
 -- ,CustomerKey
 ,CustomerLabel
 ,GeographySK
 ,YearlyIncome
 ,CustomerType
 ,CompanyName
 -- ,GeographyKey
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM DimCustomer_Company
go
drop view vbi_DimCustomer_Person
go
Create view vbi_DimCustomer_Person
as
SELECT
  CustomerSK
--  ,CustomerID
--  ,CustomerKey
 ,CustomerLabel
 ,GeographySK
,case when MiddleName is not null then LastName+', '+FirstName+'  '+MiddleName
        else LastName+', '+FirstName
        end as CustomerName
-- ,Title
-- ,FirstName
-- ,MiddleName
-- ,LastName
-- ,NameStyle
 ,BirthDate
 ,MaritalStatus
-- ,Suffix
 ,Gender 
-- ,EmailAddress
 ,YearlyIncome
 ,TotalChildren
 ,NumberChildrenAtHome
 ,Education
 ,Occupation
 ,HouseOwnerFlag
 ,NumberCarsOwned
--  ,AddressLine1
--  ,AddressLine2
--  ,Phone
 ,DateFirstPurchase
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM DimCustomer_Person
go
drop view vbi_DimDate
go
Create view vbi_DimDate
as
SELECT
  DateSK
 ,FullDateAK
 ,FullDateTimeAK
 ,YearID
 ,MonthID
 ,DayID
 ,YearQtr
 ,YearMonth
 ,DayOfYear
 ,WeekOfYear
 ,DayofWeek
 ,MonthAbr
 ,DayAbr
 ,MonthFull
 ,DayFull
 ,FullDateUSA
 ,DayOfMonth
 ,DaySuffix
 ,DayName
 ,DayOfWeekUSA
 ,DayOfWeekInMonth
 ,DayOfWeekInYear
 ,DayOfQuarter
 ,DayOfYearChar
 ,WeekOfMonth
 ,WeekOfQuarter
 ,WeekOfYearChar
 ,MonthChar
 ,MonthName
 ,MonthOfQuarter
 ,Quarter
 ,QuarterName
 ,YearChar
 ,YearName
 ,MonthYear
 ,MMYYYY
 ,FirstDayOfMonth
 ,LastDayOfMonth
 ,FirstDayOfQuarter
 ,LastDayOfQuarter
 ,FirstDayOfYear
 ,LastDayOfYear
 ,IsWeekday
 ,IsHolidayUSA
 ,HolidayUSA
 ,EuropeSeason
 ,NorthAmericaSeason
 ,AsiaSeason
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM DimDate
go
drop view vbi_DimEmployee
go
Create view vbi_DimEmployee
as
SELECT
  EmployeeSK
 -- ,EmployeeKey
 ,ParentEmployeeSK
 -- ,ParentEmployeeKey
,case when MiddleName is not null then LastName+', '+FirstName+'  '+MiddleName
        else LastName+', '+FirstName
        end as EmplyeeName
-- ,FirstName
-- ,LastName
-- ,MiddleName
-- ,Title
 ,HireDate as EmployeeHireDate
 ,BirthDate as EmployeeBirthDate
--  ,EmailAddress
--  ,Phone
 ,MaritalStatus as EmplyeeMaritalStatus
--  ,EmergencyContactName
--  ,EmergencyContactPhone
 ,Gender as EmployeeGender
 ,PayFrequency
 ,BaseRate
 ,VacationHours
 ,SalariedFlag
 ,CurrentFlag as EmployeeCurrentFlag
 ,SalesPersonFlag
 ,DepartmentName
 ,StartDate as EmployeeStartDate
 ,EndDate as EmployeeEndDate
 ,Status as EmployeeStatus
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimEmployee
go
drop view vbi_DimEntity
go
Create view vbi_DimEntity
as
SELECT
  EntitySK
 --,EntityKey
 ,EntityLabel
 ,ParentEntitySK
 -- ,ParentEntityKey
 ,ParentEntityLabel
 ,EntityName
 ,EntityDescription
 ,EntityType
 ,StartDate as EntityStartDate
 ,EndDate as EntityEndDate
 ,Status as EntityStatus
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimEntity
go
drop view vbi_DimGeography
go
Create view vbi_DimGeography
as
SELECT
  GeographySK
--  ,GeographyKey
--  ,GeographyType
 ,ContinentName
 ,ContinentCode
 ,Country
 ,Country_name as Country_Formal
-- ,RegionCountryName
-- ,ISO_3166_numeric
 ,ISO_3166_alpha_2
 ,ISO_3166_alpha_3
-- ,Region
 ,Subdiv_name as Region_State_Province
 ,ISO_3166_2_subdiv
 ,Subdiv_code
-- ,StateProvinceName
 --,StateProvinceCode
 ,City
 ,CityName as City_AltName
 --,Latitude
 --,Longitude
 ,Latitude_Geometry
 ,Longitude_Geometry
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimGeography
go
drop view vbi_DimProduct
go
Create view vbi_DimProduct
as
SELECT
  ProductSK
--  ,ProductKey
 ,Product_ID
 ,Brand_ID
 ,ProductLabel
 ,ProductName
 ,ProductDescription
 ,ProductSubcategoryKey
 ,ProductSubcategoryLabel
 ,ProductSubcategoryName
 ,ProductSubcategoryDescription
 ,ProductCategoryKey
 ,ProductCategoryLabel
 ,ProductCategoryName
 ,ProductCategoryDescription
 ,Manufacturer
 ,BrandName
 ,ClassID
 ,ClassName
 ,StyleID
 ,StyleName
 ,ColorID
 ,ColorName
 ,ProductSize
 ,SizeRange
 ,SizeUnitMeasureID
 ,Weight as ProductWeight
 ,WeightUnitMeasureID
 ,UnitOfMeasureID
 ,UnitOfMeasureName
 ,StockTypeID
 ,StockTypeName
 ,AvailableForSaleDate
 ,StopSaleDate
 ,Status as Product
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM DimProduct
go

drop view vbi_DimProductCost
go
Create view vbi_DimProductCost
as
SELECT
--   SCD_ProductCostSK
  ProductSK
 ,CurrencyKey
 ,UnitCost
 ,SCD_EffectiveDate
 ,SCD_IneffectiveDate
 ,SCD_Current_Flag
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimProductCost
go
drop view vbi_DimProductPrice
go
Create view vbi_DimProductPrice
as
SELECT
--   SCD_ProductPriceSK
  ProductSK
 ,CurrencyKey
 ,UnitPrice
 ,SCD_EffectiveDate
 ,SCD_IneffectiveDate
 ,SCD_Current_Flag
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimProductPrice
go
drop view vbi_DimPromotion
go
Create view vbi_DimPromotion
as
SELECT
  PromotionSK
--  ,PromotionID
 -- ,PromotionKey
 ,PromotionLabel
 ,PromotionName
 ,PromotionDescription
 ,DiscountPercent as PromotionDiscountPercent
 ,PromotionType 
 ,PromotionCategory
 ,StartDate as PromotionStartDate
 ,EndDate as PromotionEndDate
--  ,MinQuantity
--  ,MaxQuantity
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimPromotion
go
drop view vbi_DimSalesTerritory
go
Create view vbi_DimSalesTerritory
as
SELECT
  SalesTerritorySK
 -- ,SalesTerritoryKey
 ,GeographySK
 ,SalesTerritoryLabel
 ,SalesTerritoryName
 ,SalesTerritoryRegion
 ,SalesTerritoryCountry
 ,SalesTerritoryGroup
 ,SalesTerritoryLevel
 ,SalesTerritoryManager
 ,StartDate as SalesTerritoryStartDate
 ,EndDate as SalesTerritoryEndDate 
 ,Status as SalesTerritoryStatus 
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimSalesTerritory
go
drop view vbi_DimScenario
go
Create view vbi_DimScenario
as
SELECT
  ScenarioSK
 -- ,ScenarioKey
 ,ScenarioLabel
 ,ScenarioName
 ,ScenarioDescription
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  DimScenario
go
drop view vbi_DimStore
go
Create view vbi_DimStore
as
SELECT
  StoreSK
--  ,StoreID
--  ,StoreKey
 ,SalesTerritorySK
 ,GeographySK
 ,EntityKey
 ,StoreManager
 ,StoreType
 ,StoreName
 ,StoreDescription
 ,Status as Store
 ,OpenDate as StoreOpenDate
 ,CloseDate as StoreCloseDate
 ,CloseReason as StoreCloseReason
 ,EmployeeCount
 ,SellingAreaSize
 ,LastRemodelDate
 ,ZipCode
 ,ZipCodeExtension
 --,StorePhone
 --,StoreFax
 --,AddressLine1
 --,AddressLine2
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
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
 ,CurrencyDateKey
 -- ,CurrencySK
 ,EndOfDayRate
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactExchangeRate
go
drop view vbi_FactInventory
go
Create view vbi_FactInventory
as
SELECT
--   InventorySK
  InventoryDateSK
 ,InventoryDate
 ,StoreSK
 ,ProductSK
 ,GeographySK
 ,OnHandQuantity
 ,OnOrderQuantity
 ,SafetyStockQuantity
 ,DaysInStock
 ,MinDayInStock
 ,MaxDayInStock
 ,Aging
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactInventory
go
drop view vbi_FactInventory_Rejects
go
Create view vbi_FactInventory_Rejects
as
SELECT
 --  InventorySK
  InventoryDateSK
 ,InventoryDate
 ,StoreSK
 ,ProductSK
 ,GeographySK
 ,OnHandQuantity
 ,OnOrderQuantity
 ,SafetyStockQuantity
 ,DaysInStock
 ,MinDayInStock
 ,MaxDayInStock
 ,Aging
 ,RejectRow
 ,RejectReason
 ,RejectReasonCode
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM FactInventory_Rejects
go
drop view vbi_FactOnlineSales
go
Create view vbi_FactOnlineSales
as
SELECT
 --  SalesSK
  SalesDateSK
 ,SalesDate
 ,ChannelSK
 ,StoreSK
 ,ProductSK
 ,PromotionSK
 ,GeographySK
 ,SalesOrderNumber
 ,SalesOrderLineNumber
 ,SalesQuantity
 ,ReturnQuantity
 ,SalesAmount
 ,ReturnAmount
 ,DiscountAmount
 ,TotalCost
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM   FactOnlineSales
go
drop view vbi_FactOnlineSales_Rejects
go
Create view vbi_FactOnlineSales_Rejects
as
SELECT
--   SalesSK
  SalesDateSK
 ,SalesDate
 ,ChannelSK
 ,StoreSK
 ,ProductSK
 ,PromotionSK
 ,GeographySK
 ,SalesOrderNumber
 ,SalesOrderLineNumber
 ,SalesQuantity
 ,ReturnQuantity
 ,SalesAmount
 ,ReturnAmount
 ,DiscountAmount
 ,TotalCost
 ,RejectRow
 ,RejectReason
 ,RejectReasonCode
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactOnlineSales_Rejects
go
drop view vbi_FactSalesQuota
go
Create view vbi_FactSalesQuota
as
SELECT
 -- SalesQuotaSK
-- ,SalesQuotaKey
  ChannelSK
 ,StoreSK
 ,ProductSK
 ,QuotaDateSK
 ,QuotaDateKey
 ,CurrencySK
 ,ScenarioSK
 ,SalesQuantityQuota
 ,GrossMarginPct
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactSalesQuota
go
drop view vbi_FactSalesQuota_Rejects
go
Create view vbi_FactSalesQuota_Rejects
as
SELECT
 -- SalesQuotaSK
-- ,SalesQuotaKey
  ChannelSK
 ,StoreSK
 ,ProductSK
 ,QuotaDateSK
 ,QuotaDateKey
 ,CurrencySK
 ,ScenarioSK
 ,SalesQuantityQuota
 ,GrossMarginPct
 ,RejectRow
 ,RejectReason
 ,RejectReasonCode
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM FactSalesQuota_Rejects
go
drop view vbi_FactStoreSales
go
Create view vbi_FactStoreSales
as
SELECT
 --   SalesSK
  SalesDateSK
 ,SalesDate
 ,ChannelSK
 ,StoreSK
 ,ProductSK
 ,PromotionSK
 ,GeographySK
 ,SalesQuantity
 ,ReturnQuantity
 ,SalesAmount
 ,ReturnAmount
 ,DiscountAmount
 ,TotalCost
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactStoreSales
go
drop view vbi_FactStoreSales_Rejects
go
Create view vbi_FactStoreSales_Rejects
as
SELECT
 --   SalesSK
  SalesDateSK
 ,SalesDate
 ,ChannelSK
 ,StoreSK
 ,ProductSK
 ,PromotionSK
 ,GeographySK
 ,SalesQuantity
 ,ReturnQuantity
 ,SalesAmount
 ,ReturnAmount
 ,DiscountAmount
 ,TotalCost
 ,RejectRow
 ,RejectReason
 ,RejectReasonCode
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactStoreSales_Rejects
go
drop view vbi_FactStrategyPlan
go
Create view vbi_FactStrategyPlan
as
SELECT
 -- StrategyPlanSK
  PlanDateSK
 ,PlanDatekey as PlanDate
 ,EntityKey
 ,ScenarioKey
 ,AccountKey
 ,ProductCategoryKey
 ,PlanAmount
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactStrategyPlan
go
drop view vbi_FactStrategyPlan_Rejects
go
Create view vbi_FactStrategyPlan_Rejects
as
SELECT
 -- StrategyPlanSK
  PlanDateSK
 ,PlanDatekey as PlanDate
 ,EntityKey
 ,ScenarioKey
 ,AccountKey
 ,ProductCategoryKey
 ,PlanAmount
 ,RejectRow
 ,RejectReason
 ,RejectReasonCode
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM FactStrategyPlan_Rejects
go

------------------- wip 
drop view vbi_FactStoreSales_2
go
Create view vbi_FactStoreSales_2
as
SELECT
 --   SalesSK
  SalesDateSK
 ,SalesDate
 ,ChannelSK
 ,StoreSK
 ,ProductSK
 ,PromotionSK
 ,GeographySK
 ,SalesQuantity
 ,ReturnQuantity
 ,SalesAmount
 ,ReturnAmount
 ,DiscountAmount
 ,TotalCost
 -- ,SOR_ID
 -- ,SOR_LoadDate
 -- ,SOR_UpdateDate
 --  ,DIJob_ID
 --  ,DICreate_Date
 --  ,DIModified_Date
FROM  FactStoreSales_2
go
