CREATE TABLE IF NOT EXISTS 'datetime' (
    'id' INTEGER NOT NULL,
    'year' INTEGER NOT NULL,
    'month' INTEGER NOT NULL,
    'day' INTEGER NOT NULL,
    'hour' INTEGER NOT NULL,
    'minuite' INTEGER NOT NULL,
    'second' INTEGER default 0 NOT NULL,
    CONSTRAINT 'pk_datetime'
        PRIMARY KEY 'id',
    CONSTRAINT 'c_year'
        CHECK ( 2000 < 'year' ),
    CONSTRAINT 'c_month'
        CHECK ( 1 <= 'month' AND 'month' <= 12 ),
    CONSTRAINT 'c_day'
        CHECK (
            ( 1 <= 'day' AND 'day' <= 31 )
            AND (
                ( 'month' = 1  ) OR
                ( 'month' = 3  ) OR
                ( 'month' = 5  ) OR
                ( 'month' = 7  ) OR
                ( 'month' = 8  ) OR
                ( 'month' = 10 ) OR
                ( 'month' = 12 ) OR
                ( 'month' = 2  AND 'day' <= 28 ) OR
                ( 'month' = 4  AND 'day' <= 30 ) OR
                ( 'month' = 6  AND 'day' <= 30 ) OR
                ( 'month' = 9  AND 'day' <= 30 ) OR
                ( 'month' = 11 AND 'day' <= 30 ) OR
                (
                    ( 'year' % 400 = 0 AND 'month' = 2  AND 'day' <= 29 ) OR
                    ( 'year' % 100 != 0 AND 'year' % 4 = 0 AND 'month' = 2  AND 'day' <= 29 )
                )
            )     
        ),
    CONSTRAINT 'c_hour'
        CHECK ( 0 <= 'hour' AND 'hour' < 24 ),
    CONSTRAINT 'c_minute'
        CHECK ( 0 <= 'minute' AND 'minute' < 60 ),
    CONSTRAINT 'c_second'
        CHECK (
            (0 <= 'second' AND 'second' <= 59 )
            OR (
                ( 'hour' = 8 OR 'hour' = 23 ) AND
                'minute' = 59 AND
                'second' = 60
            )
        ),
);
