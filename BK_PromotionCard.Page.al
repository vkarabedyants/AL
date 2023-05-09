page 65003 "BK Promotion Card"

{
    PageType = Card;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion";
    Caption = 'BK Promotion Card';
    ObsoleteState = Pending;
    ObsoleteReason = 'Page is being replaced by a new promotion management system.';

    layout
    {
        area(content)
        {
            group(promotion)
            {


                field("Code"; rec.Code)
                {
                    ApplicationArea = All;
                }

                field("Description"; rec.Description)
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
    // Add to the OnNewRecord trigger the code which will copy the “Default Promotion Code” field value into the “Promotion Code” field on creating the new record.

}