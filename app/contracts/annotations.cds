using ContractService as service from '../../srv/contactsService';
annotate service.Contracts with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : internalcontact,
            },
            {
                $Type : 'UI.DataField',
                Value : partnercontract,
            },
            {
                $Type : 'UI.DataField',
                Value : startdate,
            },
            {
                $Type : 'UI.DataField',
                Value : enddate,
            },
            {
                $Type : 'UI.DataField',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : internalcontact,
        },
        {
            $Type : 'UI.DataField',
            Value : partnercontract,
        },
        {
            $Type : 'UI.DataField',
            Value : startdate,
        },
    ],
);

