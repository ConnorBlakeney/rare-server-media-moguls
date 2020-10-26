import sqlite3
import json
from models import Tag

def get_all_tags():
    with sqlite3.connect("./rare.db") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            t.id,
            t.tag
        FROM tag t
        """)

        tags = []

        dataset = db_cursor.fetchall()

        for row in dataset:
                tag = Tag(row['id'], row['tag'])

                tags.append(tag.__dict__)

    return json.dumps(tags)

def create_tag(new_tag):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Tag
            ( tag )
        VALUES
            ( ? );
        """, (new_tag['tag'],))

        id = db_cursor.lastrowid

        new_tag['id'] = id

    return json.dumps(new_tag)

def delete_tag(id):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM tag
        WHERE id = ?
        """, (id, ))

def update_tag(id, new_tag):
    with sqlite3.connect("./rare.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        UPDATE Tag
            SET
                tag = ?
        WHERE id = ?
        """, (new_tag['tag'], id, ))

        rows_affected = db_cursor.rowcount

    if rows_affected == 0:
        return False
    else:
        return True