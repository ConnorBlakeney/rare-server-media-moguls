import sqlite3
import json
from models import Comment
from models import User
from models import Post

def get_all_comments():
    with sqlite3.connect("./rare.db") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            c.id,
            c.subject,
            c.content,
            c.post_id,
            c.user_id,
            c.timestamp
        FROM Comment c
        """)

        comments = []

        dataset = db_cursor.fetchall()

        for row in dataset:
                comment = Comment(row['id'], row['subject'], row['content'], row['post_id'], row['user_id'], row['timestamp'])

                comments.append(comment.__dict__)

    return json.dumps(comments)

def get_single_comment(id):
    with sqlite3.connect("./rare.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            c.id,
            c.subject,
            c.content,
            c.post_id,
            c.user_id,
            c.timestamp,
            u.display_name
        FROM Comment c
        JOIN User u ON u.id = c.user_id
        WHERE c.id = ?
        """, ( id, ))

        data = db_cursor.fetchone()

        comment = Comment(data['id'], data['subject'], data['content'], data['post_id'],
                        data['user_id'], data['timestamp'],
                        )

        user = User("", "", "", data['display_name'], "", "", "")
        comment.user = user.__dict__

        return json.dumps(comment.__dict__)

def create_comment(new_comment):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Comment
            ( subject, content, post_id, user_id, timestamp)
        VALUES
            ( ?, ?, ?, ?, ?);
        """, (new_comment['subject'], new_comment['content'],
              new_comment['post_id'], new_comment['user_id'],
              new_comment['timestamp'] ))

        id = db_cursor.lastrowid

        new_comment['id'] = id

    return json.dumps(new_comment)

def delete_comment(id):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM Comment
        WHERE id = ?
        """, (id, ))

def update_comment(id, new_comment):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        UPDATE Comment
            SET
                subject = ?,
                content = ?,
                post_id = ?,
                user_id = ?,
                timestamp = ?
        WHERE id = ?
        """, (new_comment['subject'], new_comment['content'],
              new_comment['post_id'], new_comment['user_id'],
              new_comment['timestamp'], id, ))

        rows_affected = db_cursor.rowcount

    if rows_affected == 0:
        return False
    else:
        return True

def get_comment_by_post(post_id):
    with sqlite3.connect("./rare.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        select
            c.id,
            c.subject,
            c.content,
            c.post_id,
            c.user_id,
            c.timestamp,
            u.display_name
        FROM Comment c
        JOIN User u ON u.id = c.user_id
        WHERE c.post_id = ?
        """, ( post_id, ))

        comments = []

        data = db_cursor.fetchall()

        for row in data:
                comment = Comment(row['id'], row['subject'], row['content'], row['post_id'],
                                    row['user_id'], row['timestamp'])
                
                user = User("", "", "", row['display_name'], "", "", "")

                comment.user = user.__dict__

                comments.append(comment.__dict__)

        return json.dumps(comments)