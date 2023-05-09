table 65004 "BK Promotion Line"
{
    Caption = 'Promotion';

    fields
    {
        field(1; "Promotion Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "BK Promotion Header"."Code";


        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
        }
        field(4; "Discount Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; "Promotion Code", "Line No.")
        {
            Clustered = true;
        }
    }
}