CREATE TABLE "userData"."users" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "name" text NOT NULL, "details" jsonb, PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "userData"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_userData_users_updated_at"
BEFORE UPDATE ON "userData"."users"
FOR EACH ROW
EXECUTE PROCEDURE "userData"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_userData_users_updated_at" ON "userData"."users"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
