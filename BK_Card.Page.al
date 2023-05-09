page 65006 "Card for promotions"

{
    PageType = Card;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion header";
    Caption = 'Card for Promotion';

    // Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {


                field("Code"; rec.Code)
                {
                    ApplicationArea = All;
                }

                field("Description"; rec.Description)
                {
                    ApplicationArea = All;
                }


                // Add to the “BK Promotion Header” table and pages the “BK Promotion Type” field of the “BK Promotion Type” enum type
                field("Promotion Type"; rec."Promotion Type")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}