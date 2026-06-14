INSERT INTO Fact_Transactions (
    Record_ID,
    Recipient_ID,
    Manufacturer_ID,
    Teaching_Hospital_ID,
    Payment_ID,
    Travel_ID,
    Third_Party_ID,
    Product_ID,
    Payment_Date_ID,
    Publication_Date_ID,
    Total_Amount_of_Payment_USDollars,
    Number_of_Payments_Included_in_Total_Amount,
    Program_Year
)
SELECT
    o.Record_ID,

    r.Recipient_ID,
    m.Manufacturer_ID,
    h.Teaching_Hospital_ID,
    p.Payment_ID,
    t.Travel_ID,
    tp.Third_Party_ID,
    pr.Product_ID,
    d1.Date_ID,
    d2.Date_ID,

    o.Total_Amount_of_Payment_USDollars,
    o.Number_of_Payments_Included_in_Total_Amount,
    o.Program_Year

FROM OP_DTL_GNRL_PGYR2024_P01232026 o

LEFT JOIN Dim_Recipient r
    ON o.Covered_Recipient_Profile_ID = r.Covered_Recipient_Profile_ID

LEFT JOIN Dim_Manufacturer m
    ON o.Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_ID
     = m.Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_ID

LEFT JOIN Dim_Teaching_Hospital h
    ON o.Teaching_Hospital_ID = h.Teaching_Hospital_ID_Source

LEFT JOIN Dim_Payment p
    ON o.Nature_of_Payment_or_Transfer_of_Value = p.Nature_of_Payment_or_Transfer_of_Value
   AND o.Form_of_Payment_or_Transfer_of_Value = p.Form_of_Payment_or_Transfer_of_Value

LEFT JOIN Dim_Travel t
    ON o.City_of_Travel = t.City_of_Travel
   AND o.State_of_Travel = t.State_of_Travel
   AND o.Country_of_Travel = t.Country_of_Travel

LEFT JOIN Dim_Third_Party tp
    ON o.Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value
     = tp.Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value

LEFT JOIN Dim_Product pr
    ON o.Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1
     = pr.Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1

LEFT JOIN Dim_Date d1
    ON o.Date_of_Payment = d1.Full_Date

LEFT JOIN Dim_Date d2
    ON o.Payment_Publication_Date = d2.Full_Date;
