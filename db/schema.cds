using { cuid, managed, Currency, Country } from '@sap/cds/common';

entity Partner : cuid, managed {
   title    : localized String;
   name     : localized String;
   email    :localized String;
   phone    : localized String;
   street    : localized String;
   city     : localized String;
   country  : Country;
   }

entity contract: cuid, managed {
   title            : localized String;
   description      : localized String;
   internalcontract  : localized String;
   partnercontract  :localized String;
   startdate        : Date;
   enddate          : Date;
   amount           : Decimal;   
   currency         : Currency;
   status           : localized String;
   partner          : Association to Partner;
   //items            : Association to many contractitem on items.contract = $self;   
   }

entity contractitem: cuid, managed {
    parent      : Association to  contract;
    description : localized String;
    quantity    : Integer;
    price       : Decimal;
    currency    : Currency;
    startdate   : Date;
    enddate     : Date;
    @Core.IsURL: true
    attachmentlink: localized String @title : 'Attachment Link'
    }
