class User():
    def __init__(self, id, first_name, last_name, display_name, password, email):
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.display_name = display_name
        self.password = password
        self.email = email
        self.admin = True
        self.type = "author"

                # "first_name": firstName.current.value,
                # "last_name": lastName.current.value,
                # "displayName": displayName.current.value,
                # "email": email.current.value,
                # "password": password.current.value,
                # "timestamp": Date.now(),
                # "admin": true,
                # "type": "author"