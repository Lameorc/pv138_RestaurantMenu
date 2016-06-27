CREATE TABLE menus(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL
);

CREATE TABLE food(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    FOOD_NAME VARCHAR(50) NOT NULL,
    PRICE DECIMAL NOT NULL,
    DESCRIPTION VARCHAR(250),
    FOOD_DATE DATE,
    MENU_ID INT REFERENCES menus(id) ON DELETE CASCADE
);
CREATE  TABLE users (
    username VARCHAR(45) NOT NULL ,
    password VARCHAR(45) NOT NULL ,
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (username));

CREATE TABLE authorities (
    username  varchar(45) REFERENCES users(username) ON DELETE CASCADE ,
    authority varchar(45) NOT NULL,
    PRIMARY KEY (username, authority)
);

CREATE TABLE reservation(
    person VARCHAR(45)  REFERENCES users(username) ON DELETE CASCADE,
    food_id INT REFERENCES food(id)ON DELETE CASCADE,
    PRIMARY KEY (person, food_id)
)
