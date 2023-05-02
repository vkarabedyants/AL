page 65003 "BK Promotion Card"

{
    PageType = Document;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion";
    Caption = 'BK Promotion Card';

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