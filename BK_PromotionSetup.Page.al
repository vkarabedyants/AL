page 65001 "BK Promotion Setup"

{
    PageType = Card;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "BK Promotion Setup";
    Caption = 'Promotion Setup';


    // please set LookupPageID and DrillDownPageID equal to this page on the source table definition.


    layout
    {
        area(content)
        {
            repeater(promotion)
            {


                field("Primary Key"; rec."Primary Key")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Default Promotion Cod"; rec."Default Promotion Code")
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    /// Triggers when the page is opened. ??? 
    trigger OnOpenPage()
    begin
        rec.Reset();
        if not rec.Get() then begin
            rec.Init();
            rec.Insert();
        end
    end;
}