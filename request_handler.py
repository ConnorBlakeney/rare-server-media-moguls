from http.server import BaseHTTPRequestHandler, HTTPServer
from users import get_user_by_email, create_user, get_all_users
from models import User
from categories import create_category, get_all_categories
from comments import get_all_comments
import json

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

            return ( resource, key, value )

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
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
        self.send_header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type') 
        self.end_headers()
        
    def do_GET(self):
        self._set_headers(200)
        response = {}

        parsed= self.parse_url(self.path)

        if len(parsed) == 2:
            ( resource, id ) = parsed

            if resource == "users" and id is None:
                response = get_all_users()
            #if elif statements depending on resource if query paramter does not exist goes here
            #if elif statemtents depending on resource if query paramter does not exist goes here
            if resource == "categories":
                response = f"{get_all_categories()}"
            
            if resource == "comments":
                response = f"{get_all_comments()}"


        elif len(parsed) == 3:
            ( resource, key, value ) = parsed

        self.wfile.write(response.encode())

    
    def do_POST(self):
        self._set_headers(201)
        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)

        post_body = json.loads(post_body)

        (resource, id) = self.parse_url(self.path)

        new_item = None

        #if elif statements depending on resource go here
        if resource == "categories":
            new_item = create_category(post_body)

        # if id none
        if resource == "register":
            new_item = create_user(post_body)
        
        self.wfile.write(f"{new_item}".encode())

    def do_DELETE(self):
        self._set_headers(204)

        (resource, id) = self.parse_url(self.path)

        #if elif statements depending on resource go here
        

        
        self.wfile.write("".encode())
        
    def do_PUT(self):
        self._set_headers(204)
        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)
        post_body = json.loads(post_body)

        (resource, id) = self.parse_url(self.path)

        
        #if elif statements depending on resource go here

        

        
        self.wfile.write("".encode())

def main():
    host = ''
    port = 8000
    HTTPServer((host, port), HandleRequests).serve_forever()

if __name__ == "__main__":
    main()