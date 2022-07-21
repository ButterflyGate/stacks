# Postgres Initialization Directory
- this is for initializing database table.
- be careful of the dependencies of tables. Especially these FOREIGN KEYs.

## Processing Order
- the order of reading files is ascending of file name.
- short description.
    1. first reading file is `00-init.sql`.
    1. next is others which ordered by file name.

## How To Use
1. make new file and write table definitions.
    - write with `IF NOT EXISTS`. because files are read twice `00-init.sql` and itself.
1. add file name into `00-init.sql` with your attention to table dependencies.
    - when table definition has `FOREIGN KEY`s, write new file after the reference table written.

## 00-init.sql
- this file is read at the first at container initialization. because this file name starts `00` and these are read by ascending file name. 
- do not make a file whose name starts faster than `00-init.sql` by ascii.
    - if making it intentionally, it's ok. but it is not recommended.
- you should write `\i` and full path of new file in new line.
    - following other existing lines, use it's path as `/docker-entrypoint-initdb.d/XXXX.sql`.
    - because this directory is mount on `/docker-entrypoint-initdb.d/`.


