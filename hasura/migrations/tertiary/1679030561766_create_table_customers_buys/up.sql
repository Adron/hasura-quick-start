CREATE TABLE "customers"."buys" ("asset_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "price" money NOT NULL, "bought_date" timestamptz NOT NULL, "customer_id" uuid NOT NULL, PRIMARY KEY ("asset_id","customer_id") );
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
CREATE TRIGGER "set_customers_buys_updated_at"
BEFORE UPDATE ON "customers"."buys"
FOR EACH ROW
EXECUTE PROCEDURE "customers"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_customers_buys_updated_at" ON "customers"."buys" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
