using {blackwyse.contracts as my} from '../db/schema';

annotate my.Partners with {
   title      @title: '{i18n>Title}';
   name       @title: '{i18n>Name}';
   email      @title: '{i18n>E-Mail}';
   phone      @title: '{i18n>Phone}';
   street     @title: '{i18n>Street}';
   postalcode @title: '{i18n>Postalcode}';
   city       @title: '{i18n>City}';
   country    @title: '{i18n>Country}';
};

annotate my.Contracts with {
   title                @title: '{i18n>Title}';
   description          @title: '{i18n>Description}';
   internalcontactname  @title: '{i18n>Internalcontact}';
   internalcontactmail @title: '{i18n>Internalcontactmail}';
   partnercontract      @title: '{i18n>Perntercontact}';
   startdate            @title: '{i18n>Begin}';
   enddate              @title: '{i18n>End}';
   amount               @title: '{i18n>Amount}'  @Measures.ISOCurrency: currency_code;
   status               @title: '{i18n>Status}';
};

annotate my.Contractitems with {
   parent      @title: '{i18n>Title}';
   description @title: '{i18n>Description}';
   quantity    @title: '{i18n>Quantity}';
   price       @title: '{i18n>Price}';
   currency    @title: '{i18n>Currency}';
   startdate   @title: '{i18n>Startdate}';
   enddate     @title: '{i18n>Enddate}';
};
