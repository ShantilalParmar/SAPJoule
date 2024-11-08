sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
    "use strict";

    return Controller.extend("applecart.controller.Homepage", {
        onInit: function () {
            // Set up a mock customer model
            var oCustomerModel = new JSONModel({
                name: "John Doe"
            });
            this.getView().setModel(oCustomerModel, "customer");
        },

        onSearch: function (oEvent) {
            var sQuery = oEvent.getParameter("query");
            if (sQuery) {
                MessageToast.show("Search for: " + sQuery);
                // Implement search functionality here
            }
        },

        onNavToProducts: function () {
            this.getOwnerComponent().getRouter().navTo("ProductsList");
        },

        onNavToCart: function () {
            this.getOwnerComponent().getRouter().navTo("Cart");
        },

        onNavToPurchaseHistory: function () {
            this.getOwnerComponent().getRouter().navTo("PurchaseHistory");
        },

        onNavToProfile: function () {
            this.getOwnerComponent().getRouter().navTo("Profile");
        },

        onNavToDiscounts: function () {
            this.getOwnerComponent().getRouter().navTo("Discounts");
        }
    });
});