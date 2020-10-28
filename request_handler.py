import json
import sqlite3
from http.server import BaseHTTPRequestHandler, HTTPServer
from users import get_user_by_email, create_user, get_all_users
from models import User
from categories import create_category, get_all_categories, get_single_category, update_category, delete_category
from comments import get_all_comments, get_single_comment, create_comment, delete_comment, update_comment, get_comment_by_post
from tags import get_all_tags, create_tag, delete_tag, update_tag, get_single_tag
from posts import create_post, get_all_posts, get_single_post
from posts import delete_post, update_post, get_latest_post
from posts import get_posts_by_category_id, get_posts_by_user_id
import json
from post_tags import add_post_tag, get_all_post_tags, get_post_tags_by_post_id, remove_post_tag


class HandleRequests(BaseHTTPRequestHandler):

    def parse_url(self, path):
        path_params = path.split("/")
        resource = path_params[1]

        if "?" in resource:

            param = resource.split("?")[1]
            resource = resource.split("?")[0]
            pair = param.split("=")
            key = pair[0]
            value = pair[1]

            return (resource, key, value)

        else:
            id = None

            try:
                id = int(path_params[2])
            except IndexError:
                pass
            except ValueError:
                pass

            return (resource, id)

    def _set_headers(self, status):
        self.send_response(status)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods','GET, POST, PUT, DELETE')
        self.send_header('Access-Control-Allow-Headers','X-Requested-With, Content-Type')
        self.end_headers()

    def do_GET(self):
        self._set_headers(200)
        response = {}

        parsed = self.parse_url(self.path)

        if len(parsed) == 2:
            (resource, id) = parsed

            if resource == "latest_post":
                response = f"{get_latest_post()}"

            if resource == "posts":
                if id is not None:
                    response = f"{get_single_post(id)}"
                else:
                    response = f"{get_all_posts()}"

            if resource == "post_tags":
                response = get_all_post_tags()

            if resource == "users" and id is None:
                response = get_all_users()

            if resource == "categories":
                if id is not None:
                    response = f"{get_single_category(id)}"
                else:
                    response = f"{get_all_categories()}"

            if resource == "comments":
                if id is not None:
                    response = f"{get_single_comment(id)}"
                else:
                    response = f"{get_all_comments()}"

            if resource == "tags":
                if id is not None:
                    response = f"{get_single_tag(id)}"
                else:
                    response = f"{get_all_tags()}"

        elif len(parsed) == 3:
            (resource, key, value) = parsed

            if key == "email" and resource == "users":
                response = get_user_by_email(value)

            if key == "category_id" and resource == "posts":
                response = get_posts_by_category_id(value)

            if key == "user_id" and resource == "posts":
                response = get_posts_by_user_id(value)

            if key == "post_id" and resource == "post_tags":
                response = get_post_tags_by_post_id(value)

            if key == "post_id" and resource == "comments":
                response = get_comment_by_post(value)

        self.wfile.write(response.encode())

    def do_POST(self):
        self._set_headers(201)
        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)

        post_body = json.loads(post_body)

        (resource, id) = self.parse_url(self.path)

        new_item = None

        if resource == "posts":
            new_item = create_post(post_body)

        if resource == "categories":
            new_item = create_category(post_body)

        if resource == "comments":
            new_item = create_comment(post_body)

        if resource == "tags":
            new_item = create_tag(post_body)

        if resource == "post_tags":
            new_item = add_post_tag(post_body)

        if resource == "register":
            new_item = create_user(post_body)

        self.wfile.write(f"{new_item}".encode())

    def do_DELETE(self):
        self._set_headers(204)

        (resource, id) = self.parse_url(self.path)

        if resource == "comments":
            delete_comment(id)

        if resource == "posts":
            delete_post(id)

        if resource == "tags":
            delete_tag(id)

        if resource == "post_tags":
            remove_post_tag(id)

        if resource == "categories":
            delete_category(id)

        self.wfile.write("".encode())

    def do_PUT(self):
        self._set_headers(204)
        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)
        post_body = json.loads(post_body)

        (resource, id) = self.parse_url(self.path)

        if resource == "comments":
            success = update_comment(id, post_body)

        if resource == "posts":
            success = update_post(id, post_body)

        if resource == "tags":
            success = update_tag(id, post_body)

        if resource == "categories":
            success = update_category(id, post_body)

        if success:
            self._set_headers(204)
        else:
            self._set_headers(404)

        self.wfile.write("".encode())


def main():
    host = ''
    port = 8000
    HTTPServer((host, port), HandleRequests).serve_forever()


if __name__ == "__main__":
    main()