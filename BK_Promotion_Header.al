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

    }

    keys
    {
        key(PK; Code)
        {

        }
    }
}