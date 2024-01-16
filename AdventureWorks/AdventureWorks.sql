
-- Revenue By Quarter (USA, CANADA, UK)
SELECT EnglishCountryRegionName, CalendarQuarter,
       SUM(FactInternetSales.SalesAmount) AS Quarter_Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					   GROUP BY EnglishCountryRegionName, CalendarQuarter
					   ORDER BY Quarter_Revenue DESC;

-- Revenue By Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName, 
       SUM(FactInternetSales.SalesAmount) AS Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					   GROUP BY EnglishCountryRegionName
					   ORDER BY Revenue DESC;
	        

-- Total Revenue (USA, CANADA, UK)
SELECT SUM(FactInternetSales.SalesAmount) AS Total_Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

-- Customers By Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName,
       COUNT(DISTINCT FactInternetSales.CustomerKey) AS Customers
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
	        INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	              WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					   GROUP BY EnglishCountryRegionName
					   ORDER BY Customers DESC;

-- Total Customers (USA, CANADA, UK)
SELECT COUNT(DISTINCT FactInternetSales.CustomerKey) AS Total_Customers
       FROM FactInternetSales
	        INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	              WHERE EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

-- Total Sales By Country & Date (USA, CANADA, UK)
SELECT EnglishCountryRegionName AS Country, SalesAmount AS Sales, FullDateAlternateKey AS Date
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

-- Cost By Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName,
       SUM(FactInternetSales.TotalProductCost) AS Cost
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
	        INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	              WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					   GROUP BY EnglishCountryRegionName
					   ORDER BY Cost DESC;


-- Total Cost (USA, CANADA, UK)
SELECT SUM(FactInternetSales.TotalProductCost) AS Total_Cost
       FROM FactInternetSales
	        INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	              WHERE EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

-- Profit By Quarter (USA, CANADA, UK)
SELECT EnglishCountryRegionName, CalendarQuarter,
       SUM(SalesAmount)-SUM(TotalProductCost) AS Profit
           FROM FactInternetSales
	            INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
	            INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			    INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	                  WHERE FullDateAlternateKey <'2021-01-01'
					        AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					            GROUP BY EnglishCountryRegionName, CalendarQuarter
					            ORDER BY Profit DESC;

-- Profit By Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName,
       SUM(SalesAmount)-SUM(TotalProductCost) AS Profit_By_Country
           FROM FactInternetSales
	            INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
	            INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			    INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	                  WHERE FullDateAlternateKey <'2021-01-01'
					        AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					            GROUP BY EnglishCountryRegionName
					            ORDER BY Profit_By_Country DESC;

-- Total Profit (USA, CANADA, UK)
SELECT
      SUM(SalesAmount)-SUM(TotalProductCost) AS Total_Profit
          FROM FactInternetSales
	           INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			   INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	                 WHERE EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

-- Average Sales By Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName,
       AVG(FactInternetSales.SalesAmount) AS Average_Sales_By_Country
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
	        INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
	                   WHERE FullDateAlternateKey <'2021-01-01'
					         AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					             GROUP BY EnglishCountryRegionName
					             ORDER BY Average_Sales_By_Country DESC;

-- Total Average Sales (USA, CANADA, UK)
SELECT AVG(FactInternetSales.SalesAmount) AS Total_Average_Sales
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE FullDateAlternateKey <'2021-01-01'
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

-- Revenue By Product Category & Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName,
       DimProductCategory.EnglishProductCategoryName AS Product_Category,
       SUM(FactInternetSales.SalesAmount) AS Sales
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
            INNER JOIN DimProduct ON FactInternetSales.ProductKey = DimProduct.ProductKey
            INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
            INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                  WHERE FullDateAlternateKey <'2021-01-01'
				        AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
                        GROUP BY DimProductCategory.EnglishProductCategoryName, EnglishCountryRegionName
						ORDER BY Sales DESC;

-- Total Revenue By Product Category (USA, CANADA, UK)
SELECT DimProductCategory.EnglishProductCategoryName AS Product_Category,
       SUM(FactInternetSales.SalesAmount) AS Total_Sales_Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
            INNER JOIN DimProduct ON FactInternetSales.ProductKey = DimProduct.ProductKey
            INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
            INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                  WHERE FullDateAlternateKey <'2021-01-01'
				        AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
                        GROUP BY DimProductCategory.EnglishProductCategoryName
						ORDER BY Total_Sales_Revenue DESC;

-- Revenue By Product Category, Subcategory & Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName,
       DimProductCategory.EnglishProductCategoryName AS Product_Category,
       DimProductSubcategory.EnglishProductSubcategoryName AS Product_Subcategory,
       SUM(FactInternetSales.SalesAmount) AS Sales
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
            INNER JOIN DimProduct ON FactInternetSales.ProductKey = DimProduct.ProductKey
            INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
            INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                  WHERE FullDateAlternateKey <'2021-01-01'
				        AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
                        GROUP BY DimProductCategory.EnglishProductCategoryName, DimProductSubcategory.EnglishProductSubcategoryName, EnglishCountryRegionName
						ORDER BY Sales DESC;

-- Total Revenue By Product Category & Subcategory (USA, CANADA, UK)
SELECT DimProductCategory.EnglishProductCategoryName AS Product_Category,
       DimProductSubcategory.EnglishProductSubcategoryName AS Product_Subcategory,
       SUM(FactInternetSales.SalesAmount) AS Total_Sales_Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
            INNER JOIN DimProduct ON FactInternetSales.ProductKey = DimProduct.ProductKey
            INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
            INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                  WHERE FullDateAlternateKey <'2021-01-01'
				        AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
                        GROUP BY DimProductCategory.EnglishProductCategoryName, DimProductSubcategory.EnglishProductSubcategoryName
						ORDER BY Total_Sales_Revenue DESC;

-- Top Cities By State & Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName, StateProvinceName, City,
       SUM(FactInternetSales.SalesAmount) AS Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE SalesAmount >1000
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					   GROUP BY EnglishCountryRegionName, StateProvinceName, City
					   ORDER BY Revenue DESC;

-- Bottom Cities By State & Country (USA, CANADA, UK)
SELECT EnglishCountryRegionName, StateProvinceName, City,
       SUM(FactInternetSales.SalesAmount) AS Revenue
       FROM FactInternetSales
	        INNER JOIN DimDate ON FactInternetSales.DueDateKey = DimDate.DateKey
			INNER JOIN DimCustomer ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
			INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
                       WHERE SalesAmount <1000000
					   AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom')
					   GROUP BY EnglishCountryRegionName, StateProvinceName, City
					   ORDER BY Revenue ASC;


-- Data Cleaning
SELECT
      FS.CustomerKey AS CustomerKey,
      DD.DateKey AS DateKey,
      DD.FullDateAlternateKey,
      DG.GeographyKey AS GeographyKey,
      DG.City,
      DG.EnglishCountryRegionName,
      DG.StateProvinceName,
      DP.ProductKey,
      DP.ProductSubcategoryKey,
      DP.EnglishProductName,
      DPC.ProductCategoryKey,
      DPC.EnglishProductCategoryName,
      DPSC.ProductSubcategoryKey,
      DPSC.EnglishProductSubcategoryName,
      FS.SalesAmount,
      FS.TotalProductCost
         FROM FactInternetSales AS FS
              INNER JOIN DimCustomer AS DC ON FS.CustomerKey = DC.CustomerKey
              INNER JOIN DimDate AS DD ON FS.DueDateKey = DD.DateKey
              INNER JOIN DimGeography AS DG ON DC.GeographyKey = DG.GeographyKey
              INNER JOIN DimProduct AS DP ON FS.ProductKey = DP.ProductKey
              INNER JOIN DimProductSubcategory AS DPSC ON DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
              INNER JOIN DimProductCategory AS DPC ON DPSC.ProductCategoryKey = DPC.ProductCategoryKey
			        WHERE FullDateAlternateKey <'2021-01-01'
				          AND EnglishCountryRegionName IN ('United States', 'Canada', 'United Kingdom');

      


