import sqlite3
import json
from models import User

def get_all_users():
    # Open a connection to the database
    with sqlite3.connect("./rare.db") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            u.id,
            u.first_name,
            u.last_name,
            u.display_name,
            u.email,
            u.password,
            u.admin
        FROM User u
        """)

        # Initialize an empty list to hold all animal representations
        users = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        for row in dataset:

            user = User(row['id'], row['first_name'], row['last_name'], row['display_name'],
                    row['email'], row['password'], row['admin'])

            users.append(user.__dict__)

    return json.dumps(users)

def get_user_by_email(email):

    with sqlite3.connect("rare.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        select
            u.id,
            u.first_name,
            u.last_name,
            u.display_name,
            u.email,
            u.password,
            u.admin
        from User u
        WHERE u.email = ?
        """, ( email, ))

        data = db_cursor.fetchone()

        if data is not None:

            user = User(data['id'], data['first_name'], data['last_name'], data['display_name'],
                    data['email'], data['password'], data['admin'])

                    # Return the JSON serialized user object
            return json.dumps(user.__dict__)

        else:
            user = User(0, '', '', '', '', '', '')
            return json.dumps(user.__dict__)


def create_user(new_user):
    with sqlite3.connect("rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO User
            ( first_name, last_name, display_name, email, password, admin )
        VALUES
            ( ?, ?, ?, ?, ?, ?);
        """, (new_user['first_name'], new_user['last_name'], new_user['display_name'],
              new_user['email'], new_user['password'],
              new_user['admin'] ))

        id = db_cursor.lastrowid

        new_user['id'] = id


    return json.dumps(new_user)