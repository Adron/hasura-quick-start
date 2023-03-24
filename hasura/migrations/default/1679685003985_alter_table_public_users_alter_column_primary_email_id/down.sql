alter table "public"."users" drop constraint "users_primary_email_id_key";
alter table "public"."users" alter column "primary_email_id" drop not null;
