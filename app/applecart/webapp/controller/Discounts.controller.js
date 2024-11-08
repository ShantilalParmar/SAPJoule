sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel"
], function (Controller, JSONModel) {
    "use strict";

    return Controller.extend("applecart.controller.Discounts", {
        onInit: function () {
            // Set up mock data for discounts
            var oDiscountsModel = new JSONModel({
                discounts: [
                    { code: "NEWYEAR", percentage: 10, validity: "2023-12-31" }
                ]
            });
            this.getView().setModel(oDiscountsModel, "discounts");
        }
    });
});