from http.server import BaseHTTPRequestHandler, HTTPServer
from categories import create_category, get_all_categories
import json

# Here's a class. It inherits from another class.
class HandleRequests(BaseHTTPRequestHandler):

    def parse_url(self, path):
        path_params = path.split("/")
        resource = path_params[1]

        # Check if there is a query string parameter
        if "?" in resource:
            # GIVEN: /customers?email=jenna@solis.com

            param = resource.split("?")[1]  # email=jenna@solis.com
            resource = resource.split("?")[0]  # 'customers'
            pair = param.split("=")  # [ 'email', 'jenna@solis.com' ]
            key = pair[0]  # 'email'
            value = pair[1]  # 'jenna@solis.com'

            return ( resource, key, value )

        # No query string parameter
        else:
            id = None

            try:
                id = int(path_params[2])
            except IndexError:
                pass  # No route parameter exists: /animals
            except ValueError:
                pass  # Request had trailing slash: /animals/

            return (resource, id)


    # Here's a class function
    def _set_headers(self, status):
        self.send_response(status)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    # Here's a method on the class that overrides the parent's method.
    # It handles any GET request.
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
        self.send_header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type') 
        self.end_headers()
        
    def do_GET(self):
        self._set_headers(200)
        response = {}  # Default response

        # Parse the URL and capture the tuple that is returned
        parsed= self.parse_url(self.path)

        if len(parsed) == 2:
            ( resource, id ) = parsed

            #if elif statemtents depending on resource if query paramter does not exist goes here
            if resource == "categories":
                response = f"{get_all_categories()}"

        # Response from parse_url() is a tuple with 3
        # items in it, which means the request was for
        # `/resource?parameter=value`
        elif len(parsed) == 3:
            ( resource, key, value ) = parsed

            #if elif statement depending on resource if query parameter in url

        self.wfile.write(response.encode())

    
        
    def do_POST(self):
        self._set_headers(201)
        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)

        # Convert JSON string to a Python dictionary
        post_body = json.loads(post_body)

        # Parse the URL
        (resource, id) = self.parse_url(self.path)

        new_item = None

        #if elif statements depending on resource go here
        if resource == "categories":
            new_item = create_category(post_body)

        self.wfile.write(f"{new_item}".encode())

    def do_DELETE(self):
        self._set_headers(204)

        # Parse the URL
        (resource, id) = self.parse_url(self.path)

        #if elif statements depending on resource go here
        

        
        self.wfile.write("".encode())
        
    def do_PUT(self):
        self._set_headers(204)
        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)
        post_body = json.loads(post_body)

        # Parse the URL
        (resource, id) = self.parse_url(self.path)

        
        #if elif statements depending on resource go here

        

        
        self.wfile.write("".encode())
        
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
        self.send_header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type')
        self.end_headers()

# This function is not inside the class. It is the starting
# point of this application.
def main():
    host = ''
    port = 8000
    HTTPServer((host, port), HandleRequests).serve_forever()

#allows us to use debugger
if __name__ == "__main__":
    main()