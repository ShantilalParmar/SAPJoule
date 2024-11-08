using { appleCart } from '../db/schema.cds';

service appleCartSrv {
  entity Customers as projection on appleCart.Customers;
  @odata.draft.enabled
  entity Products as projection on appleCart.Products;
  entity Purchases as projection on appleCart.Purchases;
  entity Discounts as projection on appleCart.Discounts;
  entity Carts as projection on appleCart.Carts;
}