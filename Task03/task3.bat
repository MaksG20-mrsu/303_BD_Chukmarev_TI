@echo off
chcp 65001

sqlite3 movies_rating.db < db_init.sql

echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo < "./script1.sql"

echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo < "./script2.sql"

echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo < "./script3.sql"

echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo < "./script4.sql"