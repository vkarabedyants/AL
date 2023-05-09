page 65005 "ListPart for Promotion Line"

{
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion Line";
    Caption = 'ListPart for Line';

    // Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {


                field("Promotion Code"; rec."Promotion Code")
                {
                    ApplicationArea = All;
                }


                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Discount Amount"; rec."Discount Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}