CREATE TABLE IF NOT EXISTS attendance (
    'id' INTEGER NOT NULL,
    'person_id' INTEGER NOT NULL,
    'datetime_id' INTEGER NULL,
    'kind' vARCHAR(10) NOT NULL,
    'time' TIME without time zone NOT NULL,
    CONSTRAINT 'pk_attendance'
        PRIMARY KEY 'id',
    CONSTRAINT 'fk_attendance_personid' 
        FOREIGN KEY 'person_id' 
        REFERENCES 'person' ('id')
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT 'fk_attendance_datetime' 
        FOREIGN KEY 'datetime_id' 
        REFERENCES 'datetime' ('id')
        ON DELETE SET NULL
        ON UPDATE SET NULL
);
