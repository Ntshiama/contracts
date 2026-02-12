using {
   cuid,
   managed,
   Currency,
   Country
} from '@sap/cds/common';

namespace blackwyse.contracts;


entity Partners : cuid, managed {
   title      : localized String;
   name       : localized String;

   @Core.IsEmail : true
   @assert.format: 'email'
   email      : String(255);
   phone      : String(40);
   street     : String;
   city       : String;
   postalcode : String;
   country    : Country;
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
   amount                                     : Decimal(15, 2);
   currency                                   : Currency;
   status                                     : Association to ContractStatuses;
   partner                                    : Association to Partners;
   items                                      : Composition of many Contractitems
                                                   on items.parent = $self;

   attachments                                : Composition of many Attachments
                                                   on attachments.contract = $self;
}

entity Contractitems : cuid, managed {
   parent          : Association to one Contracts;
   position        : Integer;
   description     : String;
   quantity        : Integer;
   price           : Decimal;
   currency        : Currency;
   startdate       : Date;
   enddate         : Date;
   attachments     : Composition of many Attachments
                        on attachments.item = $self;
   attachmentlinks : String; // comma-separated list of attachment URLs

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
