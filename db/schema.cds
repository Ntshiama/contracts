using {
   cuid,
   managed,
   Currency,
   Country
} from '@sap/cds/common';

namespace blackwyse.contracts;


entity Partners : cuid, managed {
   title                     : localized String;
   name                      : localized String;
   @Core.IsEmail: true email : String;
   phone                     : String;
   street                    : String;
   city                      : String;
   postalcode                : String;
   country                   : Country;
}

entity Contracts : cuid, managed {
   title                                      : localized String;
   description                                : localized String;
   internalcontact                            : String;
   @Core.IsEmail : true internalcontactmail   : String;
   @Core.IsEmail : true partnercontract       : String;
   @Common.FieldControl: #Mandatory startdate : Date  @mandatory;
   enddate                                    : Date  @mandatory;
   @Core.Computed: true
   amount                                     : Decimal(15,2);
   currency                                   : Currency;
   status                                     : Association to ContractStatuses;
   partner                                    : Association to Partners;
   items                                      : Composition of many Contractitems
                                                   on items.parent = $self;

   attachments                                : Composition of many Attachments
                                                   on attachments.contract = $self;
}

entity Contractitems : cuid, managed {
   parent         : Association to one Contracts;
   description    : String;
   quantity       : Integer;
   price          : Decimal;
   currency       : Currency;
   startdate      : Date;
   enddate        : Date;
   attachments    : Composition of many Attachments
                       on attachments.item = $self;

   @Core.IsURL: true
   attachmentlink : String
}

entity Attachments : cuid, managed {
   contract       : Association to one Contracts;
   item           : Association to one Contractitems;

   @Core.IsURL: true
   attachmentlink : String
}

entity ContractStatuses : cuid, managed {
   status      : String(20);
   description : localized String;
}
