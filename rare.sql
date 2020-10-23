CREATE TABLE `User` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `display_name` TEXT NOT NULL,
    `email` TEXT NOT NULL,
    `password` TEXT NOT NULL,
    `admin` BOOLEAN NOT NULL
);

INSERT INTO `User` VALUES (null, "Madi", "Peper", "MP", "test@test.com", "test", true);

DROP TABLE `User`;

SELECT * FROM `User`;