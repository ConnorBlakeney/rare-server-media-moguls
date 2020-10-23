class Comment():
    def __init__(self, unique_id, subject, content, post_id, user_id, timestamp):
        self.id = unique_id
        self.subject = subject
        self.content = content
        self.post_id = post_id
        self.user_id = user_id
        self.user = None
        self.post = None
        self.timestamp = timestamp