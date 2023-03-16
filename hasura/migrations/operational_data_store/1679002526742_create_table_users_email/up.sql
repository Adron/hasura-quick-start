CREATE TABLE "users"."email" ("user_id" uuid NOT NULL, "email" text NOT NULL, PRIMARY KEY ("email") , FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON UPDATE restrict ON DELETE restrict);
