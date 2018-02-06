--- RETAIL_DW Schema
--- Rick Sherman
--- Modified: 2016-12-04 This schema will be augmented with additional tables and views


CREATE TABLE dbo.DimChannel
(
    ChannelSK          int           NOT NULL,
    ChannelLabel       nvarchar(100) NOT NULL,
    ChannelName        nvarchar(20)  NULL,
    ChannelDescription nvarchar(50)  NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (ChannelSK)
)
go

CREATE TABLE dbo.DimCurrency
(
    CurrencySK          int          NOT NULL,
    CurrencyLabel       nvarchar(10) NOT NULL,
    CurrencyName        nvarchar(20) NOT NULL,
    CurrencyDescription nvarchar(50) NOT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (CurrencySK)
)
go

CREATE TABLE dbo.DimCustomer_Company
(
    CustomerSK       int           IDENTITY,
    CustomerID       int           NOT NULL,
    CustomerKey      int           NOT NULL,
    CustomerLabel    nchar(5)      NOT NULL,
    GeographySK      int           NOT NULL,
    YearlyIncome     numeric(15,2) NULL,
    CustomerType     nvarchar(15)  NULL,
    CompanyName      nvarchar(100) NULL,
    GeographyKey     int           NOT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (CustomerSK)
)
go

CREATE TABLE dbo.DimCustomer_Person
(
    CustomerSK           int           IDENTITY(1001,1),
    CustomerID           int           NOT NULL,
    CustomerKey          int           NOT NULL,
    CustomerLabel        nchar(5)      NOT NULL,
    GeographySK          int           NOT NULL,
    Title                nvarchar(8)   NULL,
    FirstName            nvarchar(50)  NULL,
    MiddleName           nvarchar(50)  NULL,
    LastName             nvarchar(50)  NULL,
    NameStyle            bit           NULL,
    BirthDate            date          NULL,
    MaritalStatus        nchar(1)      NULL,
    Suffix               nvarchar(10)  NULL,
    Gender               nvarchar(1)   NULL,
    EmailAddress         nvarchar(50)  NULL,
    YearlyIncome         numeric(15,2) NULL,
    TotalChildren        int           NULL,
    NumberChildrenAtHome int           NULL,
    Education            nvarchar(40)  NULL,
    Occupation           nvarchar(100) NULL,
    HouseOwnerFlag       nchar(1)      NULL,
    NumberCarsOwned      int           NULL,
    AddressLine1         nvarchar(120) NULL,
    AddressLine2         nvarchar(120) NULL,
    Phone                nvarchar(20)  NULL,
    DateFirstPurchase    date          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (CustomerSK)
)
go

CREATE TABLE dbo.DimDate
(
    DateSK             int          NOT NULL,
    FullDateAK         date         NULL,
    FullDateTimeAK     datetime     NULL,
    YearID             int          NULL,
    MonthID            int          NULL,
    DayID              int          NULL,
    YearQtr            int          NULL,
    YearMonth          int          NULL,
    DayOfYear          int          NULL,
    WeekOfYear         int          NULL,
    DayofWeek          int          NULL,
    MonthAbr           char(3)      NULL,
    DayAbr             char(3)      NULL,
    MonthFull          varchar(12)  NULL,
    DayFull            varchar(12)  NULL,
    FullDateUSA        char(10)     NULL,
    DayOfMonth         varchar(2)   NULL,
    DaySuffix          varchar(4)   NULL,
    DayName            varchar(9)   NULL,
    DayOfWeekUSA       char(1)      NULL,
    DayOfWeekInMonth   varchar(2)   NULL,
    DayOfWeekInYear    varchar(2)   NULL,
    DayOfQuarter       varchar(3)   NULL,
    DayOfYearChar      varchar(3)   NULL,
    WeekOfMonth        varchar(1)   NULL,
    WeekOfQuarter      varchar(2)   NULL,
    WeekOfYearChar     varchar(2)   NULL,
    MonthChar          varchar(2)   NULL,
    MonthName          varchar(9)   NULL,
    MonthOfQuarter     varchar(2)   NULL,
    Quarter            char(1)      NULL,
    QuarterName        varchar(9)   NULL,
    YearChar           char(4)      NULL,
    YearName           char(7)      NULL,
    MonthYear          char(10)     NULL,
    MMYYYY             char(6)      NULL,
    FirstDayOfMonth    date         NULL,
    LastDayOfMonth     date         NULL,
    FirstDayOfQuarter  date         NULL,
    LastDayOfQuarter   date         NULL,
    FirstDayOfYear     date         NULL,
    LastDayOfYear      date         NULL,
    IsWeekday          bit          NULL,
    IsHolidayUSA       bit          NULL,
    HolidayUSA         varchar(50)  NULL,
    EuropeSeason       varchar(50)  NULL,
    NorthAmericaSeason varchar(50)  NULL,
    AsiaSeason         varchar(50)  NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (DateSK)
)
go

CREATE TABLE dbo.DimGeography
(
    GeographySK        int            IDENTITY,
    GeographyKey       int            NOT NULL,
    GeographyType      nvarchar(50)   NOT NULL,
    ContinentName      nvarchar(50)   NOT NULL,
    ContinentCode      nchar(2)       NULL,
    Country            nvarchar(100)  NULL,
    Country_name       nvarchar(100)  NULL,
    RegionCountryName  nvarchar(100)  NULL,
    ISO_3166_numeric   int            NULL,
    ISO_3166_alpha_2   nchar(2)       NULL,
    ISO_3166_alpha_3   nchar(3)       NULL,
    Region             nvarchar(100)  NULL,
    Subdiv_name        nvarchar(100)  NOT NULL,
    ISO_3166_2_subdiv  varchar(10)    NOT NULL,
    Subdiv_code        nvarchar(10)   NOT NULL,
    StateProvinceName  nvarchar(100)  NULL,
    StateProvinceCode  nvarchar(3)    NULL,
    City               nvarchar(100)  NULL,
    CityName           nvarchar(100)  NULL,
    Latitude           decimal(28,10) NULL,
    Longitude          decimal(28,10) NULL,
    Latitude_Geometry  decimal(28,10) NULL,
    Longitude_Geometry decimal(28,10) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (GeographySK)
)
go

CREATE TABLE dbo.DimProduct
(
    ProductSK                     int           IDENTITY,
    ProductKey                    int           NOT NULL,
    Product_ID                    nvarchar(24)  NOT NULL,
    Brand_ID                      nvarchar(24)  NOT NULL,
    ProductLabel                  nvarchar(24)  NOT NULL,
    ProductName                   nvarchar(500) NULL,
    ProductDescription            nvarchar(400) NULL,
    ProductSubcategoryKey         int           NULL,
    ProductSubcategoryLabel       nvarchar(100) NULL,
    ProductSubcategoryName        nvarchar(50)  NOT NULL,
    ProductSubcategoryDescription nvarchar(100) NULL,
    ProductcategoryKey            int           NULL,
    ProductCategoryLabel          nvarchar(100) NOT NULL,
    ProductCategoryName           nvarchar(30)  NOT NULL,
    ProductCategoryDescription    nvarchar(50)  NOT NULL,
    Manufacturer                  nvarchar(50)  NULL,
    BrandName                     nvarchar(50)  NULL,
    ClassID                       nvarchar(10)  NULL,
    ClassName                     nvarchar(20)  NULL,
    StyleID                       nvarchar(10)  NULL,
    StyleName                     nvarchar(20)  NULL,
    ColorID                       nvarchar(10)  NULL,
    ColorName                     nvarchar(20)  NULL,
    ProductSize                   nvarchar(50)  NULL,
    SizeRange                     nvarchar(50)  NULL,
    SizeUnitMeasureID             nvarchar(20)  NULL,
    Weight                        float(53)     NULL,
    WeightUnitMeasureID           nvarchar(20)  NULL,
    UnitOfMeasureID               nvarchar(10)  NULL,
    UnitOfMeasureName             nvarchar(40)  NULL,
    StockTypeID                   nvarchar(10)  NULL,
    StockTypeName                 nvarchar(40)  NULL,
    AvailableForSaleDate          datetime      NULL,
    StopSaleDate                  datetime      NULL,
    Status                        nvarchar(7)   NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (ProductSK)
)
go

CREATE TABLE dbo.DimProductCost
(
    SCD_ProductCostSK   int           IDENTITY,
    ProductSK           int           NOT NULL,
    UnitCost            numeric(15,2) NULL,
    CurrencySK          int           DEFAULT 1 NOT NULL,
    SCD_EffectiveDate   date          NULL,
    SCD_IneffectiveDate date          NULL,
    SCD_Current_Flag    int           DEFAULT 1 NOT NULL,

    SOR_ID             int            DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SCD_ProductCostSK)
)
go
IF OBJECT_ID(N'dbo.DimProductCost') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.DimProductCost >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.DimProductCost >>>'
go
CREATE TABLE dbo.DimProductPrice
(
    SCD_ProductPriceSK  int           IDENTITY,
    ProductSK           int           NOT NULL,
    UnitPrice           numeric(15,2) NULL,
    CurrencyKey         int           DEFAULT 1 NOT NULL,
    SCD_EffectiveDate   date          NULL,
    SCD_IneffectiveDate date          NULL,
    SCD_Current_Flag    int           DEFAULT 1 NOT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SCD_ProductPriceSK)
)
go

CREATE TABLE dbo.DimPromotion
(
    PromotionSK          int           IDENTITY,
    PromotionID          int           NOT NULL,
    PromotionKey         int           NOT NULL,
    PromotionLabel       nvarchar(12)  NOT NULL,
    PromotionName        nvarchar(100) NULL,
    PromotionDescription nvarchar(255) NULL,
    DiscountPercent      float(53)     NULL,
    PromotionType        nvarchar(50)  NULL,
    PromotionCategory    nvarchar(50)  NULL,
    StartDate            date          NOT NULL,
    EndDate              date          NULL,
    MinQuantity          int           NULL,
    MaxQuantity          int           NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (PromotionSK)
)
go

CREATE TABLE dbo.DimSalesTerritory
(
    SalesTerritorySK      int           IDENTITY,
    SalesTerritoryKey     int           NOT NULL,
    GeographySK           int           NOT NULL,
    SalesTerritoryLabel   nvarchar(100) NULL,
    SalesTerritoryName    nvarchar(50)  NOT NULL,
    SalesTerritoryRegion  nvarchar(50)  NOT NULL,
    SalesTerritoryCountry nvarchar(50)  NOT NULL,
    SalesTerritoryGroup   nvarchar(50)  NULL,
    SalesTerritoryLevel   nvarchar(10)  NULL,
    SalesTerritoryManager int           NULL,
    StartDate             datetime      NULL,
    EndDate               datetime      NULL,
    Status                nvarchar(50)  NULL,
    ETLLoadID             int           NULL,
    LoadDate              datetime      NULL,
    UpdateDate            datetime      NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SalesTerritorySK),
    UNIQUE NONCLUSTERED (SalesTerritoryLabel)
)
go

CREATE TABLE dbo.DimStore
(
    StoreSK          int           IDENTITY,
    StoreID          int           NOT NULL,
    StoreKey         int           NOT NULL,
    StoreManager     int           NULL,
    StoreType        nvarchar(15)  NULL,
    StoreName        nvarchar(100) NOT NULL,
    StoreDescription nvarchar(300) NOT NULL,
    Status           nvarchar(20)  NOT NULL,
    OpenDate         datetime      NOT NULL,
    CloseDate        datetime      NULL,
    EntityKey        int           NULL,
    ZipCode          nvarchar(20)  NULL,
    ZipCodeExtension nvarchar(10)  NULL,
    StorePhone       nvarchar(15)  NULL,
    StoreFax         nvarchar(14)  NULL,
    AddressLine1     nvarchar(100) NULL,
    AddressLine2     nvarchar(100) NULL,
    GeographySK      int           NOT NULL,
    CloseReason      nvarchar(20)  NULL,
    EmployeeCount    int           NULL,
    SellingAreaSize  float(53)     NULL,
    LastRemodelDate  datetime      NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (StoreSK)
)
go

CREATE TABLE dbo.FactExchangeRate
(
    ExchangeRateSK   int           IDENTITY,
    CurrencyDateSK   int           NULL,
    CurrencyDateKey  date          NOT NULL,
    CurrencySK       int           NOT NULL,
    EndOfDayRate     numeric(19,4) NOT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (ExchangeRateSK)
)
go

CREATE TABLE dbo.FactInventory
(
    InventorySK         int          IDENTITY,
    InventoryDateSK     int          NULL,
    InventoryDate       date         NULL,
    StoreSK             int          NULL,
    ProductSK           int          NULL,
    GeographySK         int          NULL,
    OnHandQuantity      int          NULL,
    OnOrderQuantity     int          NULL,
    SafetyStockQuantity int          NULL,
    DaysInStock         int          NULL,
    MinDayInStock       int          NULL,
    MaxDayInStock       int          NULL,
    Aging               int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (InventorySK)
)
go

CREATE TABLE dbo.FactInventory_Rejects
(
    InventorySK         int          IDENTITY,
    InventoryDateSK     int          NOT NULL,
    InventoryDate       date         NOT NULL,
    StoreSK             int          NOT NULL,
    ProductSK           int          NOT NULL,
    GeographySK         int          NOT NULL,
    OnHandQuantity      int          NOT NULL,
    OnOrderQuantity     int          NOT NULL,
    SafetyStockQuantity int          NULL,
    DaysInStock         int          NULL,
    MinDayInStock       int          NULL,
    MaxDayInStock       int          NULL,
    Aging               int          NULL,

    RejectRow           int          DEFAULT 1 NULL,
    RejectReason        nvarchar(50) NULL,
    RejectReasonCode    int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (InventorySK)
)
go

CREATE TABLE dbo.FactOnlineSales
(
    SalesSK              int           IDENTITY,
    SalesDateSK          int           NOT NULL,
    SalesDate            date          NOT NULL,
    StoreSK              int           NOT NULL,
    ProductSK            int           NOT NULL,
    PromotionSK          int           NOT NULL,
    GeographySK          int           NOT NULL,
    SalesOrderNumber     nvarchar(20)  NULL,
    SalesOrderLineNumber int           NULL,
    SalesQuantity        int           NOT NULL,
    ReturnQuantity       int           NULL,
    SalesAmount          numeric(15,2) NOT NULL,
    ReturnAmount         numeric(15,2) NULL,
    DiscountAmount       numeric(15,2) NULL,
    TotalCost            numeric(15,2) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SalesSK)
)
go

CREATE TABLE dbo.FactOnlineSales_Rejects
(
    SalesSK              int           IDENTITY,
    SalesDateSK          int           NULL,
    SalesDate            date          NULL,
    ChannelSK            int           NULL,
    StoreSK              int           NULL,
    ProductSK            int           NULL,
    PromotionSK          int           NULL,
    GeographySK          int           NULL,
    SalesOrderNumber     nvarchar(20)  NULL,
    SalesOrderLineNumber int           NULL,
    SalesQuantity        int           NULL,
    ReturnQuantity       int           NULL,
    SalesAmount          numeric(15,2) NULL,
    ReturnAmount         numeric(15,2) NULL,
    DiscountAmount       numeric(15,2) NULL,
    TotalCost            numeric(15,2) NULL,

    RejectRow           int          DEFAULT 1 NULL,
    RejectReason        nvarchar(50) NULL,
    RejectReasonCode    int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SalesSK)
)
go

CREATE TABLE dbo.FactSalesQuota
(
    SalesQuotaSK        int           IDENTITY,
    ChannelSK           int           NOT NULL,
    StoreSK             int           NOT NULL,
    ProductSK           int           NOT NULL,
    DateKey             date          NOT NULL,
    CurrencySK          int           NOT NULL,
    ScenarioSK          int           NOT NULL,
    SalesQuantityQuota  numeric(15,2) NOT NULL,
    SalesAmountQuota    numeric(15,2) NOT NULL,
    GrossMarginQuota    numeric(15,2) NOT NULL,
    GrossMarginPctQuota numeric(10,4) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SalesQuotaSK)
)
go

CREATE TABLE dbo.FactSalesQuota_Rejects
(
    SalesQuotaSK        int           IDENTITY,
    ChannelSK           int           NULL,
    StoreSK             int           NULL,
    ProductSK           int           NULL,
    DateKey             date          NULL,
    CurrencySK          int           NULL,
    ScenarioSK          int           NULL,
    SalesQuantityQuota  numeric(15,2) NULL,
    SalesAmountQuota    numeric(15,2) NULL,
    GrossMarginQuota    numeric(15,2) NULL,
    GrossMarginPctQuota numeric(10,4) NULL,

    RejectRow           int          DEFAULT 1 NULL,
    RejectReason        nvarchar(50) NULL,
    RejectReasonCode    int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SalesQuotaSK)
)
go

CREATE TABLE dbo.FactStoreSales
(
    SalesSK          int           IDENTITY,
    SalesDateSK      int           NOT NULL,
    SalesDate        date          NOT NULL,
    ChannelSK        int           NOT NULL,
    StoreSK          int           NOT NULL,
    ProductSK        int           NOT NULL,
    PromotionSK      int           NOT NULL,
    GeographySK      int           NOT NULL,
    SalesQuantity    int           NOT NULL,
    ReturnQuantity   int           NULL,
    SalesAmount      numeric(15,2) NOT NULL,
    ReturnAmount     numeric(15,2) NULL,
    DiscountAmount   numeric(15,2) NULL,
    TotalCost        numeric(15,2) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,

    PRIMARY KEY CLUSTERED (SalesSK)
)
go

CREATE TABLE dbo.FactStoreSales_Rejects
(
    SalesSK          int           IDENTITY,
    SalesDateSK      int           NULL,
    SalesDate        date          NULL,
    StoreSK          int           NULL,
    ProductSK        int           NULL,
    PromotionSK      int           NULL,
    GeographySK      int           NULL,
    SalesQuantity    int           NULL,
    ReturnQuantity   int           NULL,
    SalesAmount      numeric(15,2) NULL,
    ReturnAmount     numeric(15,2) NULL,
    DiscountAmount   numeric(15,2) NULL,
    TotalCost        numeric(15,2) NULL,

    RejectRow           int          DEFAULT 1 NULL,
    RejectReason        nvarchar(50) NULL,
    RejectReasonCode    int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime      NULL,
    SOR_UpdateDate     datetime      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT getdate() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT getdate() NOT NULL,
    PRIMARY KEY CLUSTERED (SalesSK)
)
go

