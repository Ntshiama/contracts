sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"blackwyse/contract/ui/contractapp/test/integration/pages/PartnersList",
	"blackwyse/contract/ui/contractapp/test/integration/pages/PartnersObjectPage"
], function (JourneyRunner, PartnersList, PartnersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('blackwyse/contract/ui/contractapp') + '/test/flp.html#app-preview',
        pages: {
			onThePartnersList: PartnersList,
			onThePartnersObjectPage: PartnersObjectPage
        },
        async: true
    });

    return runner;
});

