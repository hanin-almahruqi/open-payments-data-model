INSERT INTO Dim_Payment (
    Nature_of_Payment_or_Transfer_of_Value,
    Form_of_Payment_or_Transfer_of_Value
)
SELECT DISTINCT
    Nature_of_Payment_or_Transfer_of_Value,
    Form_of_Payment_or_Transfer_of_Value
FROM OP_DTL_GNRL_PGYR2024_P01232026;
