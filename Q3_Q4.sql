CREATE NONCLUSTERED INDEX idx_Booking_FlightID_Price
ON Booking (FlightID)
INCLUDE (Price);

DROP INDEX idx_Booking_FlightID_Price ON dbo.Booking;

SELECT Airline.AirlineName,
 CAST(ROUND(SUM(Booking.Price)/1E6, 0) AS VARCHAR(5)) + ' M€' AS Revenue
FROM Booking, Flight, Airline
WHERE Booking.FlightID = Flight.FlightID
 AND Flight.AirlineID = Airline.AirlineID
GROUP BY Airline.AirlineName
OPTION (MAXDOP 1);