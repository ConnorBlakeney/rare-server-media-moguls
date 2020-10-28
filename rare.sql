SELECT
    p.id,
    p.title,
    p.content,
    p.category_id,
    p.publication_date,
    p.user_id,
    u.display_name,
    c.category
FROM `Post` p
JOIN `User` u ON u.id = p.user_id
JOIN `Category` c ON c.id = p.category_id
WHERE p.user_id = 1;


SELECT
    p.id,
    p.title,
    p.content,
    p.category_id,
    p.publication_date,
    p.user_id,
    u.display_name,
    c.category
FROM `Post` p
JOIN `User` u ON u.id = p.user_id
JOIN `Category` c ON c.id = p.category_id
WHERE p.user_id = ?
ORDER BY p.publication_date DESC