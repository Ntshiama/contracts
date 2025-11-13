using { blackwyse.contracts as my } from '../db/schema';

service AdminService{
    entity Contracts as projection on my.Contracts;
}
