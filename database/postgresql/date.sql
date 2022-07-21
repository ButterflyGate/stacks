CREATE TABLE IF NOT EXISTS "datetime" (
    "id" INTEGER NOT NULL,
    "year" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "day" INTEGER NOT NULL,
    "hour" INTEGER NOT NULL,
    "minute" INTEGER NOT NULL,
    "second" INTEGER default 0 NOT NULL,
    CONSTRAINT "pk_datetime"
        PRIMARY KEY ("id"),
    CONSTRAINT "c_year"
        CHECK ( 2000 < "year" ),
    CONSTRAINT "c_month"
        CHECK ( 1 <= "datetime"."month" AND "datetime"."month" <= 12 ),
    CONSTRAINT "c_day"
        CHECK (
            ( 1 <= "day" AND "day" <= 31 )
            AND (
                ( "datetime"."month" = 1  ) OR
                ( "datetime"."month" = 3  ) OR
                ( "datetime"."month" = 5  ) OR
                ( "datetime"."month" = 7  ) OR
                ( "datetime"."month" = 8  ) OR
                ( "datetime"."month" = 10 ) OR
                ( "datetime"."month" = 12 ) OR
                ( "datetime"."month" = 2  AND "datetime"."day" <= 28 ) OR
                ( "datetime"."month" = 4  AND "datetime"."day" <= 30 ) OR
                ( "datetime"."month" = 6  AND "datetime"."day" <= 30 ) OR
                ( "datetime"."month" = 9  AND "datetime"."day" <= 30 ) OR
                ( "datetime"."month" = 11 AND "datetime"."day" <= 30 ) OR
                (
                    ( "datetime"."year" % 400 = 0 AND "datetime"."month" = 2  AND "datetime"."day" <= 29 ) OR
                    ( "datetime"."year" % 100 != 0 AND "datetime"."year" % 4 = 0 AND "datetime"."month" = 2  AND "datetime"."day" <= 29 )
                )
            )     
        ),
    CONSTRAINT "c_hour"
        CHECK ( 0 <= "datetime"."hour" AND "datetime"."hour" < 24 ),
    CONSTRAINT "c_minute"
        CHECK ( 0 <= "datetime"."minute" AND "datetime"."minute" < 60 ),
    CONSTRAINT "c_second"
        CHECK (
            (0 <= "datetime"."second" AND "datetime"."second" <= 59 )
            OR (
                ( "datetime"."hour" = 8 OR "datetime"."hour" = 23 ) AND
                "datetime"."minute" = 59 AND
                "datetime"."second" = 60
            )
        )
);
