INSERT INTO Fact_Transactions
(
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
    op.Record_ID,
    dr.Recipient_ID,
    dm.Manufacturer_ID,
    dth.Teaching_Hospital_ID,
    dp.Payment_ID,
    dt.Travel_ID,
    dtp.Third_Party_ID,
    dpr.Product_ID,
    dd_payment.Date_ID,
    dd_publication.Date_ID,
    op.Total_Amount_of_Payment_USDollars,
    op.Number_of_Payments_Included_in_Total_Amount,
    op.Program_Year
FROM OP_DTL_GNRL_PGYR2024_P01232026_2 op
    
LEFT JOIN Dim_Recipient dr
    ON op.Covered_Recipient_Profile_ID =
       dr.Covered_Recipient_Profile_ID
    
LEFT JOIN Dim_Manufacturer dm
    ON op.Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_ID =
       dm.Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_ID
    
LEFT JOIN Dim_Teaching_Hospital dth
    ON op.Teaching_Hospital_ID =
       dth.Teaching_Hospital_ID_Source
    
LEFT JOIN Dim_Payment dp
    ON op.Form_of_Payment_or_Transfer_of_Value =
       dp.Form_of_Payment_or_Transfer_of_Value
   AND op.Nature_of_Payment_or_Transfer_of_Value =
       dp.Nature_of_Payment_or_Transfer_of_Value
    
LEFT JOIN Dim_Travel dt
    ON op.City_of_Travel =
       dt.City_of_Travel
   AND op.State_of_Travel =
       dt.State_of_Travel
   AND op.Country_of_Travel =
       dt.Country_of_Travel
    
LEFT JOIN Dim_Third_Party dtp
    ON op.Third_Party_Payment_Recipient_Indicator =
       dtp.Third_Party_Payment_Recipient_Indicator
   AND op.Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value =
       dtp.Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value
   AND op.Charity_Indicator =
       dtp.Charity_Indicator
   AND op.Third_Party_Equals_Covered_Recipient_Indicator =
       dtp.Third_Party_Equals_Covered_Recipient_Indicator
    
LEFT JOIN Dim_Product dpr
    ON op.Related_Product_Indicator =
       dpr.Related_Product_Indicator
   AND op.Covered_or_Noncovered_Indicator_1 =
       dpr.Covered_or_Noncovered_Indicator_1
   AND op.Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_1 =
       dpr.Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_1
   AND op.Product_Category_or_Therapeutic_Area_1 =
       dpr.Product_Category_or_Therapeutic_Area_1
   AND op.Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1 =
       dpr.Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1
    
LEFT JOIN Dim_Date dd_payment
    ON op.Date_of_Payment =
       dd_payment.Full_Date
    
LEFT JOIN Dim_Date dd_publication
    ON op.Payment_Publication_Date =
       dd_publication.Full_Date;
