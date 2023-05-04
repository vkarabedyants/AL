/*

Add the ApplyPromotion(SalesHeader: Record “Sales Header”) function. 
The function should check all Sales Line records linked to the specified SalesHeader record and see if the “Promotion Code” is specified. 
If promotion need to be applied, the call the ApplyPromotion function from the “BK Apply Prom. Discount” codeunit.
*/

codeunit 65001 "BK Promotion Mgt."
{

    local procedure SetDefaultPromotionCodeOnSalesLine(var SalesLine: Record "Sales Line")
    var
        BKPromotionSetup: Record "BK Promotion Setup";
    begin
        if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin
            if BKPromotionSetup.Get then begin
                SalesLine."Promotion Code" := BKPromotionSetup."Default Promotion Code";
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertSalesLine(var Rec: Record "Sales Line")
    begin
        // Set default promotion code on new sales lines
        SetDefaultPromotionCodeOnSalesLine(rec);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
    local procedure OnAfterPostSalesLine(var SalesInvLine: Record "Sales Invoice Line"; var SalesLine: Record "Sales Line")
    // var SalesInvLine: Record "Sales Invoice Line"; var SalesLine: Record "Sales Line"
    begin
        // Copy promotion code from sales line to sales invoice line
        SalesInvLine."Promotion Code" := SalesLine."Promotion Code";
    end;

    procedure ApplyPromotion(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Promotion: Record "BK Promotion";
        ApplyDiscount: Boolean;
        BKApplyPromDiscount: Codeunit "BK Apply Prom. Discount";
        Handled: Boolean;

    begin

        // Trigger the OnBeforeApplyPromotion event
        OnBeforeApplyPromotion(SalesHeader, Handled);

        if not Handled then begin
            SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetRange("Line Discount %", 0);
            SalesLine.SetRange("Promotion Code", '<>');

            ApplyDiscount := SalesLine.FindSet;

            while ApplyDiscount do begin
                Promotion.SetRange("Code", SalesLine."Promotion Code");

                if Promotion.FindSet then begin

                    // call the ApplyPromotion function from the “BK Apply Prom. Discount” codeunit.
                    //Codeunit."BK Apply Prom. Discount".ApplyPromotion(SalesHeader, SalesLine, Promotion);
                    BKApplyPromDiscount.ApplyPromotion(SalesHeader, SalesLine, Promotion);
                end;
                ApplyDiscount := SalesLine.FindSet;
            end;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApplyPromotion(var SalesHeader: Record "Sales Header"; var Handled: Boolean)
    begin
        // This event is triggered before applying promotions to sales header
        // Add custom logic here

        // Set Handled to true to skip the standard ApplyPromotion logic
        // Set Handled to false to continue with standard ApplyPromotion logic
    end;

}




codeunit 65002 "BK Apply Prom. Discount"
{

    procedure ApplyPromotion(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; Promotion: Record "BK Promotion")
    var
        DiscountAmount: Decimal;
        LineAmount: Decimal;
        NewLineAmount: Decimal;
    begin
        LineAmount := SalesLine."Line Amount";


        DiscountAmount := LineAmount * Promotion."Discount Amount" / 100;
        NewLineAmount := LineAmount - DiscountAmount;

        SalesLine."Line Discount %" := 100 - (NewLineAmount / LineAmount * 100);
        SalesLine."Line Amount" := NewLineAmount;

        SalesLine.Modify;


    end;
}