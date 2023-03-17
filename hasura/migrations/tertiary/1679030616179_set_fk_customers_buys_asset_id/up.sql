alter table "customers"."buys"
  add constraint "buys_asset_id_fkey"
  foreign key ("asset_id")
  references "customers"."assets"
  ("id") on update restrict on delete restrict;
