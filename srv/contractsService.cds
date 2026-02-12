
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
            internalcontactmail,
            partnercontract,
            startdate,
            enddate,
            @readonly
            amount,  
            currency,
            status{ status, description },
            partner,
            items : redirected to Contractitems,
            attachments : redirected to Attachments
       };
    @cds.odata.valuelist
    entity Contractitems as 
        projection on my.Contractitems {
          key ID,
              position,
              parent,
              description,
              quantity,
              price,
              currency ,
              startdate,
              enddate
                           
    };

    @cds.odata.valuelist
    entity Attachments as
        projection on my.Attachments {
          key ID,
              contract,
              item,
              @core.isURL: true
              attachmentlink
        };
    @cds.odata.valuelist
    entity ContractStatuses as
        projection on my.ContractStatuses {
          key ID,
              status,
              description
        };
    @requires: 'authenticated-user'
    action checkContractDates(ID : UUID) returns String;
}