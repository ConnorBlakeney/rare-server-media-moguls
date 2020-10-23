


CREATE TABLE `Users` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `display_name` TEXT NOT NULL,
    `email` TEXT NOT NULL,
    `password` TEXT NOT NULL,
    `admin` boolean
);

CREATE TABLE `Categories` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `category` TEXT NOT NULL
);

CREATE TABLE `Tags` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `tag` TEXT NOT NULL
);


CREATE TABLE `Posts` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`title`  TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`category_id` INTEGER NOT NULL,
	`publication_date` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,
	FOREIGN KEY(`category_id`) REFERENCES `Categories`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `Comments` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `subject`  TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`post_id` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,
    `timestamp` INTEGER NOT NULL,
    FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `PostTags` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`post_id` INTEGER NOT NULL,
	`tag_id` INTEGER NOT NULL,
    FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
	FOREIGN KEY(`tag_id`) REFERENCES `Tags`(`id`)
);