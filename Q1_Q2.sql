\\Question1\\

SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Airline'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Airport'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Airplane'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('AirplaneType'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Airport'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('AirportGeo'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Booking'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
 UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Employee'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Flight'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('FlightSchedule'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('Passenger'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('WeatherData'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'
UNION
SELECT object_name(object_id) as object_name, COUNT(allocated_page_page_id) as num_allocated_pages
FROM sys.dm_db_database_page_allocations(db_id('AirportDB'),
 object_id('PassengerDetails'),
 NULL, NULL, 'DETAILED')
GROUP BY object_id, page_type_desc
HAVING page_type_desc = 'DATA_PAGE'


---------------------------------
\\Question 2\\

SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Airline'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Airline'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Airline'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Airline')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Airplane'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Airplane'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Airplane'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Airplane')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.AirplaneType'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.AirplaneType'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.AirplaneType'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.AirplaneType')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Airport'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Airport'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Airport'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Airport')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.AirportGeo'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.AirportGeo'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.AirportGeo'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.AirportGeo')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Booking'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Booking'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Booking'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Booking')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Employee'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Employee'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Employee'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Employee')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Flight'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Flight'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Flight'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Flight')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.FlightSchedule'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.FlightSchedule'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.FlightSchedule'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.FlightSchedule')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.Passenger'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.Passenger'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.Passenger'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.Passenger')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.PassengerDetails'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.PassengerDetails'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.PassengerDetails'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.PassengerDetails')
UNION
SELECT 
	object_name(object_id) as object_name,
	idx.name AS IndexName,
  INDEXPROPERTY(OBJECT_ID('dbo.WeatherData'), idx.name, 'IsClustered') AS IsClustered,
  INDEXPROPERTY(OBJECT_ID('dbo.WeatherData'), idx.name, 'IndexDepth') AS IndexDepth,
  INDEXPROPERTY(OBJECT_ID('dbo.WeatherData'), idx.name, 'IsUnique') AS IsUnique
FROM sys.indexes idx
WHERE idx.object_id = OBJECT_ID('dbo.WeatherData')