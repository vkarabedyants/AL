page 65002 "BK Promotion Card"
{
    PageType = Card;
    SourceTable = "BK Promotion";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field(DiscountAmount; Rec."Discount Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies discount amount in the currency of the promotion.';
                }
            }
        }
    }

    trigger OnNewRecord()
    begin

        Rec.Defa := Rec."Default Promotion Code";

    end;
}