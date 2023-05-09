interface BK_IPromotion
{
    procedure ApplyPromotion(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line");
}