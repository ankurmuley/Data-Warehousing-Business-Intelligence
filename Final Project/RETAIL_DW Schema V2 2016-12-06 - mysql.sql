--- RETAIL_DW Schema
--- Rick Sherman
--- Modified: 
---    2016-12-04 This schema will be augmented with additional tables and views
---    2016-12-06 Added quota and strategy plan related tables
---    2016-12-06 Identified PKs, NKs (from SORs), AKs
---                Enterprise NKs are conformed while Geo NKs are specific to SOR


drop table DimChannel;

CREATE TABLE DimChannel
(
    ChannelSK          int           Auto_increment,  -- PK

    ChannelKey         int           NOT NULL,  -- Enterprise NK

    ChannelLabel       nvarchar(100) NOT NULL,
    ChannelName        nvarchar(20)  NULL,
    ChannelDescription nvarchar(50)  NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (ChannelSK)
);


drop table DimCurrency;

CREATE TABLE DimCurrency
(
    CurrencySK          int           Auto_increment,  -- PK

    CurrencyKey         int           NOT NULL,  -- Enterprise NK

    CurrencyLabel       nvarchar(10)  NOT NULL,
    CurrencyName        nvarchar(20)  NOT NULL,
    CurrencyDescription nvarchar(50)  NOT NULL,

    SOR_ID              int           DEFAULT -1 NOT NULL,
    SOR_LoadDate        datetime(3)      NULL,
    SOR_UpdateDate      datetime(3)      NULL,

    DI_Job_ID           nvarchar(20)  NOT NULL,
    DI_Create_Date      datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date    datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (CurrencySK)
);

drop table DimCustomer_Company;

CREATE TABLE DimCustomer_Company
(
    CustomerSK           int           Auto_increment,  -- PK

    CustomerID           int           NOT NULL,  -- Geo NK
    CustomerKey          int           NOT NULL,  -- Enterprise NK
    CustomerLabel        nchar(5)      NOT NULL,  -- NK AK

    GeographySK          int           NOT NULL, -- Outrigger PK
    YearlyIncome         numeric(15,2) NULL,
    CustomerType         nvarchar(15)  NULL,
    CompanyName          nvarchar(100) NULL,
    GeographyKey         int           NOT NULL,

    SOR_ID               int           DEFAULT -1 NOT NULL,
    SOR_LoadDate         datetime(3)      NULL,
    SOR_UpdateDate       datetime(3)      NULL,

    DI_Job_ID            nvarchar(20)  NOT NULL,
    DI_Create_Date       datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date     datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (CustomerSK)
);

drop table DimCustomer_Person;

CREATE TABLE DimCustomer_Person
(
    CustomerSK           int           AUTO_INCREMENT,  -- PK

    CustomerID           int           NOT NULL,  -- Geo NK
    CustomerKey          int           NOT NULL,  -- Enterprise NK
    CustomerLabel        nchar(5)      NOT NULL,  -- NK AK

    GeographySK          int           NOT NULL, -- Outrigger PK

    Title                nvarchar(8)   NULL,
    FirstName            nvarchar(50)  NULL,
    MiddleName           nvarchar(50)  NULL,
    LastName             nvarchar(50)  NULL,
    NameStyle            tinyint           NULL,
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
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (CustomerSK)
)
    auto_increment=1000;

drop table DimDate;

CREATE TABLE DimDate
(
    DateSK             int          NOT NULL, -- PK

    FullDateAK         date         NULL,  -- AK
    FullDateTimeAK     datetime(3)     NULL,  -- AK

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
    IsWeekday          int          NULL,
    IsHolidayUSA       int          NULL,
    HolidayUSA         varchar(50)  NULL,
    EuropeSeason       varchar(50)  NULL,
    NorthAmericaSeason varchar(50)  NULL,
    AsiaSeason         varchar(50)  NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (DateSK)
);

drop table DimGeography;

CREATE TABLE DimGeography
(
    GeographySK        int            Auto_increment,  -- PK

    GeographyKey       int            NOT NULL,  -- Enterprise NK

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
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (GeographySK)
);

drop table DimProduct;

CREATE TABLE DimProduct
(
    ProductSK                     int           Auto_increment,  -- PK

    ProductKey                    int           NOT NULL, -- Enterprise NK
    Product_ID                    nvarchar(24)  NOT NULL, -- Geo PK
    Brand_ID                      nvarchar(24)  NOT NULL, -- Geo PK
    ProductLabel                  nvarchar(24)  NOT NULL, -- Geo PK

    ProductName                   nvarchar(500) NULL,
    ProductDescription            nvarchar(400) NULL,

    ProductSubcategoryKey         int           NULL,
    ProductSubcategoryLabel       nvarchar(100) NULL,
    ProductSubcategoryName        nvarchar(50)  NOT NULL,
    ProductSubcategoryDescription nvarchar(100) NULL,

    ProductCategoryKey            int           NULL,
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
    Weight                        double     NULL,
    WeightUnitMeasureID           nvarchar(20)  NULL,
    UnitOfMeasureID               nvarchar(10)  NULL,
    UnitOfMeasureName             nvarchar(40)  NULL,
    StockTypeID                   nvarchar(10)  NULL,
    StockTypeName                 nvarchar(40)  NULL,
    AvailableForSaleDate          datetime(3)      NULL,
    StopSaleDate                  datetime(3)      NULL,
    Status                        nvarchar(7)   NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (ProductSK)
);

drop table DimProductCost;

CREATE TABLE DimProductCost
(
    SCD_ProductCostSK   int           Auto_increment,  -- PK

    ProductSK           int           NOT NULL,  -- FK
    CurrencyKey         int           NOT NULL,  -- FK 

    UnitCost            numeric(15,2) NULL,

    SCD_EffectiveDate   date          NULL,
    SCD_IneffectiveDate date          NULL,
    SCD_Current_Flag    int           DEFAULT 1 NOT NULL,

    SOR_ID             int            DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)       NULL,
    SOR_UpdateDate     datetime(3)       NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SCD_ProductCostSK)
);

drop table DimProductPrice;

CREATE TABLE DimProductPrice
(
    SCD_ProductPriceSK  int           Auto_increment,  -- PK

    ProductSK           int           NOT NULL,  -- FK
    CurrencyKey         int           NOT NULL,  -- FK 

    UnitPrice           numeric(15,2) NULL,

    SCD_EffectiveDate   date          NULL,
    SCD_IneffectiveDate date          NULL,
    SCD_Current_Flag    int           DEFAULT 1 NOT NULL,

    SOR_ID             int            DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)       NULL,
    SOR_UpdateDate     datetime(3)       NULL,
 
    DI_Job_ID          nvarchar(20)   NOT NULL,
    DI_Create_Date     datetime       DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime       DEFAULT now() NOT NULL,

    PRIMARY KEY (SCD_ProductPriceSK)
);

drop table DimPromotion;

CREATE TABLE DimPromotion
(
    PromotionSK          int           Auto_increment,  -- PK
    PromotionID          int           NOT NULL,  -- Geo NK
    PromotionKey         int           NOT NULL,   -- Enterprise NK

    PromotionLabel       nvarchar(12)  NOT NULL,
    PromotionName        nvarchar(100) NULL,
    PromotionDescription nvarchar(255) NULL,

    DiscountPercent      double     NULL,
    PromotionType        nvarchar(50)  NULL,
    PromotionCategory    nvarchar(50)  NULL,
    StartDate            date          NOT NULL,
    EndDate              date          NULL,
    MinQuantity          int           NULL,
    MaxQuantity          int           NULL,

    SOR_ID               int           DEFAULT -1 NOT NULL,
    SOR_LoadDate         datetime(3)      NULL,
    SOR_UpdateDate       datetime(3)      NULL,

    DI_Job_ID            nvarchar(20)  NOT NULL,
    DI_Create_Date       datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date     datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (PromotionSK)
);

drop table DimSalesTerritory;

CREATE TABLE DimSalesTerritory
(
    SalesTerritorySK      int           Auto_increment,  -- PK
    SalesTerritoryKey     int           NOT NULL,  -- Enterprise NK

    GeographySK           int           NOT NULL,  -- FK

    SalesTerritoryLabel   nvarchar(100) NULL,
    SalesTerritoryName    nvarchar(50)  NOT NULL,

    SalesTerritoryRegion  nvarchar(50)  NOT NULL,
    SalesTerritoryCountry nvarchar(50)  NOT NULL,
    SalesTerritoryGroup   nvarchar(50)  NULL,
    SalesTerritoryLevel   nvarchar(10)  NULL,

    SalesTerritoryManager int           NULL,

    StartDate             date          NULL,
    EndDate               date          NULL,
    Status                nvarchar(50)  NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SalesTerritorySK),
    UNIQUE (SalesTerritoryLabel)
);

drop table DimStore;

CREATE TABLE DimStore
(
    StoreSK           int           Auto_increment,  -- PK

    StoreID           int           NOT NULL,  -- Geo NK
    StoreKey          int           NOT NULL,  -- Enterprise NK

-- Stores are assigned to Sales Territories
    SalesTerritorySK   int           NULL,     -- FK added 2-16-12-05

    StoreManager       int           NULL,
    StoreType          nvarchar(15)  NULL,
    StoreName          nvarchar(100) NOT NULL,
    StoreDescription   nvarchar(300) NOT NULL,
    Status             nvarchar(20)  NOT NULL,
    OpenDate           date          NOT NULL,
    CloseDate          date          NULL,
    EntityKey          int           NULL,
    ZipCode            nvarchar(20)  NULL,
    ZipCodeExtension   nvarchar(10)  NULL,
    StorePhone         nvarchar(15)  NULL,
    StoreFax           nvarchar(14)  NULL,
    AddressLine1       nvarchar(100) NULL,
    AddressLine2       nvarchar(100) NULL,
    GeographySK        int           NOT NULL,
    CloseReason        nvarchar(20)  NULL,
    EmployeeCount      int           NULL,
    SellingAreaSize    double     NULL,
    LastRemodelDate    datetime(3)      NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (StoreSK)
);


drop table DimAccount;

CREATE TABLE DimAccount
(

    AccountSK           int           Auto_increment,  -- PK
    AccountKey          int           not null, -- Enterprise NK

    ParentAccountSK     int           NULL,
    ParentAccountKey    int           NULL,  -- put here to make easy

    AccountLabel        nvarchar(100) NULL,
    AccountName         nvarchar(50)  NULL,
    AccountDescription  nvarchar(50)  NULL,
    AccountType         nvarchar(50)  NULL,
    Operator            nvarchar(50)  NULL,
    CustomMembers       nvarchar(300) NULL,
    ValueType           nvarchar(50)  NULL,
    CustomMemberOptions nvarchar(200) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (AccountSK)
)
;

drop table DimEmployee;

CREATE TABLE DimEmployee
(
    EmployeeSK            int          Auto_increment,  -- PK
    EmployeeKey           int          not null,  -- Enterprise NK

    ParentEmployeeSK      int          NULL,
    ParentEmployeeKey     int          NULL,  -- put here to make easy

    FirstName             nvarchar(50) NOT NULL,
    LastName              nvarchar(50) NOT NULL,
    MiddleName            nvarchar(50) NULL,
    Title                 nvarchar(50) NULL,
    HireDate              date         NULL,
    BirthDate             date         NULL,
    EmailAddress          nvarchar(50) NULL,
    Phone                 nvarchar(25) NULL,
    MaritalStatus         nchar(1)     NULL,
    EmergencyContactName  nvarchar(50) NULL,
    EmergencyContactPhone nvarchar(25) NULL,
    Gender                nchar(1)     NULL,
    PayFrequency          int          NULL,
    BaseRate              numeric(15,2)        NULL,
    VacationHours         int          NULL,
    SalariedFlag          int          NULL,   -- bit
    CurrentFlag           int          NOT NULL, -- bit
    SalesPersonFlag       int          NOT NULL, -- bit
    DepartmentName        nvarchar(50) NULL,
    StartDate             date         NULL,
    EndDate               date         NULL,
    Status                nvarchar(50) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (EmployeeSK)
)
;

drop table DimEntity;

CREATE TABLE DimEntity
(
    EntitySK          int           Auto_increment,  -- PK
    EntityKey         int           not null,  -- Enterprise NK

    EntityLabel       nvarchar(100) NULL,

    ParentEntitySK    int           NULL,
    ParentEntityKey   int           NULL,
    ParentEntityLabel nvarchar(100) NULL,

    EntityName        nvarchar(50)  NULL,
    EntityDescription nvarchar(100) NULL,
    EntityType        nvarchar(100) NULL,
    StartDate         date          NULL,
    EndDate           date          NULL,
    Status            nvarchar(50)  DEFAULT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (EntitySK)
)
;

drop table DimScenario;

CREATE TABLE DimScenario
(
    ScenarioSK          int           Auto_increment,  -- PK
    ScenarioKey         int           not null,  -- Enterprise NK

    ScenarioLabel       nvarchar(100) NOT NULL,
    ScenarioName        nvarchar(20)  NULL,
    ScenarioDescription nvarchar(50)  NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (ScenarioSK)
);

-- --------------------------------------------
-- --              FACT TABLES 
-- --------------------------------------------


drop table FactExchangeRate;

CREATE TABLE FactExchangeRate
(
    ExchangeRateSK     int           Auto_increment,  -- PK

    CurrencyDateSK     int           NOT NULL,
    CurrencyDateKey    date          NOT NULL,
    CurrencySK         int           NOT NULL,

    EndOfDayRate       numeric(19,4) NOT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (ExchangeRateSK)
);

drop table FactInventory;

CREATE TABLE FactInventory
(
    InventorySK         int          Auto_increment,  -- PK

    InventoryDateSK     int          NOT NULL,  -- FK
    InventoryDate       date         NOT NULL,  -- FK
    StoreSK             int          NOT NULL,  -- FK
    ProductSK           int          NOT NULL,  -- FK
    GeographySK         int          NOT NULL,  -- FK

    OnHandQuantity      int          NULL,
    OnOrderQuantity     int          NULL,
    SafetyStockQuantity int          NULL,
    DaysInStock         int          NULL,
    MinDayInStock       int          NULL,
    MaxDayInStock       int          NULL,
    Aging               int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (InventorySK)
);

drop table FactInventory_Rejects;

CREATE TABLE FactInventory_Rejects
(
    InventorySK         int          Auto_increment,  -- PK

    InventoryDateSK     int          NOT NULL,  -- FK
    InventoryDate       date         NOT NULL,  -- FK
    StoreSK             int          NOT NULL,  -- FK
    ProductSK           int          NOT NULL,  -- FK
    GeographySK         int          NOT NULL,  -- FK

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
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (InventorySK)
);

drop table FactOnlineSales;

CREATE TABLE FactOnlineSales
(
    SalesSK              int           Auto_increment,  -- PK

    SalesDateSK          int           NULL,  -- FK
    SalesDate            date          NULL,  -- FK
    ChannelSK            int           NULL,  -- FK
    StoreSK              int           NULL,  -- FK
    ProductSK            int           NULL,  -- FK
    PromotionSK          int           NULL,  -- FK
    GeographySK          int           NULL,  -- FK

    SalesOrderNumber     nvarchar(20)  NULL,  -- NK combination
    SalesOrderLineNumber int           NULL,  -- NK combination

    SalesQuantity        int           NOT NULL,
    ReturnQuantity       int           NULL,
    SalesAmount          numeric(15,2) NOT NULL,
    ReturnAmount         numeric(15,2) NULL,
    DiscountAmount       numeric(15,2) NULL,
    TotalCost            numeric(15,2) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SalesSK)
);

drop table FactOnlineSales_Rejects;

CREATE TABLE FactOnlineSales_Rejects
(
    SalesSK              int           Auto_increment,  -- PK

    SalesDateSK          int           NULL,  -- FK
    SalesDate            date          NULL,  -- FK
    ChannelSK            int           NULL,  -- FK
    StoreSK              int           NULL,  -- FK
    ProductSK            int           NULL,  -- FK
    PromotionSK          int           NULL,  -- FK
    GeographySK          int           NULL,  -- FK

    SalesOrderNumber     nvarchar(20)  NULL,  -- NK combination
    SalesOrderLineNumber int           NULL,  -- NK combination

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
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SalesSK)
);

drop table FactStoreSales;

CREATE TABLE FactStoreSales
(
    SalesSK          int           Auto_increment,  -- PK

    SalesDateSK      int           NOT NULL,  -- FK
    SalesDate        date          NOT NULL,  -- FK
    ChannelSK        int           NOT NULL,  -- FK
    StoreSK          int           NOT NULL,  -- FK
    ProductSK        int           NOT NULL,  -- FK
    PromotionSK      int           NOT NULL,  -- FK
    GeographySK      int           NOT NULL,  -- FK

    SalesQuantity    int           NOT NULL,
    ReturnQuantity   int           NULL,
    SalesAmount      numeric(15,2) NOT NULL,
    ReturnAmount     numeric(15,2) NULL,
    DiscountAmount   numeric(15,2) NULL,
    TotalCost        numeric(15,2) NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SalesSK)
);

drop table FactStoreSales_Rejects;

CREATE TABLE FactStoreSales_Rejects
(
    SalesSK          int           Auto_increment,  -- PK

    SalesDateSK      int           NOT NULL,  -- FK
    SalesDate        date          NOT NULL,  -- FK
    ChannelSK        int           NOT NULL,  -- FK
    StoreSK          int           NOT NULL,  -- FK
    ProductSK        int           NOT NULL,  -- FK
    PromotionSK      int           NOT NULL,  -- FK
    GeographySK      int           NOT NULL,  -- FK

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
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesSK)
);

drop table FactSalesQuota;

CREATE TABLE FactSalesQuota
(
    SalesQuotaSK        int           Auto_increment,  -- PK

    SalesQuotaKey       int           not null,  -- NK

    ChannelSK           int           NOT NULL,  -- FK
    StoreSK             int           NOT NULL,  -- FK
    ProductSK           int           NOT NULL,  -- FK
    QuotaDateSK         int           NOT NULL,  -- FK
    QuotaDateKey        date          NOT NULL,  -- FK
    CurrencySK          int           NOT NULL,  -- FK
    ScenarioSK          int           NOT NULL,  -- FK

    SalesQuantityQuota  int           NOT NULL,
    -- -SalesAmountQuota    numeric(15,2) NULL,
    GrossMarginPct      numeric(15,4) NOT NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SalesQuotaSK)
);

drop table FactSalesQuota_Rejects;

CREATE TABLE FactSalesQuota_Rejects
(
    SalesQuotaSK        int           Auto_increment,  -- PK

    SalesQuotaKey       int           not null,  -- NK

    ChannelSK           int           NOT NULL,  -- FK
    StoreSK             int           NOT NULL,  -- FK
    ProductSK           int           NOT NULL,  -- FK
    QuotaDateSK         int           NOT NULL,  -- FK
    QuotaDateKey        date          NOT NULL,  -- FK
    CurrencySK          int           NOT NULL,  -- FK
    ScenarioSK          int           NOT NULL,  -- FK

    SalesQuantityQuota  int           NOT NULL,
    GrossMarginPct      numeric(15,4) NOT NULL,
   -- -     SalesAmountQuota    numeric(15,2) NULL,

    RejectRow           int          DEFAULT 1 NULL,
    RejectReason        nvarchar(50) NULL,
    RejectReasonCode    int          NULL,

    SOR_ID             int           DEFAULT -1 NOT NULL,
    SOR_LoadDate       datetime(3)      NULL,
    SOR_UpdateDate     datetime(3)      NULL,

    DI_Job_ID          nvarchar(20)  NOT NULL,
    DI_Create_Date     datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date   datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (SalesQuotaSK)
);

drop table FactStrategyPlan;

CREATE TABLE FactStrategyPlan
(
    StrategyPlanSK      int      Auto_increment,  -- PK

    PlanDateSK          int      NOT NULL,  -- FK
    PlanDatekey         date     NOT NULL,  -- FK
    EntityKey           int      NOT NULL,  -- FK
    ScenarioKey         int      NOT NULL,  -- FK
    AccountKey          int      NOT NULL,  -- FK
    ProductCategoryKey  int      NULL,      -- FK

    -- CurrencyKey        int      NOT NULL, -- ALWAYS 1 USD

    PlanAmount           numeric(15,2)    NOT NULL,


    SOR_ID               int          DEFAULT -1 NOT NULL,
    SOR_LoadDate         datetime(3)     NULL,
    SOR_UpdateDate       datetime(3)     NULL,

    DI_Job_ID            nvarchar(20)  NOT NULL,
    DI_Create_Date       datetime      DEFAULT now() NOT NULL,
    DI_Modified_Date     datetime      DEFAULT now() NOT NULL,

    PRIMARY KEY (StrategyPlanSK)

);

drop table FactStrategyPlan_Rejects;

CREATE TABLE FactStrategyPlan_Rejects
(
    StrategyPlanSK     int      Auto_increment,  -- PK

    PlanDateSK          int      NOT NULL,  -- FK
    PlanDatekey         date     NOT NULL,  -- FK
    EntityKey           int      NOT NULL,  -- FK
    ScenarioKey         int      NOT NULL,  -- FK
    AccountKey          int      NOT NULL,  -- FK
    ProductCategoryKey  int      NULL,      -- FK

    -- CurrencyKey        int      NOT NULL, -- ALWAYS 1 USD

    PlanAmount           numeric(15,2)    NOT NULL,

    RejectRow            int          DEFAULT 1 NULL,
    RejectReason         nvarchar(50) NULL,
    RejectReasonCode     int          NULL,

    SOR_ID               int          DEFAULT -1 NOT NULL,
    SOR_LoadDate         datetime(3)     NULL,
    SOR_UpdateDate       datetime(3)     NULL,

    DI_Job_ID            nvarchar(20) NOT NULL,
    DI_Create_Date       datetime     DEFAULT now() NOT NULL,
    DI_Modified_Date     datetime     DEFAULT now() NOT NULL,

    PRIMARY KEY (StrategyPlanSK)

);
