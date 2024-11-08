using { appleCartSrv } from '../srv/service.cds';

annotate appleCartSrv.Customers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate appleCartSrv.Customers with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate appleCartSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email', ID: 'Email' }
];
annotate appleCartSrv.Customers with @UI.HeaderInfo: {
  TypeName: 'Customer',
  TypeNamePlural: 'Customers',
  Title: { Value: customerID }
};
annotate appleCartSrv.Customers with {
  ID @UI.Hidden
};
annotate appleCartSrv.Customers with @UI.Identification: [{ Value: customerID }];
annotate appleCartSrv.Customers with {
  name @Common.Label: 'Name';
  email @Common.Label: 'Email';
  customerID @Common.Label: 'Customer ID';
  purchaseHistory @Common.Label: 'Purchase History';
  membershipStatus @Common.Label: 'Membership Status';
  Purchases @Common.Label: 'Purchases'
};
annotate appleCartSrv.Customers with {
  membershipStatus @Common.Text : { $value: membershipStatus.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate appleCartSrv.Customers with {
  membershipStatus @Common.ValueListWithFixedValues;
};
annotate appleCartSrv.Customers with @UI.SelectionFields: [
  customerID,
  membershipStatus_code
];
annotate appleCartSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerID },
    { $Type: 'UI.DataField', Value: purchaseHistory },
    { $Type: 'UI.DataField', Value: membershipStatus_code, Criticality: membershipStatus.criticality }
];
annotate appleCartSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerID },
    { $Type: 'UI.DataField', Value: purchaseHistory },
    { $Type: 'UI.DataField', Value: membershipStatus_code, Criticality: membershipStatus.criticality }
]};
annotate appleCartSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate appleCartSrv.Products with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate appleCartSrv.Products with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate appleCartSrv.Products with @UI.DataPoint #category: {
  Value: category_code,
  Title: 'Category',
};
annotate appleCartSrv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price', ID: 'Price' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#category', ID: 'Category' }
];
annotate appleCartSrv.Products with @UI.HeaderInfo: {
  TypeName: 'Product',
  TypeNamePlural: 'Products'
};
annotate appleCartSrv.Products with {
  name @Common.Label: 'Name';
  description @Common.Label: 'Description';
  price @Common.Label: 'Price';
  category @Common.Label: 'Category';
  stockQuantity @Common.Label: 'Stock Quantity';
  sku @Common.Label: 'Sku';
  Purchases @Common.Label: 'Purchases'
};
annotate appleCartSrv.Products with {
  category @Common.Text : { $value: category.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate appleCartSrv.Products with {
  category @Common.ValueListWithFixedValues;
};
annotate appleCartSrv.Products with @UI.SelectionFields : [
 category_code,
 price,
 stockQuantity
];
annotate appleCartSrv.Products with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: sku },
    { $Type: 'UI.DataField', Value: category_code },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: stockQuantity }
];
annotate appleCartSrv.Products with @UI.FieldGroup #productDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: category_code },
    { $Type: 'UI.DataField', Value: stockQuantity },
    { $Type: 'UI.DataField', Value: sku }

  ]
};


annotate appleCartSrv.Purchases with @UI.LineItem #purchases: [
    { $Type: 'UI.DataField', Value: purchaseID },
    { $Type: 'UI.DataField', Value: purchaseDate },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: customerID },
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: quantity }

  ];


annotate appleCartSrv.Products with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'generalInfo',
    Label: 'General Information',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'productDetails', Label: 'Product Details', Target: '@UI.FieldGroup#productDetails' } ]
  },
  {
    $Type: 'UI.CollectionFacet',
    ID: 'purchaseHistory',
    Label: 'Purchase History',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'purchases', Label: 'Purchases', Target: 'Purchases/@UI.LineItem#purchases' } ]
  }
];
annotate appleCartSrv.Purchases with {
  customers @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customers_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'purchaseHistory'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'membershipStatus_code'
      },
    ],
  }
};
annotate appleCartSrv.Purchases with {
  products @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: products_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'category_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'stockQuantity'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'sku'
      },
    ],
  }
};
annotate appleCartSrv.Purchases with {
  discounts @Common.ValueList: {
    CollectionPath: 'Discounts',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: discounts_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'discountCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'discountPercentage'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'validityPeriod'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'applicableProducts'
      },
    ],
  }
};
annotate appleCartSrv.Purchases with @UI.DataPoint #purchaseDate: {
  Value: purchaseDate,
  Title: 'Purchase Date',
};
annotate appleCartSrv.Purchases with @UI.DataPoint #totalAmount: {
  Value: totalAmount,
  Title: 'Total Amount',
};
annotate appleCartSrv.Purchases with @UI.DataPoint #customerID: {
  Value: customerID,
  Title: 'Customer ID',
};
annotate appleCartSrv.Purchases with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#purchaseDate', ID: 'PurchaseDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#totalAmount', ID: 'TotalAmount' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerID', ID: 'CustomerID' }
];
annotate appleCartSrv.Purchases with @UI.HeaderInfo: {
  TypeName: 'Purchase',
  TypeNamePlural: 'Purchases',
  Title: { Value: purchaseID }
};
annotate appleCartSrv.Purchases with {
  ID @UI.Hidden
};
annotate appleCartSrv.Purchases with @UI.Identification: [{ Value: purchaseID }];
annotate appleCartSrv.Purchases with {
  purchaseID @Common.Label: 'Purchase ID';
  purchaseDate @Common.Label: 'Purchase Date';
  totalAmount @Common.Label: 'Total Amount';
  customerID @Common.Label: 'Customer ID';
  productID @Common.Label: 'Product ID';
  quantity @Common.Label: 'Quantity';
  customers @Common.Label: 'Customer';
  products @Common.Label: 'Product';
  discounts @Common.Label: 'Discount'
};
annotate appleCartSrv.Purchases with {
  discounts @Common.Text: { $value: discounts.discountCode, ![@UI.TextArrangement]: #TextOnly };
};
annotate appleCartSrv.Purchases with @UI.SelectionFields: [
  customers_ID,
  products_ID,
  discounts_ID
];
annotate appleCartSrv.Purchases with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: purchaseID },
    { $Type: 'UI.DataField', Value: purchaseDate },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: customerID },
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customers_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: products_ID },
    { $Type: 'UI.DataField', Label: 'Discount', Value: discounts_ID }
];
annotate appleCartSrv.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: purchaseID },
    { $Type: 'UI.DataField', Value: purchaseDate },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: customerID },
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customers_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: products_ID },
    { $Type: 'UI.DataField', Label: 'Discount', Value: discounts_ID }
]};
annotate appleCartSrv.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate appleCartSrv.Discounts with @UI.DataPoint #discountPercentage: {
  Value: discountPercentage,
  Title: 'Discount Percentage',
};
annotate appleCartSrv.Discounts with @UI.DataPoint #validityPeriod: {
  Value: validityPeriod,
  Title: 'Validity Period',
};
annotate appleCartSrv.Discounts with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#discountPercentage', ID: 'DiscountPercentage' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#validityPeriod', ID: 'ValidityPeriod' }
];
annotate appleCartSrv.Discounts with @UI.HeaderInfo: {
  TypeName: 'Discount',
  TypeNamePlural: 'Discounts',
  Title: { Value: discountCode }
};
annotate appleCartSrv.Discounts with {
  ID @UI.Hidden
};
annotate appleCartSrv.Discounts with @UI.Identification: [{ Value: discountCode }];
annotate appleCartSrv.Discounts with {
  discountCode @Common.Label: 'Discount Code';
  discountPercentage @Common.Label: 'Discount Percentage';
  validityPeriod @Common.Label: 'Validity Period';
  applicableProducts @Common.Label: 'Applicable Products';
  Purchases @Common.Label: 'Purchases'
};
annotate appleCartSrv.Discounts with {
  ID @Common.Text: { $value: discountCode, ![@UI.TextArrangement]: #TextOnly };
};
annotate appleCartSrv.Discounts with @UI.SelectionFields: [
  discountCode
];
annotate appleCartSrv.Discounts with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: discountCode },
    { $Type: 'UI.DataField', Value: discountPercentage },
    { $Type: 'UI.DataField', Value: validityPeriod },
    { $Type: 'UI.DataField', Value: applicableProducts }
];
annotate appleCartSrv.Discounts with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: discountCode },
    { $Type: 'UI.DataField', Value: discountPercentage },
    { $Type: 'UI.DataField', Value: validityPeriod },
    { $Type: 'UI.DataField', Value: applicableProducts }
]};
annotate appleCartSrv.Discounts with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];