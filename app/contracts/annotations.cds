using ContractService as service from '../../srv/contractsService';

annotate service.Contracts with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Value: internalcontactname,
            },
            {
                $Type: 'UI.DataField',
                Value: internalcontactmail,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Partner Name',
                Value: partner.name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Partner Email',
                Value: partner.email,
            },
            {
                $Type: 'UI.DataField',
                Value: startdate,
            },
            {
                $Type: 'UI.DataField',
                Value: enddate,
            },
            {
                $Type: 'UI.DataField',
                Value: amount,
            },
            {
                $Type: 'UI.DataField',
                Value: status,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Label : 'Contract Items',
            Target: 'items/@UI.LineItem',
        },

    ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: title,
            ![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: internalcontactname,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Partner Name',
            Value: partner.name,
        },
        {
            $Type: 'UI.DataField',
            Value: startdate,
        },
    ],
);

annotate service.Contractitems with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: description,
    },
    {
        $Type: 'UI.DataField',
        Value: quantity,
    },
    {
        $Type: 'UI.DataField',
        Value: price,
    },
    {
        $Type: 'UI.DataField',
        Value: currency_code,
    },
    {
        $Type: 'UI.DataField',
        Value: startdate,
    },
    {
        $Type: 'UI.DataField',
        Value: enddate,
    },
    {
        $Type: 'UI.DataFieldWithUrl',
        Label: 'Attachment Link',
        Value: attachmentlink,
    },
];
