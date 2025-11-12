sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'blackwyse.contract.ui.contractapp',
            componentId: 'PartnersObjectPage',
            contextPath: '/Partners'
        },
        CustomPageDefinitions
    );
});