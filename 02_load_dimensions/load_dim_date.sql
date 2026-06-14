INSERT INTO Dim_Date (Full_Date, Day, Month, Quarter, Year)
SELECT DISTINCT
    Date_of_Payment,
    CAST(strftime('%d', Date_of_Payment) AS INTEGER),
    CAST(strftime('%m', Date_of_Payment) AS INTEGER),
    CAST((strftime('%m', Date_of_Payment)-1)/3 + 1 AS INTEGER),
    CAST(strftime('%Y', Date_of_Payment) AS INTEGER)
FROM OP_DTL_GNRL_PGYR2024_P01232026;
