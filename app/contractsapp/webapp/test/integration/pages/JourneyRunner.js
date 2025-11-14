sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"blackwyse/contracts/contractsapp/test/integration/pages/ContractsList",
	"blackwyse/contracts/contractsapp/test/integration/pages/ContractsObjectPage"
], function (JourneyRunner, ContractsList, ContractsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('blackwyse/contracts/contractsapp') + '/test/flp.html#app-preview',
        pages: {
			onTheContractsList: ContractsList,
			onTheContractsObjectPage: ContractsObjectPage
        },
        async: true
    });

    return runner;
});

