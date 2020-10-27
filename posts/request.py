import sqlite3
import json
from models import Post, User

def create_post(new_post):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Post
            ( title, content, category_id, publication_date, user_id )
        VALUES
            ( ?, ?, ?, ?, ?);
        """, (new_post['title'], new_post['content'],
              new_post['category_id'], new_post['publication_date'],
              new_post['user_id'], ))

        id = db_cursor.lastrowid

        new_post['id'] = id


    return json.dumps(new_post)

def get_all_posts():
    with sqlite3.connect("./rare.db") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            p.id,
            p.title,
            p.content,
            p.category_id,
            p.publication_date,
            p.user_id
        FROM post p
        """)

        posts = []

        dataset = db_cursor.fetchall()

        for row in dataset:

            post = Post(row['id'], row['title'], row['content'],
                            row['category_id'], row['publication_date'],
                            row['user_id'])

            posts.append(post.__dict__)

    return json.dumps(posts)

def get_single_post(id):
    with sqlite3.connect("./rare.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            p.id,
            p.title,
            p.content,
            p.category_id,
            p.publication_date,
            p.user_id,
            u.display_name
        FROM post p
        JOIN user u ON u.id = p.user_id
        WHERE p.id = ?
        """, ( id, ))

        data = db_cursor.fetchone()

        post = Post(data['id'], data['title'], data['content'], data['category_id'],
                        data['publication_date'], data['user_id'])
        
        user = User("","","", data['display_name'], "" ,"","")
        post.user = user.__dict__


        return json.dumps(post.__dict__)

def get_latest_post():
    with sqlite3.connect("./rare.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            p.id,
            p.title,
            p.content,
            p.category_id,
            p.publication_date,
            p.user_id,
            u.display_name
        FROM post p
        JOIN user u ON u.id = p.user_id
        ORDER BY p.id DESC
        LIMIT 1
        """)

        data = db_cursor.fetchone()

        post = Post(data['id'], data['title'], data['content'], data['category_id'],
                        data['publication_date'], data['user_id'])
        
        user = User("","","", data['display_name'], "" ,"","")
        post.user = user.__dict__


        return json.dumps(post.__dict__)

    
def delete_post(id):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM post
        WHERE id = ?
        """, (id, ))

def update_post(id, new_post):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        UPDATE Post
            SET
                title = ?,
                content = ?,
                category_id = ?,
                publication_date = ?,
                user_id = ?
        WHERE id = ?
        """, (new_post['title'], new_post['content'],
              new_post['category_id'], new_post['publication_date'], new_post['user_id'], id, ))

        
        rows_affected = db_cursor.rowcount

    if rows_affected == 0:
        # Forces 404 response by main module
        return False
    else:
        # Forces 204 response by main module
        return True