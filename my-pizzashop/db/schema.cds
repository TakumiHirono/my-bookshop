namespace my.pizzashop;
using { managed } from '@sap/cds/common';

entity Pizzas {
  Key ID : Integer;
  name : String(100);
  price : Integer;
}

entity Orders : managed {
  Key ID : UUID;
  pizza : Association to Pizzas;
  quantity : Integer;
  amount : Integer;
}