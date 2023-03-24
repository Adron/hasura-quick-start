alter table "public"."users" add constraint "users_primary_email_id_key" unique (primary_email_id);
alter table "public"."users" alter column "primary_email_id" drop not null;
alter table "public"."users" add column "primary_email_id" text;
