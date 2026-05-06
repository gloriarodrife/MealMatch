CREATE DATABASE IF NOT EXISTS mealmatch_db;
USE mealmatch_db;

-- 1. Users Table
CREATE TABLE users
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30)  NOT NULL UNIQUE,
    email    VARCHAR(60)  NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio      VARCHAR(255) DEFAULT ''
);

-- 2. Recipes Table
CREATE TABLE recipes
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(100) NOT NULL,
    prep_time  VARCHAR(50),
    difficulty VARCHAR(20),
    category   VARCHAR(50),
    image_path VARCHAR(255)
);

-- 3. Ingredients Table (1:N)
CREATE TABLE ingredients
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    name      VARCHAR(255) NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE
);

-- 4. Steps Table (1:N)
CREATE TABLE steps
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id   INT,
    step_order  INT  NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE
);

-- 5. Dietary Tags Table (1:N)
CREATE TABLE dietary_tags
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    tag_name  VARCHAR(50) NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE
);

-- 6. User Favorites Table (N:M)
CREATE TABLE user_favorites
(
    user_id   INT,
    recipe_id INT,
    PRIMARY KEY (user_id, recipe_id),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE
);