page 65004 "List for Promotions Header"

{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion Header";
    Caption = 'List for Promotion Header';

    Editable = false;




    layout
    {
        area(content)
        {
            repeater(promotion)
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