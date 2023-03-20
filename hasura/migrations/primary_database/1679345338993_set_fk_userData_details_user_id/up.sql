alter table "userData"."details"
  add constraint "details_user_id_fkey"
  foreign key ("user_id")
  references "userData"."users"
  ("id") on update restrict on delete restrict;
