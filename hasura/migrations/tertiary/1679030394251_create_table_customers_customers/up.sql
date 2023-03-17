CREATE TABLE "customers"."customers" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "user_id" uuid NOT NULL, PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "customers"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_customers_customers_updated_at"
BEFORE UPDATE ON "customers"."customers"
FOR EACH ROW
EXECUTE PROCEDURE "customers"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_customers_customers_updated_at" ON "customers"."customers" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
