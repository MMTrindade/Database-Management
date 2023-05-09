
--Criando view mv, com EmployeeID--

CREATE VIEW mv_employee_passenger AS
	SELECT e.FirstName, e.LastName, e.Country, e.EmployeeID
	FROM Employee AS e
	INNER JOIN Passenger AS p
	ON e.FirstName = p.FirstName AND e.LastName = p.LastName;

SELECT Country, COUNT(DISTINCT FirstName, LastName) AS EmployeeCount
FROM mv_employee_passenger
GROUP BY Country;

--Criando view vw, sem EmployeeID--

CREATE VIEW vw_employee_passenger
WITH SCHEMABINDING
AS
SELECT e.FirstName, e.LastName, e.Country
FROM dbo.Employee AS e
INNER JOIN dbo.Passenger AS p
ON e.FirstName = p.FirstName AND e.LastName = p.LastName;

GO

CREATE UNIQUE CLUSTERED INDEX ix_vw_employee_passenger
ON vw_employee_passenger (Country, FirstName, LastName);

GO

SELECT Country, COUNT(DISTINCT FirstName + ' ' + LastName) AS EmployeeCount
FROM vw_employee_passenger
GROUP BY Country;

--Fazendo contabilizaçao dos employees por pais--

SELECT Country, COUNT(*) AS Count
FROM dbo.vw_employee_passenger
GROUP BY Country
ORDER BY Country ASC;