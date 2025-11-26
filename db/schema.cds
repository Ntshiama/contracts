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

   @Core.IsEmail: true
   email      : String;
   phone      : String;
   street     : String;
   city       : String;
   postalcode : String;
   country    : Country;
}

entity Contracts : cuid, managed {
   title                : localized String;
   description          : localized String;
   internalcontactname  : localized String;
   internalcontactmail : String;
   partnercontract      : String;

   @Common.FieldControl: #Mandatory
   startdate            : Date;
   enddate              : Date;
   amount               : Decimal;
   currency             : Currency;
   status               : String;
   partner              : Association to Partners;
   items                : Composition of many Contractitems
                             on items.parent = $self;
}

entity Contractitems : cuid, managed {
   parent         : Association to one Contracts;
   description    : String;
   quantity       : Integer;
   price          : Decimal;
   currency       : Currency;
   startdate      : Date;
   enddate        : Date;
   attachmentlink : String
}
