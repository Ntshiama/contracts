using { sap.bwys.contracts as my } from '../db/schema';

annotate my.Partners with{
    title  @title : '{i18n>Title}';
    name   @title : '{i18n>Name}';
    email  @title : '{i18n>E-Mail}';
    phone  @title : '{i18n>Phone}';
    street @title : '{i18n>Street}';
    city   @title : '{i18n>City}';
   country @title : '{i18n>Country}'
};

annotate my.Contracts with {
   title            @title : '{i18n>Title}';
   description      @title : '{i18n>Description}';
   internalcontact  @title : '{i18n>Internalcontact}';
   partnercontract  @title : '{i18n>Perntercontact}';
   startdate        @title : '{i18n>Startdate}';
   enddate          @title : '{i18n>Enddare}';
   amount           @title : '{i18n>Amount}' @Measures.ISOCurrency : currency_code;   
   status           @title : '{i18n>Status}'; 
};



