INSERT INTO Dim_Travel (
    City_of_Travel,
    State_of_Travel,
    Country_of_Travel
)
SELECT DISTINCT
    City_of_Travel,
    State_of_Travel,
    Country_of_Travel
FROM OP_DTL_GNRL_PGYR2024_P01232026;
