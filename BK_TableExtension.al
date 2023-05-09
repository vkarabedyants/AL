tableextension 65000 "BK Sales Line Ext." extends "Sales Line"
{

    fields
    {
        field(65000; "Promotion Code"; Code[20])
        {
            TableRelation = "BK Promotion";
            DataClassification = ToBeClassified;
        }

    }
}

tableextension 65001 "BK Sales Inv. Line Ext." extends "Sales Invoice Line"
{


    fields
    {
        field(65001; "Promotion Code"; Code[20])
        {
            TableRelation = "BK Promotion";
            DataClassification = ToBeClassified;
        }
    }
}