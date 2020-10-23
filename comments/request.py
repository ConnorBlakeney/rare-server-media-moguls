import sqlite3
import json
from models import Comment

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
        FROM Comments c
        """)

        comments = []

        dataset = db_cursor.fetchall()

        for row in dataset:
                comment = Comment(row['id'], row['subject'], row['content'], row['post_id'], row['user_id'], row['timestamp'])

                comments.append(comment.__dict__)

    return json.dumps(comments)