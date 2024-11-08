sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel"
], function (Controller, JSONModel) {
    "use strict";

    return Controller.extend("applecart.controller.PurchaseHistory", {
        onInit: function () {
            // Set up mock data for purchase history
            var oPurchasesModel = new JSONModel({
                purchases: [
                    { purchaseID: "001", purchaseDate: "2023-01-01", totalAmount: "$1798", details: "iPhone 13, iPad Pro" }
                ]
            });
            this.getView().setModel(oPurchasesModel, "purchases");
        },

        onPurchasePress: function (oEvent) {
            var oItem = oEvent.getSource();
            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("PurchaseDetails", {
                purchasePath: oItem.getBindingContext("purchases").getPath().substr(1)
            });
        }
    });
});