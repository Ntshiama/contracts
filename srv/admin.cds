using { blackwyse.contracts as my } from '../db/schema';

service AdminService{
    entity Partners as projection on my.Partners;
}
