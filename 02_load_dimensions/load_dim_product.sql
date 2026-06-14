INSERT INTO Dim_Product (
    Related_Product_Indicator,
    Covered_or_Noncovered_Indicator_1,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_1,
    Product_Category_or_Therapeutic_Area_1,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1,
    Associated_Drug_or_Biological_NDC_1,
    Associated_Device_or_Medical_Supply_PDI_1
)
SELECT DISTINCT
    Related_Product_Indicator,
    Covered_or_Noncovered_Indicator_1,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_1,
    Product_Category_or_Therapeutic_Area_1,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1,
    Associated_Drug_or_Biological_NDC_1,
    Associated_Device_or_Medical_Supply_PDI_1
FROM OP_DTL_GNRL_PGYR2024_P01232026;
