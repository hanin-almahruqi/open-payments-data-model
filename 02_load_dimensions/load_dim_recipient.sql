INSERT INTO Dim_Recipient (
    Covered_Recipient_Profile_ID,
    Covered_Recipient_NPI,
    Covered_Recipient_First_Name,
    Covered_Recipient_Last_Name,
    Covered_Recipient_Type,
    Recipient_State
)
SELECT DISTINCT
    Covered_Recipient_Profile_ID,
    Covered_Recipient_NPI,
    Covered_Recipient_First_Name,
    Covered_Recipient_Last_Name,
    Covered_Recipient_Type,
    Recipient_State
FROM OP_DTL_GNRL_PGYR2024_P01232026;
