using my.bookshop as my from '../db/schema';

service CatalogService {
  entity Books @readonly as projection on my.Books;
  entity Authors @readonly as projection on my.Authors;
  entity Orders as projection on my.Orders;
}

annotate CatalogService.Orders with @odata.draft.enabled; 