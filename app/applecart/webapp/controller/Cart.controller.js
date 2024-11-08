sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast"
], function (Controller, MessageToast) {
    "use strict";

    return Controller.extend("applecart.controller.Cart", {
        onInit: function () {
            // Set up a mock cart model
            var oCartModel = new sap.ui.model.json.JSONModel({
                items: []
            });
            this.getView().setModel(oCartModel, "cart");
        },

        onApplyDiscount: function () {
            var sDiscountCode = this.getView().byId("discountInput").getValue();
            // Apply discount logic (mock implementation)
            MessageToast.show("Discount applied: " + sDiscountCode);
        },

        onProceedToCheckout: function () {
            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("Checkout");
        }
    });
});