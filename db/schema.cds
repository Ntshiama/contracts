using { cuid, managed, Currency, Country } from '@sap/cds/common';

<<<<<<< HEAD
entity Partners : cuid, managed {
   title    : String;
   name     : String;
   email    : String;
   phone    : String;
   stree    : String;
   city     : String;
   country  : Country;
   }

entity Contracts: cuid, managed {
   title            : String;
   description      : String;
   internalcontacr  : String;
   partnercontract  : String;
=======
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
>>>>>>> 5b835799c9ae938faadce83743cf170deb1b4d84
   startdate        : Date;
   enddate          : Date;
   amount           : Decimal;   
   currency         : Currency;
   status           : String;
   partner          : Association to Partners;
   contractitems: Association to many Contractitems on Contractitems.parent = $self;   
   }

entity Contractitems: cuid, managed {
    parent      : Association to  Contracts;
    description : String;
    quantity    : Integer;
    price       : Decimal;
    currency    : Currency;
    startdate   : Date;
    enddate     : Date;
    @Core.IsURL: true
    attachmentlink: String @title : 'Attachment Link'
    }
