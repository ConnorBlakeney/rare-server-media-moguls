SELECT
    c.id,
    c.subject,
    c.content,
    c.post_id,
    c.user_id,
    c.timestamp,
    p.title,
    u.display_name
FROM `Comment` c
JOIN `Post` p ON c.post_id = p.id
JOIN `User` u ON c.user_id = u.id
WHERE c.post_id = 2