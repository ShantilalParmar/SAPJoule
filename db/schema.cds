using { sap.common.CodeList } from '@sap/cds/common';

namespace appleCart;

entity CustomersMembershipStatusCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
  criticality : Integer;
}

entity ProductsCategoryCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
}

entity Customers {
  key ID: UUID;
  name: String(50);
  email: String(50);
  customerID: Integer @assert.unique @mandatory;
  purchaseHistory: String;
  membershipStatus: Association to CustomersMembershipStatusCodeList;
  Purchases: Association to many Purchases on Purchases.customers = $self;
}

entity Products {
  key ID: UUID;
  name: String(50);
  description: String(255);
  price: Decimal;
  category: Association to ProductsCategoryCodeList;
  stockQuantity: Integer;
  sku: String(50);
  Purchases: Association to many Purchases on Purchases.products = $self;
}

entity Purchases {
  key ID: UUID;
  purchaseID: Integer @assert.unique @mandatory;
  purchaseDate: DateTime;
  totalAmount: Decimal;
  customerID: Integer;
  productID: Integer;
  quantity: Integer;
  customers: Association to Customers;
  products: Association to Products;
  discounts: Association to Discounts;
}

entity Discounts {
  key ID: UUID;
  discountCode: String(50) @assert.unique @mandatory;
  discountPercentage: Decimal;
  validityPeriod: String(50);
  applicableProducts: String;
  Purchases: Association to many Purchases on Purchases.discounts = $self;
}

entity Carts {
  key ID: UUID;
  cartID : Integer;
  customerID : Integer;
  items : String;
  totalAmount : Decimal;
  customers : Association to Customers;
}