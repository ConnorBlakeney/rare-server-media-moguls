
CREATE TABLE `User` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `display_name` TEXT NOT NULL,
    `email` TEXT NOT NULL,
    `password` TEXT NOT NULL,
    `admin` boolean
);

CREATE TABLE `Category` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `category` TEXT NOT NULL
);

CREATE TABLE `Tag` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `tag` TEXT NOT NULL
);

CREATE TABLE `Post` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`title`  TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`category_id` INTEGER NOT NULL,
	`publication_date` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,
	FOREIGN KEY(`category_id`) REFERENCES `Categories`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `Comment` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `subject`  TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`post_id` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,
    `timestamp` INTEGER NOT NULL,
    FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `PostTag` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`post_id` INTEGER NOT NULL,
	`tag_id` INTEGER NOT NULL,
    FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
	FOREIGN KEY(`tag_id`) REFERENCES `Tags`(`id`)
);