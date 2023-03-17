alter table "customers"."buys"
  add constraint "buys_customer_id_fkey"
  foreign key ("customer_id")
  references "customers"."customers"
  ("id") on update restrict on delete restrict;
