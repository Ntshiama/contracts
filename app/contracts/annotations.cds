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
                Value: internalcontact,
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
                $Type    : 'UI.DataField',
                @readonly: true,
                Value    : amount,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Common.Text: status.description,
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
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet3',
            Label : 'Attachments',
            Target: 'attachments/@UI.LineItem',
        },

    ],
    UI.LineItem                  : [
        {
            $Type            : 'UI.DataField',
            Value            : title,
            ![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: internalcontact,
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
    UI.HeaderInfo                : {
        TypeName      : 'Contract',
        TypeNamePlural: 'Contracts',
        Title         : {
            $Type: 'UI.DataField',
            Value: title,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: partner_ID,
        },
    },
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
];

annotate service.Attachments with @UI.LineItem: [{
    $Type: 'UI.DataFieldWithUrl',
    Label: 'Attachment Link',
    Value: attachmentlink,
}, ];

annotate service.ContractStatuses with @(
  Common.ValueList: {
    $Type: 'Common.ValueListType',
    CollectionPath: 'ContractStatuses',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: status,
        ValueListProperty: 'status'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      }
    ]
  },
  Common.ValueListWithFixedValues: true
);

annotate service.Contracts with {
  status @Common.Text: status.description
         @Common.TextArrangement: #TextFirst;
};


