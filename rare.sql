-- Create Tables

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

-- CREATE
    -- Create Category - id, category
        -- 1
        INSERT INTO `Category`
        VALUES (null, 'Sports')
        -- 2
        INSERT INTO `Category`
        VALUES (null, 'Modern Parent')
        -- 3
        INSERT INTO `Category`
        VALUES (null, "Mac O'Clock")
        -- 4
        INSERT INTO `Category`
        VALUES (null, 'Art')
        -- 5
        INSERT INTO `Category`
        VALUES (null, 'Books')
        -- 6
        INSERT INTO `Category`
        VALUES (null, 'Comics')
        -- 7
        INSERT INTO `Category`
        VALUES (null, 'Fiction')
        -- 8
        INSERT INTO `Category`
        VALUES (null, 'Film')
        -- 9
        INSERT INTO `Category`
        VALUES (null, 'Gaming')
        -- 10
        INSERT INTO `Category`
        VALUES (null, 'Humor')
        -- 11
        INSERT INTO `Category`
        VALUES (null, 'Music')
        -- 12
        INSERT INTO `Category`
        VALUES (null, 'Photography')
        -- 13
        INSERT INTO `Category`
        VALUES (null, 'Podcasts')
        -- 14
        INSERT INTO `Category`
        VALUES (null, 'Poetry')
        -- 15
        INSERT INTO `Category`
        VALUES (null, 'TV')
        -- 16
        INSERT INTO `Category`
        VALUES (null, 'Visual Design')
        -- 17
        INSERT INTO `Category`
        VALUES (null, 'Culture')
        -- 18
        INSERT INTO `Category`
        VALUES (null, 'Food')
        -- 19
        INSERT INTO `Category`
        VALUES (null, 'Language')
        -- 20
        INSERT INTO `Category`
        VALUES (null, 'Makers')
        -- 21
        INSERT INTO `Category`
        VALUES (null, 'Outdoors')
        -- 22
        INSERT INTO `Category`
        VALUES (null, 'Pets')
        -- 23
        INSERT INTO `Category`
        VALUES (null, 'Philosophy')
        -- 24
        INSERT INTO `Category`
        VALUES (null, 'Style')
        -- 25
        INSERT INTO `Category`
        VALUES (null, 'Travel')
        --26
        INSERT INTO `Category`
        VALUES (null, 'True Crime')
        --27
        INSERT INTO `Category`
        VALUES (null, 'Accessibility')
        --28
        INSERT INTO `Category`
        VALUES (null, 'Equality')
        --29
        INSERT INTO `Category`
        VALUES (null, 'Fitness')
        -- 30
        INSERT INTO `Category`
        VALUES (null, 'Design')


    -- Create Comment - id, subject, content, post_id, user_id, timestamp
        -- 1 post 1, user1 Sally, 10/27 9:41pm
        INSERT INTO `Comment`
        VALUES (null, 'Subject Line for My Comment', 'Here I am writing a comment on this post saying all the things I think about it.', 1, 1, 1603766491909);
        -- 2 post 2, user 1 Sally, 10/27 10:27 pm
        INSERT INTO `Comment`
        VALUES (null, 'Another Comment', 'I think my opinion is important, so I am going to share it with you, even though you did not ask for it.', 2, 1, 1603768752294);
        -- 3 post 1, user 2 - Mary, 10/25
        INSERT INTO `Comment`
        VALUES (null, 'OMG', 'This was my fave song in middle school haha', 2, 3, 1602504646000);
        -- 4 post 2, user 3 - Erica, 10/12
        INSERT INTO `Comment`
        VALUES (null, 'I can relate', 'I lose my keys all the time. This made me laugh.', 1, 2, 1603627846000);
        -- 5 post 3, user3-Erica, 10/10
        INSERT INTO `Comment`
        VALUES (null, 'Booooooo', 'Worst. Article. Ever.', 3, 3, 1602331846000);
        -- 6 post 4, user4-Erica, 10/14
        INSERT INTO `Comment`
        VALUES (null, 'Informative', 'I always feel like I learn something by reading your posts. Thanks! ', 4, 4, 1602677446000);
        -- 7 post 3, user4-Monica, 9/25
        INSERT INTO `Comment`
        VALUES (null, 'Wait...', 'Is this an Onion article?', 3, 4, 1601035846000);
        -- 8 post 4 user5-Monica, 9/20
        INSERT INTO `Comment`
        VALUES (null, 'Interesting', 'Look forward to seeing if this is everything they are saying it will be!', 4, 5, 1600603846000);
        -- 9 post 5, user5-Ryan, 9/18
        INSERT INTO `Comment`
        VALUES (null, 'I want to go', 'This sounds so cool! I would love to go someday.', 5, 5, 1603768752294);
        -- 10 post 6, user6-ryan, 9/15
        INSERT INTO `Comment`
        VALUES (null, 'Gotta try that', 'My dog is super hyper - I will have to give this a shot!', 6, 6, 1600171846000);
        -- 11 post 5, user6-ryan, 9/14
        INSERT INTO `Comment`
        VALUES (null, 'Wow', 'That is amazing!', 5, 6, 1600063980000);
        -- 12 post 6, user7-ryan, 9/13
        INSERT INTO `Comment`
        VALUES (null, 'Balogna', 'Psh! I do not buy it for one sec. Let dogs be dogs!', 6, 7, 1599891180000);
        -- 13 post 7, user7-ryan, 9/12
        INSERT INTO `Comment`
        VALUES (null, 'What is the point?', 'I do not understand why you would want boring photographs around, but to each their own.', 7, 7, 1599891180000);
        -- 14 post 8, user8-ryan, 9/11
        INSERT INTO `Comment`
        VALUES (null, 'You were right', 'I did not want to hear that', 8, 8, 1599804780000);
        -- 15 post 7, user8-ryan, 9/10
        INSERT INTO `Comment`
        VALUES (null, 'Inspiring', 'I have never thought of this before! I am inspired to go out and buy my own camera and capture the mundane.', 7, 8, 1599718380000);
        -- 16 post 8, user9-ryan, 9/9
        INSERT INTO `Comment`
        VALUES (null, 'Great Point', 'Sometimes it is the stuff we do not want to hear that we need to hear the most.', 8, 9, 1599631980000);
        -- 17 post 9, user9-ryan, 9/8
        INSERT INTO `Comment`
        VALUES (null, 'Come to my house', 'You are welcome to come "learn" at my house any time!', 9, 9, 1599545580000);
        -- 18 post 10, user10-ryan, 9/7
        INSERT INTO `Comment`
        VALUES (null, 'Yummm', 'Looks delicious', 10, 10, 1599459180000);
        -- 19 post 9, user10-ryan, 9/6
        INSERT INTO `Comment`
        VALUES (null, 'Tidy minds', 'As someone with a very scattered mind, this sounds perfect. Will totally give it a shot next time I am cleaning house.', 9, 10, 1599372780000);
        -- 20 post 10, user2-ryan, 9/5
        INSERT INTO `Comment`
        VALUES (null, 'Vegetarian Pot Pie', 'I made this for myself and my roommate last night, and we both confirm it is AMAZING!', 10, 2, 1599286380000);

    -- Create Post - id, title, content, category_id, publication_date, user_id
        -- 1 cat1 - sports, 10/26 , user1 -sally,
        INSERT INTO `Post`
        VALUES (null, "How To Lose your Keys In Ten Seconds", "BLAH BLAH BLAH BLAH BLAH BLAH BLAH.", 2, 1603742309533, 1);
        -- 2 cat1 - sports, 10/27, user1 sally
        INSERT INTO `Post`
        VALUES (null, "The Story Of A Girl", "Blah blah", 1, 1603766491909, 1);
        -- 3  cat3 - sports, 9/16 , user2 -mary
        INSERT INTO `Post`
        VALUES (null, "Why Don't I Like My Son?", "Okay, so already I’m aware of how terrible the title sounds.. but I’ve got to be honest, I need to say this shit out loud. I don't know why I don't like him; he's not a bad kid, he's actually a terrific kid, he's smart, well-spoken, kind, rarely misbehaves.. sure he acts up sometimes, but that’s natural for a child his age, I hold no resentment to him in that regard. So it’s not like I don't like him because of his behavior or anything like that.", 2, 1600258246000, 2);
        -- 4 cat3- mac oclock 8/21 user 9 - theo
        INSERT INTO `Post`
        VALUES (null, 'The Future of the Mac', 'Apple Silicon is the name Apple will be using for their custom made ARM-based chips that will be transitioning over to the next two years.
        At WWDC Apple revealed a Mac mini as the first such Mac to have an Apple Silicon chip inside, and this was an Apple A12Z, the same chip as inside the iPad Pro 2020 — but this Mac mini is only for developers.', 3, 1598011846000, 9);
        -- 5 cat4 art 8/23 user5 bill
        INSERT INTO `Post`
        VALUES (null, 'At Dynamicland, The Building Is The Computer', 'Walking into Dynamicland, a computational research lab and communal computer in Oakland, the first thing I notice is the array of projects spread out across several work tables and the kitchen countertop.', 4, 1598184646000, 5);
        -- 6 cat22 pets 8/25
        INSERT INTO `Post`
        VALUES (null, 'Teaching My Dog To Meditate', 'There is a command in dog training called “Leave it.” It simply means, let go of whatever you’re focused on. Just let it go. In your mind, change the subject. The simplest application of “leave it” is when your dog is about to eat something you don’t want them to eat.', 22, 1598357446000, 4);
        -- 7 cat 12 photography 8/27
        INSERT INTO `Post`
        VALUES (null, 'Mundane Photography', 'I want to talk about a practice of seeing called mundane photography. Mundane photography is meditative work with a camera.
        There are billions of cameras on the planet. Having a camera is no longer a luxury for most people. True luxury is the ability to see.
        Have you ever noticed how expensive things — a sumptuous hand-knotted Persian rug, a velvet Jacquard haute couture opera coat — don’t seem to be all that different from inexpensive things?', 12, 1598530246000, 10);
        --  8 cat23 philosophy 8/30 user4 monica
        INSERT INTO `Post`
        VALUES (null, 'The Productivity Tip No One Wants to Hear', '“I get to the library and all set-up by around 5:30AM. I spend a few minutes in prayer and meditation, followed by a 5–10 minute session in my journal. The purpose of this journal session is get clarity and focus for my day.” — productivity guru Benjamin P. Hardy', 23, 1598789446000, 10);
        -- 9 cat23 philosophy 9/1 user10 hil
        INSERT INTO `Post`
        VALUES (null, 'What we can learn from tidying', 'It was late in the evening and my partner and I were sitting alone on the bare floor of our living room. We had just wrapped up a week of tidying our two-bedroom apartment, and we felt disoriented and exhausted.', 23, 1598789446000, 10);
        -- 10 cat18 food 9/2 user8 mark
        INSERT INTO `Post`
        VALUES (null, 'What to Cook This Week', 'For those times you find yourself saying, “Shoot! What’s for dinner?” — we’re here to help. For our third installment of what to eat this week, we’ve got a trio with the potential for bold flavor — with two fast dishes and one that requires more commitment, largely unattended.', 18, 1598789446000, 8);

    -- Create PostTag - id, post_id, tag_id
            -- 1
            INSERT INTO `PostTag`
            VALUES (null, 1, 1);
            -- 2
            INSERT INTO `PostTag`
            VALUES (null, 1, 2);
            -- 3
            INSERT INTO `PostTag`
            VALUES (null, 1, 20);
            --4
            INSERT INTO `PostTag`
            VALUES (null, 1, 21);
            --5
            INSERT INTO `PostTag`
            VALUES (null, 1, 22);
            --6
            INSERT INTO `PostTag`
            VALUES (null, 2, 23);
            --7
            INSERT INTO `PostTag`
            VALUES (null, 2, 24);
            --8
            INSERT INTO `PostTag`
            VALUES (null, 2, 25);
            --9
            INSERT INTO `PostTag`
            VALUES (null, 3, 26);
            --10
            INSERT INTO `PostTag`
            VALUES (null, 3, 27);
            --11
            INSERT INTO `PostTag`
            VALUES (null, 3, 28);
            --12
            INSERT INTO `PostTag`
            VALUES (null, 4, 29);
            --13
            INSERT INTO `PostTag`
            VALUES (null, 4, 30);
            --14
            INSERT INTO `PostTag`
            VALUES (null, 4, 31);
            --15
            INSERT INTO `PostTag`
            VALUES (null, 5, 32);
            --17
            INSERT INTO `PostTag`
            VALUES (null, 5, 33);
            --18
            INSERT INTO `PostTag`
            VALUES (null, 5, 34);
            --19
            INSERT INTO `PostTag`
            VALUES (null, 6, 35);
            --20
            INSERT INTO `PostTag`
            VALUES (null, 6, 36);
            --21
            INSERT INTO `PostTag`
            VALUES (null, 6, 37);
            --22
            INSERT INTO `PostTag`
            VALUES (null, 7, 38);
            --23
            INSERT INTO `PostTag`
            VALUES (null, 7, 39);
            --24
            INSERT INTO `PostTag`
            VALUES (null, 7, 40);
            --25
            INSERT INTO `PostTag`
            VALUES (null, 8, 41);
            --26
            INSERT INTO `PostTag`
            VALUES (null, 8, 42);
            --27
            INSERT INTO `PostTag`
            VALUES (null, 8, 43);
            --28
            INSERT INTO `PostTag`
            VALUES (null, 9, 44);
            --29
            INSERT INTO `PostTag`
            VALUES (null, 9, 45);
            --30
            INSERT INTO `PostTag`
            VALUES (null, 9, 46);
            --31
            INSERT INTO `PostTag`
            VALUES (null, 10, 47);
            --32
            INSERT INTO `PostTag`
            VALUES (null, 10, 48);
            --33
            INSERT INTO `PostTag`
            VALUES (null, 10, 49);

    -- Create Tag - id, tag
        -- 1
        INSERT INTO `Tag`
        VALUES (null, 'titansfan')
        -- 2
        INSERT INTO `Tag`
        VALUES (null, 'ilovemydog')
        -- 3
        INSERT INTO `Tag`
        VALUES (null, 'sundayfunday')
        -- 4
        INSERT INTO `Tag`
        VALUES (null, 'livelaughlove')
        -- 5
        INSERT INTO `Tag`
        VALUES (null, 'workflow')
        -- 6
        INSERT INTO `Tag`
        VALUES (null, 'nashville')
        -- 7
        INSERT INTO `Tag`
        VALUES (null, 'data')
        -- 8
        INSERT INTO `Tag`
        VALUES (null, 'makeup')
        -- 9
        INSERT INTO `Tag`
        VALUES (null, 'sports')
        -- 10
        INSERT INTO `Tag`
        VALUES (null, 'dogs')
        -- 11
        INSERT INTO `Tag`
        VALUES (null, 'lazy')
        -- 12
        INSERT INTO `Tag`
        VALUES (null, 'life')
        -- 13
        INSERT INTO `Tag`
        VALUES (null, 'work')
        -- 14
        INSERT INTO `Tag`
        VALUES (null, 'city')
        -- 15
        INSERT INTO `Tag`
        VALUES (null, 'health')
        -- 16
        INSERT INTO `Tag`
        VALUES (null, 'foodie')
        -- 17
        INSERT INTO `Tag`
        VALUES (null, 'Food')
        -- 18
        INSERT INTO `Tag`
        VALUES (null, 'serversideforlife')
        -- 19
        INSERT INTO `Tag`
        VALUES (null, 'brunch')
        -- 20
        INSERT INTO `Tag`
        VALUES (null, 'cleanhouse')
        -- 21
        INSERT INTO `Tag`
        VALUES (null, 'forgetful')
        -- 21
        INSERT INTO `Tag`
        VALUES (null, 'fun')
        -- 22
        INSERT INTO `Tag`
        VALUES (null, 'lighthearted')
        -- 23
        INSERT INTO `Tag`
        VALUES (null, 'lyrics')
        -- 24
        INSERT INTO `Tag`
        VALUES (null, 'moody')
        -- 25
        INSERT INTO `Tag`
        VALUES (null, 'throwback')
        -- 26
        INSERT INTO `Tag`
        VALUES (null, 'family')
        -- 27
        INSERT INTO `Tag`
        VALUES (null, 'raisingchildren')
        -- 28
        INSERT INTO `Tag`
        VALUES (null, 'parenting')
        -- 29
        INSERT INTO `Tag`
        VALUES (null, 'technews')
        -- 30
        INSERT INTO `Tag`
        VALUES (null, 'mac')
        -- 31
        INSERT INTO `Tag`
        VALUES (null, 'apple')
        -- 32
        INSERT INTO `Tag`
        VALUES (null, 'dynamicland')
        -- 33
        INSERT INTO `Tag`
        VALUES (null, 'projects')
        -- 34
        INSERT INTO `Tag`
        VALUES (null, 'workspace')
        -- 35
        INSERT INTO `Tag`
        VALUES (null, 'dogtraining')
        -- 36
        INSERT INTO `Tag`
        VALUES (null, 'meditation')
        -- 37
        INSERT INTO `Tag`
        VALUES (null, 'downwarddog')
        -- 38
        INSERT INTO `Tag`
        VALUES (null, 'mundane')
        -- 39
        INSERT INTO `Tag`
        VALUES (null, 'everyday')
        -- 40
        INSERT INTO `Tag`
        VALUES (null, 'photography')
        -- 41
        INSERT INTO `Tag`
        VALUES (null, 'productivity')
        -- 42
        INSERT INTO `Tag`
        VALUES (null, 'tips')
        -- 43
        INSERT INTO `Tag`
        VALUES (null, 'hardtoswallowpills')
        -- 44
        INSERT INTO `Tag`
        VALUES (null, 'tidy')
        -- 45
        INSERT INTO `Tag`
        VALUES (null, 'selfreflection')
        -- 46
        INSERT INTO `Tag`
        VALUES (null, 'mindulness')
        -- 47
        INSERT INTO `Tag`
        VALUES (null, 'cooking')
        -- 48
        INSERT INTO `Tag`
        VALUES (null, 'recipes')
        -- 49
        INSERT INTO `Tag`
        VALUES (null, 'mealprep')

    --  Create User - id, first_name, last_name, display_name, email, password, admin
        -- 1
        INSERT INTO `User`
        VALUES (null, 'Sally', 'Richards', 'sallyrich', 'sally@rich.com', "password", True)
        -- 2
        INSERT INTO `User`
        VALUES (null, 'Mary', 'Mogul', 'marymogul', 'mary@mogul.com', "password", True)
        -- 3
        INSERT INTO `User`
        VALUES (null, 'Erica', 'Nobels', 'taternoodles', 'tater@noodles.com', "pw", True)
        -- 4
        INSERT INTO `User`
        VALUES (null, 'Monica', 'Kay', 'heymonicakay', 'mon@kay.com', "monspw", True)
        -- 5
        INSERT INTO `User`
        VALUES (null, 'Bill', 'Hillsman', 'billhillsman', 'bill@hills.com', "billspw", True)
        -- 6
        INSERT INTO `User`
        VALUES (null, 'Ryan', 'Citrino', 'ryguy', 'ry@cit.com', "ryanspw", True)
        -- 7
        INSERT INTO `User`
        VALUES (null, 'Scott', 'Field', 'mrfield', 'scotty@knows.com', "scottspw", True)
        -- 8
        INSERT INTO `User`
        VALUES (null, 'Mark', 'Neyland', 'markymark', 'mark@ney.com', "markspw", True)
        -- 9
        INSERT INTO `User`
        VALUES (null, 'Theo', 'Daly', 'theocanread', 'theo@ishere.com', "theospw", True)
        -- 10
        INSERT INTO `User`
        VALUES (null, 'Hilary', 'Swaim', 'toottoot', 'hil@swaim.com', "hilspw", True)

-- READ

    -- Select ALL from...
        SELECT * FROM `Category`
        SELECT * FROM `Comment`
        SELECT * FROM `Post`
        SELECT * FROM `PostTag`
        SELECT * FROM `Tag`
        SELECT * FROM `User`

    -- Select SPECIFIC
        -- Single Category BY category_id
        SELECT
            c.id,
            c.category
        FROM `Category` c
        WHERE c.id = ?

        -- Single Comment BY comment_id
        SELECT
            c.id,
            c.subject,
            c.content,
            c.post_id,
            c.user_id,
            c.timestamp
        FROM `Comment` c
        WHERE c.id = ?

        -- COMMENTS BY user_id
        SELECT
            c.id,
            c.subject,
            c.content,
            c.post_id,
            c.user_id,
            c.timestamp,
            u.display_name
        FROM `Comment` c
        JOIN `User` u ON u.id = c.user_id
        WHERE c.user_id = ?

        -- COMMENTS BY post_id
        SELECT
            c.id,
            c.subject,
            c.content,
            c.post_id,
            c.user_id,
            c.timestamp,
            p.title
        FROM `Comment` c
        JOIN `Post` p ON c.post_id = p.id
        WHERE c.post_id = ?

        --Single Post BY post_id
        SELECT
            p.id,
            p.title,
            p.content,
            p.category_id,
            p.publication_date,
            p.user_id,
            u.display_name username,
            c.category category
        FROM `Post` p
        JOIN `User` u ON u.id = p.user_id
        JOIN `Category` c ON c.id = p.category_id
        WHERE p.id = 1;

        --POSTS BY category_id
        SELECT
            p.id,
            p.title,
            p.content,
            p.category_id,
            p.publication_date,
            p.user_id,
            u.display_name username,
            c.category category
        FROM `Post` p
        JOIN `User` u ON u.id = p.user_id
        JOIN `Category` c ON c.id = p.category_id
        WHERE p.category_id = 1;

        --POSTS BY user_id
        SELECT
            p.id,
            p.title,
            p.content,
            p.category_id,
            p.publication_date,
            p.user_id,
            u.display_name username,
            c.category category
        FROM `Post` p
        JOIN `User` u ON u.id = p.user_id
        JOIN `Category` c ON c.id = p.category_id
        WHERE p.user_id = 1;

        -- PostTags BY post_id
        SELECT
            pt.id,
            pt.post_id,
            pt.tag_id,
            p.title,
            t.tag
        FROM `PostTag` pt
        JOIN `Tag` t ON t.id = pt.tag_id
        JOIN `Post` p ON p.id = pt.post_id
        WHERE pt.post_id = 1;

        -- PostTags BY tag_id
        SELECT
            pt.id,
            pt.post_id,
            pt.tag_id,
            p.title,
            t.tag
        FROM `PostTag` pt
        JOIN `Tag` t ON t.id = pt.tag_id
        JOIN `Post` p ON p.id = pt.post_id
        WHERE pt.tag_id = 4;

-- UPDATE
UPDATE `Post`
SET
    title = "The Story Of A Girl",
    content = "This is the story of a girl who cried a river and drowned the whole world. Although she looks so sad in photographs, I absolutely love her when she smiles.",
    category_id = 1,
    publication_date = 1603766491909,
    user_id = 1
WHERE id = ?

UPDATE `User`
SET
    first_name = 'Hilary',
    last_name = "Swaim",
    display_name = 'toottoot',
    email = 'hey@hil.com',
    password = 'hils',
    admin = True
WHERE id = 10

-- DELETE

DELETE FROM `User`
    WHERE id = 11
