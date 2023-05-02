table 65001 "BK Promotion Setup"
{
    DataClassification = CustomerContent;

    Caption = 'Promotion Setup';
    DrillDownPageId = "BK Promotion List";
    LookupPageId = "BK Promotion List";


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;

        }
        field(2; "Default Promotion Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "BK Promotion"."Code";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }

    }


}