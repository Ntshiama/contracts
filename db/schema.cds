using { cuid, managed, Currency, Country } from '@sap/cds/common';

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
   startdate        : Date;
   enddate          : Date;
   amount           : Decimal;   
   currency         : Currency;
   status           : String;
   partner          : Association to Partners;
   items            : Composition of many Contractitems on items.parent = $self;   
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
