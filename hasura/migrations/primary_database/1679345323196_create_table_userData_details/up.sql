CREATE TABLE "userData"."details" ("user_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "details" jsonb NOT NULL, PRIMARY KEY ("user_id") );
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
CREATE TRIGGER "set_userData_details_updated_at"
BEFORE UPDATE ON "userData"."details"
FOR EACH ROW
EXECUTE PROCEDURE "userData"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_userData_details_updated_at" ON "userData"."details"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
