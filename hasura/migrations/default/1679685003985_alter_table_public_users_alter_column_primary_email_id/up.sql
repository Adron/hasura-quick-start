alter table "public"."users" alter column "primary_email_id" set not null;
alter table "public"."users" add constraint "users_primary_email_id_key" unique ("primary_email_id");
