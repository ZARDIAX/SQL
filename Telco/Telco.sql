-- Total Revenue
SELECT SUM(Dim_Services.`Total Revenue`) AS Total_Revenue
		  FROM Dim_Services;

-- Total Charges
SELECT SUM(Telco_Churn_Fact.`Total Charges`) AS Total_Charges
           FROM Telco_Churn_Fact;

-- Total Customers
SELECT COUNT(DISTINCT Telco_Churn_Fact.`CustomerID`) AS Total_Customers
             FROM Telco_Churn_Fact;
       
-- New Customers
SELECT COUNT(*) AS New_Customers
            FROM Dim_Status
			     WHERE `Customer Status` = 'Joined';
            
-- Stayed Customers
SELECT COUNT(*) AS New_Customers
            FROM Dim_Status
			     WHERE `Customer Status` = 'Stayed';
            
-- Churned Customers
SELECT COUNT(*) AS Churned_Customers
            FROM Telco_Churn_Fact
		       	 WHERE `Churn Label` = 'Yes';
            
-- Average Customer Age
SELECT AVG(Age) AS Average_Customer_Age
       FROM Dim_Demographics;
       
-- Tenure In Months
SELECT dim_services.`Tenure in Months`,
       COUNT(DISTINCT Telco_Churn_Fact.`CustomerID`) AS Total_Customers
            FROM Telco_Churn_Fact
                 INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
					   GROUP BY `Tenure in Months`
							 ORDER BY Total_Customers DESC;
                       
-- Customers Status By Revenue
SELECT dim_status.`Customer Status`,
           SUM(Dim_Services.`Total Revenue`) AS Total_Revenue
		       FROM Telco_Churn_Fact
                    INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
                    INNER JOIN dim_status ON Telco_Churn_Fact.`CustomerID` = dim_status.`Customer ID`
					      GROUP BY `Customer Status`
                                ORDER BY Total_Revenue DESC;

-- Customers By Age
SELECT dim_demographics.`Age`,
       COUNT(DISTINCT Telco_Churn_Fact.`CustomerID`) AS Total_Customers
            FROM Telco_Churn_Fact
                 INNER JOIN dim_demographics ON Telco_Churn_Fact.`CustomerID` = dim_demographics.`Customer ID`
					   GROUP BY `Age`
							 ORDER BY Total_Customers DESC;
                             
-- Total Gender
SELECT dim_demographics.`Gender`,
           SUM(dim_demographics.`Count`) AS Amount
		       FROM Telco_Churn_Fact
                    INNER JOIN dim_demographics ON Telco_Churn_Fact.`CustomerID` = dim_demographics.`Customer ID`
					      GROUP BY `Gender`
                                ORDER BY Amount DESC;

-- Internet Service
SELECT dim_services.`Internet Service`,
           COUNT(Dim_Services.`Internet Service`) AS Internet_Service
		         FROM Telco_Churn_Fact
                      INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
					        GROUP BY `Internet Service`
                                  ORDER BY Internet_Service DESC;
                                  
-- Phone Service
SELECT dim_services.`Phone Service`,
           COUNT(Dim_Services.`Phone Service`) AS Phone_Service
		         FROM Telco_Churn_Fact
                      INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
					        GROUP BY `Phone Service`
                                  ORDER BY Phone_Service DESC;

-- Multiple Lines
SELECT dim_services.`Multiple Lines`,
           COUNT(Dim_Services.`Multiple Lines`) AS Multiple_Lines
		         FROM Telco_Churn_Fact
                      INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
					        GROUP BY `Multiple Lines`
                                  ORDER BY Multiple_Lines DESC;
                                  
-- Contract Type
SELECT dim_services.`Contract`,
           COUNT(Dim_Services.`Contract`) AS Contract_Type
		         FROM Telco_Churn_Fact
                      INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
					        GROUP BY `Contract`
                                  ORDER BY Contract_Type DESC;
                                  
-- Internet Type
SELECT dim_services.`Internet Type`,
           COUNT(Dim_Services.`Internet Type`) AS Internet_Type
		         FROM Telco_Churn_Fact
                      INNER JOIN dim_services ON Telco_Churn_Fact.`CustomerID` = dim_services.`Customer ID`
					        GROUP BY `Internet Type`
                                  ORDER BY Internet_Type DESC;
                                  
-- Satisfaction Score
SELECT dim_status.`Satisfaction Score`,
	   COUNT(DISTINCT Telco_Churn_Fact.`CustomerID`) AS Total_Customers
             FROM Telco_Churn_Fact
				  INNER JOIN dim_status ON Telco_Churn_Fact.`CustomerID` = dim_status.`Customer ID`
						GROUP BY `Satisfaction Score`
							  ORDER BY Total_Customers DESC;
                              
-- Churners Reasons & Categories
SELECT dim_status.`Churn Category`, dim_status.`Churn Reason`,
	   COUNT(DISTINCT dim_status.`Customer ID`) AS Churned_Customers
             FROM Telco_Churn_Fact
				  INNER JOIN dim_status ON Telco_Churn_Fact.`CustomerID` = dim_status.`Customer ID`
						GROUP BY `Churn Category`, `Churn Reason`
							  ORDER BY Churned_Customers DESC
                                    LIMIT 18446744073709551615 OFFSET 1;
                                    
-- Data Cleaning
SELECT
      t1.`Customer ID`, t1.`Count`, t1.`Gender`, t1.`Age`, t1.`Under 30`,
      t2.`Tenure in Months`, t2.`Phone Service`, t2.`Multiple Lines`, t2.`Internet Service`, t2.`Internet Type`, t2.`Contract`, t2.`Total Charges`, t2.`Total Revenue`,
      t3.`Satisfaction Score`, t3.`Customer Status`, t3.`Churn Label`, t3.`Churn Score`, t3.`Churn Category`, t3.`Churn Reason`
          FROM dim_demographics AS t1
	           JOIN dim_services AS t2
               JOIN dim_status AS t3;