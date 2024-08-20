USE AdventureWorks2012


----A) Get all the details from the person table including email ID, phone number and phone number type
SELECT * FROM [Person].[EmailAddress]
SELECT * FROM [Person].[PersonPhone]
--above tables are used to get the data

SELECT EmailAddress, PhoneNumber, PhoneNumberTypeID FROM [Person].[EmailAddress] PED JOIN [Person].[PersonPhone] PPP
ON PED.BusinessEntityID=PPP.BusinessEntityID

----B) Get the details of the sales header order made in May 2011
SELECT * FROM [Sales].[SalesOrderHeader]
--above tables are used to get the data

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE( MONTH(OrderDate)=5 AND YEAR(OrderDate)=2011 )

----C) Get the details of the sales details order made in the month of May 2011
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]
--above tables are used to get the data

SELECT * FROM [Sales].[SalesOrderDetail] SSO JOIN [Sales].[SalesOrderHeader] SSOH 
ON SSO.SalesOrderID=SSOH.SalesOrderID
WHERE( MONTH(OrderDate)=5 AND YEAR(OrderDate)=2011 )

----D) Get the total sales made in May 2011
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]
--above tables are used to get the data

SELECT YEAR(OrderDate) 'year',MONTH(OrderDate)'month(may)', SUM(LineTotal) 'total_sales' FROM  [Sales].[SalesOrderDetail] SSO
JOIN [Sales].[SalesOrderHeader] SOH ON SSO.SalesOrderID=SOH.SalesOrderID
GROUP BY MONTH(OrderDate),YEAR(OrderDate)
HAVING (MONTH(OrderDate)=5 AND YEAR(OrderDate)=2011)

----E) Get the total sales made in the year 2011 by month order by increasing sales
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]
--above tables are used to get the data

SELECT YEAR(OrderDate) 'year',MONTH(OrderDate)'months', FLOOR(SUM(LineTotal)) 'total_sales' FROM  [Sales].[SalesOrderDetail] SSO
JOIN [Sales].[SalesOrderHeader] SOH ON SSO.SalesOrderID=SOH.SalesOrderID
GROUP BY MONTH(OrderDate),YEAR(OrderDate)
HAVING YEAR(OrderDate)=2011
ORDER BY SUM(LineTotal) ASC

----F) Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]
SELECT * FROM [Person].[Person]
SELECT * FROM [Sales].[Customer]
--above tables are used to get the data

SELECT P.FirstName, P.LastName, TMP.TotalAmount FROM Sales.Customer C
JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
LEFT JOIN 
(
SELECT SOH.CustomerID, SUM(LineTotal) TotalAmount FROM Sales.SalesOrderDetail SOD
JOIN Sales.SalesOrderHeader SOH ON SOH.SalesOrderID=SOD.SalesOrderID
GROUP BY SOH.CustomerID
)
TMP ON TMP.CustomerID=C.CustomerID
WHERE FirstName='Gustavo' AND LastName ='Achong'
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
