-- ============================================
-- DIM_RECIPIENT
-- ============================================

CREATE TABLE Dim_Recipient (
    Recipient_ID INTEGER PRIMARY KEY,

    Covered_Recipient_Profile_ID TEXT,
    Covered_Recipient_NPI TEXT,
    Covered_Recipient_First_Name TEXT,
    Covered_Recipient_Middle_Name TEXT,
    Covered_Recipient_Last_Name TEXT,
    Covered_Recipient_Name_Suffix TEXT,
    Covered_Recipient_Type TEXT,

    Recipient_Primary_Business_Street_Address_Line1 TEXT,
    Recipient_Primary_Business_Street_Address_Line2 TEXT,
    Recipient_City TEXT,
    Recipient_State TEXT,
    Recipient_Zip_Code TEXT,
    Recipient_Country TEXT,
    Recipient_Province TEXT,
    Recipient_Postal_Code TEXT,

    Covered_Recipient_Primary_Type_1 TEXT,
    Covered_Recipient_Primary_Type_2 TEXT,
    Covered_Recipient_Primary_Type_3 TEXT,
    Covered_Recipient_Primary_Type_4 TEXT,
    Covered_Recipient_Primary_Type_5 TEXT,
    Covered_Recipient_Primary_Type_6 TEXT,

    Covered_Recipient_Specialty_1 TEXT,
    Covered_Recipient_Specialty_2 TEXT,
    Covered_Recipient_Specialty_3 TEXT,
    Covered_Recipient_Specialty_4 TEXT,
    Covered_Recipient_Specialty_5 TEXT,
    Covered_Recipient_Specialty_6 TEXT,

    Covered_Recipient_License_State_Code1 TEXT,
    Covered_Recipient_License_State_Code2 TEXT,
    Covered_Recipient_License_State_Code3 TEXT,
    Covered_Recipient_License_State_Code4 TEXT,
    Covered_Recipient_License_State_Code5 TEXT
);

-- ============================================
-- DIM_MANUFACTURER
-- ============================================

CREATE TABLE Dim_Manufacturer (
    Manufacturer_ID INTEGER PRIMARY KEY,

    Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_ID TEXT,
    Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Name TEXT,
    Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_State TEXT,
    Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Country TEXT,
    Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name TEXT
);

-- ============================================
-- DIM_TEACHING_HOSPITAL
-- ============================================

CREATE TABLE Dim_Teaching_Hospital (
    Teaching_Hospital_ID INTEGER PRIMARY KEY,

    Teaching_Hospital_ID_Source TEXT,
    Teaching_Hospital_CCN TEXT,
    Teaching_Hospital_Name TEXT
);

-- ============================================
-- DIM_PAYMENT
-- ============================================

CREATE TABLE Dim_Payment (
    Payment_ID INTEGER PRIMARY KEY,

    Nature_of_Payment_or_Transfer_of_Value TEXT,
    Form_of_Payment_or_Transfer_of_Value TEXT
);

-- ============================================
-- DIM_TRAVEL
-- ============================================

CREATE TABLE Dim_Travel (
    Travel_ID INTEGER PRIMARY KEY,

    City_of_Travel TEXT,
    State_of_Travel TEXT,
    Country_of_Travel TEXT
);

-- ============================================
-- DIM_THIRD_PARTY
-- ============================================

CREATE TABLE Dim_Third_Party (
    Third_Party_ID INTEGER PRIMARY KEY,

    Third_Party_Payment_Recipient_Indicator TEXT,
    Name_of_Third_Party_Entity_Receiving_Payment_or_Transfer_of_Value TEXT,
    Charity_Indicator TEXT,
    Third_Party_Equals_Covered_Recipient_Indicator TEXT
);

-- ============================================
-- DIM_DATE
-- ============================================

CREATE TABLE Dim_Date (
    Date_ID INTEGER PRIMARY KEY,

    Full_Date TEXT,
    Day INTEGER,
    Month INTEGER,
    Quarter INTEGER,
    Year INTEGER
);

-- ============================================
-- DIM_PRODUCT
-- ============================================

CREATE TABLE Dim_Product (
    Product_ID INTEGER PRIMARY KEY,

    Related_Product_Indicator TEXT,

    Covered_or_Noncovered_Indicator_1 TEXT,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_1 TEXT,
    Product_Category_or_Therapeutic_Area_1 TEXT,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_1 TEXT,
    Associated_Drug_or_Biological_NDC_1 TEXT,
    Associated_Device_or_Medical_Supply_PDI_1 TEXT,

    Covered_or_Noncovered_Indicator_2 TEXT,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_2 TEXT,
    Product_Category_or_Therapeutic_Area_2 TEXT,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_2 TEXT,
    Associated_Drug_or_Biological_NDC_2 TEXT,
    Associated_Device_or_Medical_Supply_PDI_2 TEXT,

    Covered_or_Noncovered_Indicator_3 TEXT,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_3 TEXT,
    Product_Category_or_Therapeutic_Area_3 TEXT,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_3 TEXT,
    Associated_Drug_or_Biological_NDC_3 TEXT,
    Associated_Device_or_Medical_Supply_PDI_3 TEXT,

    Covered_or_Noncovered_Indicator_4 TEXT,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_4 TEXT,
    Product_Category_or_Therapeutic_Area_4 TEXT,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_4 TEXT,
    Associated_Drug_or_Biological_NDC_4 TEXT,
    Associated_Device_or_Medical_Supply_PDI_4 TEXT,

    Covered_or_Noncovered_Indicator_5 TEXT,
    Indicate_Drug_or_Biological_or_Device_or_Medical_Supply_5 TEXT,
    Product_Category_or_Therapeutic_Area_5 TEXT,
    Name_of_Drug_or_Biological_or_Device_or_Medical_Supply_5 TEXT,
    Associated_Drug_or_Biological_NDC_5 TEXT,
    Associated_Device_or_Medical_Supply_PDI_5 TEXT
);

-- ============================================
-- FACT_TRANSACTIONS
-- ============================================

CREATE TABLE Fact_Transactions (
    Record_ID INTEGER PRIMARY KEY,

    Recipient_ID INTEGER,
    Manufacturer_ID INTEGER,
    Teaching_Hospital_ID INTEGER,
    Payment_ID INTEGER,
    Travel_ID INTEGER,
    Third_Party_ID INTEGER,
    Product_ID INTEGER,

    Payment_Date_ID INTEGER,
    Publication_Date_ID INTEGER,

    Total_Amount_of_Payment_USDollars REAL,
    Number_of_Payments_Included_in_Total_Amount INTEGER,

    Program_Year INTEGER,

    FOREIGN KEY (Recipient_ID)
        REFERENCES Dim_Recipient(Recipient_ID),

    FOREIGN KEY (Manufacturer_ID)
        REFERENCES Dim_Manufacturer(Manufacturer_ID),

    FOREIGN KEY (Teaching_Hospital_ID)
        REFERENCES Dim_Teaching_Hospital(Teaching_Hospital_ID),

    FOREIGN KEY (Payment_ID)
        REFERENCES Dim_Payment(Payment_ID),

    FOREIGN KEY (Travel_ID)
        REFERENCES Dim_Travel(Travel_ID),

    FOREIGN KEY (Third_Party_ID)
        REFERENCES Dim_Third_Party(Third_Party_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Dim_Product(Product_ID),

    FOREIGN KEY (Payment_Date_ID)
        REFERENCES Dim_Date(Date_ID),

    FOREIGN KEY (Publication_Date_ID)
        REFERENCES Dim_Date(Date_ID)
);
