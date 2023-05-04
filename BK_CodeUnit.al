/*

Add the ApplyPromotion(SalesHeader: Record “Sales Header”) function. 
The function should check all Sales Line records linked to the specified SalesHeader record and see if the “Promotion Code” is specified. 
If promotion need to be applied, the call the ApplyPromotion function from the “BK Apply Prom. Discount” codeunit.
*/

codeunit 65001 "BK Promotion Mgt."
{


    procedure ApplyPromotion(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Promotion: Record "BK Promotion";
        ApplyDiscount: Boolean;
        BKApplyPromDiscount: Codeunit "BK Apply Prom. Discount";
    begin
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