pageextension 65001 "BK Sales Order Ext." extends "Sales Order"
{

    actions

    {
        addlast(navigation)
        {
            action(Apply)
            {
                Caption = 'Promotion';
                ApplicationArea = All;

            }
        }

    }
}


pageextension 65002 "BK Sales Ord.Sbf. Ext." extends "Sales Order Subform"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Promotion Code"; true)
            {
                ApplicationArea = All;
                ToolTip = 'Promotion Code';
            }
        }
    }

    // Add to the OnNewRecord trigger the code which will copy the “Default Promotion Code” field value into the “Promotion Code” field on creating the new record.

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        PromotionSetup: Record "BK Promotion Setup";
    begin
        if PromotionSetup.Get then
            rec."Promotion Code" := PromotionSetup."Default Promotion Code";

    end;

}


pageextension 65003 "BK Pstd.SalesInv.Sbfrm. Ext." extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Allow Invoice Disc.")
        {
            field("Promotion Code"; true)
            {
                ApplicationArea = All;
                ToolTip = 'Promotion Code';
            }
        }
    }
}