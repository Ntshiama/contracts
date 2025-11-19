using { cuid, managed, Currency, Country } from '@sap/cds/common';
  namespace blackwyse.contracts;
  
  
entity Partners : cuid, managed {
   title      : localized String;
   name       : String;
   email      : String;
   phone      : String;
   street     : String;
   city       : String;
   postalcode : String;
   country    : Country;
   }

entity Contracts: cuid, managed {
   title            : localized String;
   description      : localized String;
   internalcontact  : String;
   partnercontract  : String;
   @Common.FieldControl: #Mandatory
   startdate        : Date;
   enddate          : Date;
   amount           : Decimal;   
   currency         : Currency;
   status           : localized String;
   partner          : Association to Partners;
   items            : Composition of many Contractitems on items.parent = $self;   
   }

entity Contractitems: cuid, managed {
    parent      : Association to one Contracts;
    description : String;
    quantity    : Integer;
    price       : Decimal;
    currency    : Currency;
    startdate   : Date;
    enddate     : Date;
    @Core.IsURL: true
    attachmentlink: String @title : 'Attachment Link'
    }
