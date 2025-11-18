sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"blackwyse/contracts/contracts/test/integration/pages/ContractsList",
	"blackwyse/contracts/contracts/test/integration/pages/ContractsObjectPage"
], function (JourneyRunner, ContractsList, ContractsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('blackwyse/contracts/contracts') + '/test/flpSandbox.html#blackwysecontractscontracts-tile',
        pages: {
			onTheContractsList: ContractsList,
			onTheContractsObjectPage: ContractsObjectPage
        },
        async: true
    });

    return runner;
});

