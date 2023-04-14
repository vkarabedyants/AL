table 65000 "BK Promotion"
{
    DataClassification = CustomerContent;

    Caption = 'Promotion';

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Discount Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            MinValue = 0;

        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }

    }
}