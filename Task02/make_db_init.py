script_dir = './db_init.sql'

SQL_SCRIPT = """
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;

CREATE TABLE movies(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    year INTEGER,
    genres TEXT
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT,
    gender TEXT NOT NULL,
    register_date TEXT NOT NULL,
    occupation TEXT
);

CREATE TABLE ratings(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    timestamp INTEGER NOT NULL,
    FOREIGN KEY (user_id)  REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE tags(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    tag TEXT NOT NULL,
    timestamp INTEGER NOT NULL,
    FOREIGN KEY (user_id)  REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

"""

def sql_escape_quotes(a):
    return a.replace('\'', '\'\'')

def sql_string(a):
    return f'`{sql_escape_quotes(a)}`'

def insert_users(sql_script, users_file):
    sql_script.write('INSERT INTO `users` VALUES\n')

    with open(users_file, 'r') as f:
        current_line = f.readline()

        while current_line:
            line = current_line.strip()
            (id, name, email, gender, register_date, occupation) = line.split('|')
            sql_script.write(f'\t ({id}, {sql_string(name)}, {sql_string(email)}, {sql_string(gender)}, {sql_string(register_date)}, {sql_string(occupation)})')

            next_line = f.readline()

            if next_line:
                sql_script.write(',\n')
            else:
                sql_script.write(';\n')
            
            current_line = next_line

def main():
    with open(script_dir, 'w') as f:
        f.write(SQL_SCRIPT)

        insert_users(f, './users.txt')

if __name__ == '__main__':
    main()