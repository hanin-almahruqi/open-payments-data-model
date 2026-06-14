INSERT INTO Dim_Third_Party (
    Third_Party_Payment_Recipient_Indicator,
    Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value,
    Charity_Indicator,
    Third_Party_Equals_Covered_Recipient_Indicator
)
SELECT DISTINCT
    Third_Party_Payment_Recipient_Indicator,
    Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value,
    Charity_Indicator,
    Third_Party_Equals_Covered_Recipient_Indicator
FROM OP_DTL_GNRL_PGYR2024_P01232026;
