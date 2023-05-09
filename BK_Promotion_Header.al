table 65003 "BK Promotion Header"
{
    Caption = 'Promotion Header';

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


        // Add to the “BK Promotion Header” table and pages the “BK Promotion Type” field of the “BK Promotion Type” enum type
        field(3; "Promotion Type"; Enum "BK Promotion Type")
        {
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; Code)
        {

        }
    }
}