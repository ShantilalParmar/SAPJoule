sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast"
], function (Controller, MessageToast) {
    "use strict";

    return Controller.extend("applecart.controller.Checkout", {
        onInit: function () {
            // Set up a mock customer model
            var oCustomerModel = new sap.ui.model.json.JSONModel({
                name: "John Doe",
                email: "john.doe@example.com"
            });
            this.getView().setModel(oCustomerModel, "customer");
        },

        onPlaceOrder: function () {
            // Place order logic (mock implementation)
            MessageToast.show("Order placed successfully");

            // Clear the cart
            var oCartModel = this.getView().getModel("cart");
            oCartModel.setProperty("/items", []);
        }
    });
});