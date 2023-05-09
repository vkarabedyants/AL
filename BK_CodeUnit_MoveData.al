codeunit 65003 "Upgrade BK Promotion Data"
{
    Subtype = Upgrade;

    trigger OnRun()
    var
        PromotionHeader: Record "BK Promotion Header";
        PromotionLine: Record "BK Promotion Line";
        Promotion: Record "BK Promotion";
        LineNo: Integer;
    begin
        // Copy data from "BK Promotion" table to "BK Promotion Header" and "BK Promotion Line" tables
        Promotion.SETRANGE("Code", '<>', ''); // exclude records with blank code
        LineNo := 1;

        WHILE Promotion.FINDFIRST DO BEGIN
            // Insert record into "BK Promotion Header" table
            PromotionHeader.INIT;
            PromotionHeader."Code" := Promotion."Code";
            PromotionHeader."Description" := Promotion."Description";
            PromotionHeader.INSERT;
            PromotionLine.INIT;
            PromotionLine."Promotion Code" := Promotion."Code";
            PromotionLine."Discount Amount" := Promotion."Discount Amount";
            PromotionLine."Line No." := LineNo;
            PromotionLine.INSERT;
            LineNo := LineNo + 1000;

        END;

        MESSAGE('Data upgrade completed.');
    end;


}