sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
    "use strict";

    return Controller.extend("applecart.controller.Products", {
        onInit: function () {
            // Set up mock data for products and categories
            var oProductsModel = new JSONModel({
                products: [
                    { name: "iPhone 13", description: "Latest iPhone model", price: "$799", category: "iPhone" },
                    { name: "iPad Pro", description: "High-performance iPad", price: "$999", category: "iPad" }
                ]
            });
            this.getView().setModel(oProductsModel, "products");

            var oCategoriesModel = new JSONModel({
                categories: [
                    { key: "all", text: "All" },
                    { key: "iPhone", text: "iPhone" },
                    { key: "iPad", text: "iPad" }
                ]
            });
            this.getView().setModel(oCategoriesModel, "categories");
        },

        onSearch: function (oEvent) {
            var sQuery = oEvent.getParameter("query");
            var oList = this.byId("productList");
            var oBinding = oList.getBinding("items");
            var aFilters = [];
            if (sQuery) {
                aFilters.push(new sap.ui.model.Filter("name", sap.ui.model.FilterOperator.Contains, sQuery));
            }
            oBinding.filter(aFilters);
        },

        onCategoryChange: function (oEvent) {
            var sKey = oEvent.getParameter("selectedItem").getKey();
            var oList = this.byId("productList");
            var oBinding = oList.getBinding("items");
            var aFilters = [];
            if (sKey !== "all") {
                aFilters.push(new sap.ui.model.Filter("category", sap.ui.model.FilterOperator.EQ, sKey));
            }
            oBinding.filter(aFilters);
        },

        onProductPress: function (oEvent) {
            var oItem = oEvent.getSource();
            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("ProductDetails", {
                productPath: oItem.getBindingContext("products").getPath().substr(1)
            });
        }
    });
});