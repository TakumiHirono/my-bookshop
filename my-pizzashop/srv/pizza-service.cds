using my.pizzashop as my from '../db/schema';

service PizzashopService {
  entity Pizzas @readonly as projection on my.Pizzas;
  entity Orders as projection on my.Orders;
}