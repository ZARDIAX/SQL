-- Revenue By Quarter & Year (USA & UK)
SELECT RegionCountryName, CalendarQuarterLabel, CalendarYearLabel,
             SUM(FactOnlineSales.SalesAmount) AS Quarter_Revenue
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName, CalendarQuarterLabel, CalendarYearLabel
									        ORDER BY Quarter_Revenue DESC;

-- Revenue By Country (USA & UK)
SELECT RegionCountryName,
             SUM(FactOnlineSales.SalesAmount) AS Revenue
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Revenue DESC;

-- Total Revenue (USA & UK)
SELECT SUM(FactOnlineSales.SalesAmount) AS Total_Revenue
	       FROM FactOnlineSales
			    INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
				INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
						   WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Customers By Country (USA & UK)
SELECT RegionCountryName,
             COUNT(DISTINCT FactOnlineSales.CustomerKey) AS Customers
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Customers DESC;

-- Total Customers
SELECT COUNT(DISTINCT FactOnlineSales.CustomerKey) AS Total_Customers
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Total Sales By Country & Date (USA & UK)
SELECT RegionCountryName AS Country, SalesAmount AS Sales, FullDateLabel AS Date_
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Cost By Country (USA & UK)
SELECT RegionCountryName,
             SUM(FactOnlineSales.TotalCost) AS Cost
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Cost DESC;

-- Total Cost (USA & UK)
SELECT SUM(FactOnlineSales.TotalCost) AS Cost
	       FROM FactOnlineSales
			     INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
				 INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Profit By Quarter (USA & UK)
SELECT RegionCountryName, CalendarQuarterLabel, CalendarYearLabel,
             SUM(SalesAmount) - SUM(TotalCost) AS Profit
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName, CalendarQuarterLabel, CalendarYearLabel
									        ORDER BY Profit DESC;

-- Profit By Country (USA & UK)
SELECT RegionCountryName,
             SUM(SalesAmount) - SUM(TotalCost) AS Profit_By_Country
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Profit_By_Country DESC;

-- Total Profit (USA & UK)
SELECT SUM(SalesAmount) - SUM(TotalCost) AS Total_Profit
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							     WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Average Sales By Country (USA & UK)
SELECT RegionCountryName,
             AVG(FactOnlineSales.SalesAmount) AS Average_Sales_By_Country
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Average_Sales_By_Country DESC;

-- Total Average Sales By Country (USA & UK)
SELECT AVG(FactOnlineSales.SalesAmount) AS Total_Average_Sales
	       FROM FactOnlineSales
		        INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
			    INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
						   WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Revenue By Product Category & Country (USA & UK)
SELECT RegionCountryName AS Country, DimProductCategory.ProductCategoryName AS Product_Category,
             SUM(FactOnlineSales.SalesAmount) AS Sales
	             FROM FactOnlineSales
					  INNER JOIN DimProduct ON FactOnlineSales.ProductKey = DimProduct.ProductKey
					  INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
					  INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY DimProductCategory.ProductCategoryName, RegionCountryName
									        ORDER BY Sales DESC;

-- Total Revenue By Product Category (USA & UK)
SELECT DimProductCategory.ProductCategoryName AS Product_Category,
             SUM(FactOnlineSales.SalesAmount) AS Sales
	             FROM FactOnlineSales
					  INNER JOIN DimProduct ON FactOnlineSales.ProductKey = DimProduct.ProductKey
					  INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
					  INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY DimProductCategory.ProductCategoryName
									        ORDER BY Sales DESC;

-- Revenue By Product Category, Subcategory & Country (USA & UK)
SELECT RegionCountryName AS Country, DimProductCategory.ProductCategoryName AS Product_Category, DimProductSubcategory.ProductSubcategoryName AS Product_Subcategory,
             SUM(FactOnlineSales.SalesAmount) AS Revenue
	             FROM FactOnlineSales
					  INNER JOIN DimProduct ON FactOnlineSales.ProductKey = DimProduct.ProductKey
					  INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
					  INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY DimProductCategory.ProductCategoryName, DimProductSubcategory.ProductSubcategoryName ,RegionCountryName
									        ORDER BY Revenue DESC;

-- Total Revenue By Product Category & Subcategory (USA & UK)
SELECT DimProductCategory.ProductCategoryName AS Product_Category, DimProductSubcategory.ProductSubcategoryName AS Product_Subcategory,
             SUM(FactOnlineSales.SalesAmount) AS Total_Sales_Revenue
	             FROM FactOnlineSales
					  INNER JOIN DimProduct ON FactOnlineSales.ProductKey = DimProduct.ProductKey
					  INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
					  INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								        GROUP BY DimProductCategory.ProductCategoryName, DimProductSubcategory.ProductSubcategoryName
									             ORDER BY Total_Sales_Revenue DESC;

-- Top Cities By State & Country (USA & UK)
SELECT RegionCountryName AS Country, StateProvinceName AS State_Province, CityName AS City,
             SUM(FactOnlineSales.SalesAmount) AS Revenue
	             FROM FactOnlineSales
					  INNER JOIN DimProduct ON FactOnlineSales.ProductKey = DimProduct.ProductKey
					  INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
					  INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE SalesAmount >1000
								             AND RegionCountryName IN ('United States', 'United Kingdom')
								                 GROUP BY RegionCountryName, StateProvinceName,CityName
									                   ORDER BY Revenue DESC;

-- Bottom Cities By State & Country (USA & UK)
SELECT RegionCountryName AS Country, StateProvinceName AS State_Province, CityName AS City,
             SUM(FactOnlineSales.SalesAmount) AS Revenue
	             FROM FactOnlineSales
					  INNER JOIN DimProduct ON FactOnlineSales.ProductKey = DimProduct.ProductKey
					  INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
					  INNER JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE SalesAmount <1000000
								             AND RegionCountryName IN ('United States', 'United Kingdom')
								                 GROUP BY RegionCountryName, StateProvinceName,CityName
									                   ORDER BY Revenue ASC;

-- Returns By Country (USA & UK)
SELECT RegionCountryName AS Country,
             SUM(FactOnlineSales.ReturnAmount) AS Return_
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Return_ DESC;

-- Returns By Country & Date (USA & UK)
SELECT RegionCountryName AS Country, CalendarMonthLabel AS Month_, CalendarYearLabel AS Year_,
             SUM(FactOnlineSales.ReturnAmount) AS Return_
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName, CalendarMonthLabel, CalendarYearLabel
									        ORDER BY Return_ DESC;

-- Total Returns (USA & UK)
SELECT SUM(FactOnlineSales.ReturnAmount) AS Total_Returns
	       FROM FactOnlineSales
			    INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
				INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
						   WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Discounts By Country (USA & UK)
SELECT RegionCountryName AS Country,
             SUM(FactOnlineSales.DiscountAmount) AS Discounts
	             FROM FactOnlineSales
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName
									        ORDER BY Discounts DESC;

-- Discounts By Country & Date (USA & UK)
SELECT RegionCountryName AS Country, CalendarMonthLabel AS Month_, CalendarYearLabel AS Year_,
             SUM(FactOnlineSales.DiscountAmount) AS Discounts
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States', 'United Kingdom')
								      GROUP BY RegionCountryName, CalendarMonthLabel, CalendarYearLabel
									        ORDER BY Discounts DESC;

-- Total Discounts (USA & UK)
SELECT SUM(FactOnlineSales.DiscountAmount) AS Total_Discounts
	       FROM FactOnlineSales
			    INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
				INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
						   WHERE RegionCountryName IN ('United States', 'United Kingdom');

-- Season, Discounts By Country & Quarter (USA)
SELECT NorthAmericaSeason, RegionCountryName AS Country, CalendarQuarterLabel AS Quarter_, CalendarYearLabel AS Year_,
             SUM(FactOnlineSales.DiscountAmount) AS Discounts
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United States')
								      GROUP BY NorthAmericaSeason, RegionCountryName, CalendarQuarterLabel, CalendarYearLabel
									        ORDER BY Discounts DESC;

-- Season, Discounts By Country & Quarter (UK)
SELECT EuropeSeason AS Season, RegionCountryName AS Country, CalendarQuarterLabel AS Quarter_, CalendarYearLabel AS Year_,
             SUM(FactOnlineSales.DiscountAmount) AS Discounts
	             FROM FactOnlineSales
				      INNER JOIN DimDate ON FactOnlineSales.DateKey = DimDate.DateKey
					  INNER JOIN DimCustomer ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
					  INNER JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey
							      WHERE RegionCountryName IN ('United Kingdom')
								      GROUP BY EuropeSeason, RegionCountryName, CalendarQuarterLabel, CalendarYearLabel
									        ORDER BY Discounts DESC;

-- Data Cleaning
SELECT
      FS.CustomerKey AS CustomerKey,
	  FS.SalesAmount,
      FS.ReturnAmount,
      FS.TotalCost,
      DG.GeographyKey AS GeographyKey,
      DD.DateKey AS DateKey,  
      DD.EuropeSeason,
      DD.NorthAmericaSeason,
      DG.CityName,
      DG.StateProvinceName,
      DG.RegionCountryName,
      DP.ProductKey,
      DP.ProductSubcategoryKey,
      DP.ProductName,
      DP.ProductDescription,
      DPC.ProductCategoryKey,
      DPC.ProductCategoryDescription,
      DPSC.ProductSubcategoryDescription,
      DS.StoreKey AS StoreKey
         FROM FactOnlineSales AS FS
              INNER JOIN DimCustomer AS DC ON FS.CustomerKey = DC.CustomerKey
              INNER JOIN DimDate AS DD ON FS.DateKey = DD.Datekey
              INNER JOIN DimGeography AS DG ON DC.GeographyKey = DG.GeographyKey
              INNER JOIN DimProduct AS DP ON FS.ProductKey = DP.ProductKey
              INNER JOIN DimProductSubcategory AS DPSC ON DP.ProductSubcategoryKey = DPSC.ProductSubcategoryKey
              INNER JOIN DimProductCategory AS DPC ON DPSC.ProductCategoryKey = DPC.ProductCategoryKey
              INNER JOIN DimStore AS DS ON FS.StoreKey = DS.StoreKey
			        WHERE RegionCountryName IN ('United States', 'United Kingdom');