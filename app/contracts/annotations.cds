using ContractService as service from '../../srv/contractsService';
annotate service.Contracts with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
                Value : partner.name,
            },
            {
                $Type : 'UI.DataField',
                Value : partner.email,
            },
            {
                $Type : 'UI.DataField',
                Value : internalcontactemail,
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
                Label : 'status_description',
                Value : status_description,
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
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details Information',
            ID : 'DetailInformation',
            Target : 'items/@UI.LineItem#DetailInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Attachments Infomation',
            ID : 'AttachmentInfomation',
            Target : 'attachments/@UI.LineItem#AttachmentInfomation',
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
            Value : partner.name,
        },
        {
            $Type : 'UI.DataField',
            Value : startdate,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : 'Contract',
        TypeNamePlural : 'Contracts',
    },
);
annotate service.Contractitems with @(
    UI.LineItem #DetailInformation : [
        {
            $Type : 'UI.DataField',
            Value : parent.items.position,
            Label : 'Position',
        },
        {
            $Type : 'UI.DataField',
            Value : parent.items.description,
        },
        {
            $Type : 'UI.DataField',
            Value : parent.items.price,
        },
        {
            $Type : 'UI.DataField',
            Value : parent.items.quantity,
        },
        {
            $Type : 'UI.DataField',
            Value : parent.items.startdate,
        },
        {
            $Type : 'UI.DataField',
            Value : parent.items.enddate,
        },
    ]
);

annotate service.Attachments with @(
    UI.LineItem #AttachmentInfomation : [
        {
            $Type : 'UI.DataField',
            Value : item.position,
            Label : 'item_position',
        },
        {
            $Type : 'UI.DataField',
            Value : contract.title,
            Label : 'contract_ID',
        },
        {
            $Type : 'UI.DataField',
            uri : true,
            Value : attachmentlink,
            Label : 'attachmentlink',
        },
    ]
);

