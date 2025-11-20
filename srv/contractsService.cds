
using { blackwyse.contracts as my } from '../db/schema';

service ContractService {
    @cds.odata.valuelist
    @odata.draft.enabled
    entity Partners as 
       projection on my.Partners{
         key ID,
             title,
             name,
             @Communication.IsEmailAddress: true
             email,
             phone,
             street,
             postalcode,
             city,
             country  
       };

    @cds.odata.valuelist
    @odata.draft.enabled
    entity Contracts as
       projection on my.Contracts {
        key ID,
            title,
            description,
            internalcontact,
            //,
            startdate,
            enddate,
            amount,  
            currency,
            status,
            partner,
            items : redirected to Contractitems
       };
    @cds.odata.valuelist
    entity Contractitems as 
        projection on my.Contractitems {
          key ID,
              parent,
              description,
              quantity,
              price,
              currency ,
              startdate,
              enddate,
              @Core.IsURL: true
              attachmentlink,
                           
    };
}