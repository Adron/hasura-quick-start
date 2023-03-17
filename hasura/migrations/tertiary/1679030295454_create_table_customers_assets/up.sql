CREATE TABLE "customers"."assets" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "asset" text NOT NULL, "value" money NOT NULL, "valueAtTime" date NOT NULL, PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_customers_assets_updated_at"
BEFORE UPDATE ON "customers"."assets"
FOR EACH ROW
EXECUTE PROCEDURE "customers"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_customers_assets_updated_at" ON "customers"."assets" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
