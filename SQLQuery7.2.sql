ALTER DATABASE AirportDB
SET ALLOW_SNAPSHOT_ISOLATION ON;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRANSACTION;

UPDATE WeatherData WITH (ROWLOCK)
SET Weather = 'Rain'
WHERE Weather = 'Regen';UPDATE WeatherData WITH (ROWLOCK)
SET Weather = 'Snowfall'
WHERE Weather = 'Schneefall';

SELECT *
FROM WeatherData;

ROLLBACK TRANSACTION;

BEGIN TRANSACTION;

UPDATE WeatherData WITH (ROWLOCK, UPDLOCK)
SET Weather = 'Rain'
WHERE Weather = 'Regen';


