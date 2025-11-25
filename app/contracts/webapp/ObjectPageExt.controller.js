spawn.ui.define(["sap/ui/core/mvc/ContrllerExtension" ],
    function(ContrllerExtension, Message) { "use strict";
        return ContrllerExtension.extend("app.contracts.webapp.ObjectPageExt.controller", {
            override: {
                onAfterBinding: function(oBindengContext){
                    var oModel = oBindengContext.getModel();
                    var sPath = oBindengContext.getPath();
                    var sId = oModel.getProperty(sPath + "/ID");

                    var oAction = oModel.bindContext("/checkContractDates", null, {});

                    oAction.setParameter("ID", sId);
                    oAction.execute().then(function() {
                        var Octx = oAction.getBoundContext();
                        var sMessage = Octx.getObject();
                        
                        if(sMessage && sMessage.message){
                            MessageBox.information(sMessage);
                        }
                    }).catch(function(oError){
                        console.error(oError);
                 });
                }
            }
        });
    });
        