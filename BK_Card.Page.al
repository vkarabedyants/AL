page 65006 "Card for promotions"

{
    PageType = Card;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion Line";
    Caption = 'Card for Promotion';

    // Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {


                field("Code"; rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field("Promotion Code"; rec."Promotion Code")
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