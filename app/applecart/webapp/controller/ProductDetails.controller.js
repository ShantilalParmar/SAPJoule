sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
    "use strict";

    return Controller.extend("applecart.controller.ProductDetails", {
        onInit: function () {
            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.getRoute("ProductDetails").attachPatternMatched(this._onObjectMatched, this);
        },

        _onObjectMatched: function (oEvent) {
            var sProductPath = oEvent.getParameter("arguments").productPath;
            this.getView().bindElement({
                path: "/" + sProductPath,
                model: "products"
            });
        },

        onAddToCart: function () {
            var oView = this.getView();
            var sPath = oView.getElementBinding("products").getPath();
            var oProduct = oView.getModel("products").getProperty(sPath);
            var iQuantity = parseInt(oView.byId("quantityInput").getValue(), 10);

            // Add product to cart (mock implementation)
            var oCartModel = this.getView().getModel("cart");
            var aCartItems = oCartModel.getProperty("/items") || [];
            aCartItems.push({
                product: oProduct,
                quantity: iQuantity
            });
            oCartModel.setProperty("/items", aCartItems);

            MessageToast.show("Added to cart");
        }
    });
});