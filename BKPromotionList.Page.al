page 65002 "BK Promotion List"

{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion";
    Caption = 'Promotions';
    CardPageID = "BK Promotion Card";
    Editable = false;

    // please set LookupPageID and DrillDownPageID equal to this page on the source table definition.


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
                field("Discount Amount"; rec."Discount Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}