CREATE DATABASE IF NOT EXISTS movie_database;

USE movie_database;


-- 用户 user
-- 主键user_id关联firstcomment, attitude, followcomment的外键

CREATE TABLE IF NOT EXISTS user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username CHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,			-- 或许可以加上一个最小位数限制？
    phone CHAR(15) NOT NULL UNIQUE,			-- 手机号码格式
    email VARCHAR(50) NOT NULL UNIQUE,		-- 邮件地址格式
    identity CHAR(18) NOT NULL UNIQUE,		-- 身份证号格式
    gender ENUM('男','女','其他') NOT NULL,
    
    birthday DATE NOT NULL 					-- 取值约束
    CHECK(birthday BETWEEN '1900-01-01' AND '2074-12-31'),
    
    professional ENUM('是','否') NOT NULL DEFAULT'否'
);



-- 管理员 admin
-- 主键admin_id关联movie, director, actor, type, company的外键

CREATE TABLE IF NOT EXISTS admin(
	admin_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    password VARCHAR(20) NOT NULL,
    phone CHAR(15) NOT NULL UNIQUE,			-- 手机号码格式
    email VARCHAR(50) NOT NULL UNIQUE,		-- 邮件地址格式
    identity CHAR(18) NOT NULL UNIQUE		-- 身份证号格式
);



-- 电影 movie（外键涉及admin, company表）
-- 主键movie_id关联movie_director, movie_actor, movie_category, firstcomment的外键

CREATE TABLE IF NOT EXISTS movie(
	name VARCHAR(100) NOT NULL,
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    
    release_year YEAR NOT NULL 			-- 取值约束
    CHECK(release_year BETWEEN '1900' AND '2074'),
    
    duration SMALLINT NOT NULL,
    company_id SMALLINT NOT NULL,		-- 外键，对应company表（后面加上）
    plot VARCHAR(300) NOT NULL,
    state ENUM("在映","下线","重映") NOT NULL,
    language VARCHAR(20) NOT NULL,
    
    create_id SMALLINT NOT NULL,		-- 外键，对应admin表
    CONSTRAINT movieCreate_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    create_time DATETIME NOT NULL		-- 取值约束
    CHECK(create_time BETWEEN '2024-01-01' AND '2074-12-31'),
    
    edit_id SMALLINT NOT NULL,			-- 外键，对应admin表
    CONSTRAINT movieEdit_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    edit_time DATETIME NOT NULL			-- 取值约束
    CHECK(edit_time BETWEEN '2024-01-01' AND '2074-12-31'),
    
    score DECIMAL(3,1) NOT NULL					-- 取值约束
    CHECK(score BETWEEN 0 AND 10),
    
    score_professional DECIMAL(3,1) NOT NULL	-- 取值约束
    CHECK(score_professional BETWEEN 0 AND 10)
);



-- 导演 director（外键涉及admin表）
-- 主键director_id关联movie_director的外键

CREATE TABLE IF NOT EXISTS director(
	director_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender ENUM("男","女","其他") NOT NULL,
    
    birthday DATE NOT NULL				-- 取值约束
    CHECK(birthday BETWEEN '1800-01-01' AND '2074-01-01'),
    
    introduction VARCHAR(300),
    nationality VARCHAR(20) NOT NULL,
    prize VARCHAR(300),
    
    create_id SMALLINT NOT NULL,		-- 外键，对应admin表
    CONSTRAINT directorCreate_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    create_time DATETIME NOT NULL		-- 取值约束
    CHECK(create_time BETWEEN '2024-01-01' AND '2074-12-31'),
    
    edit_id SMALLINT NOT NULL,			-- 外键，对应admin表
    CONSTRAINT directorEdit_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    edit_time DATETIME NOT NULL			-- 取值约束
    CHECK(edit_time BETWEEN '2024-01-01' AND '2074-12-31')
);



-- 演员 actor（外键涉及admin表）
-- 主键actor_id关联movie_actor的外键

CREATE TABLE IF NOT EXISTS actor(
	actor_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender ENUM("男","女","其他") NOT NULL,
    
    birthday DATE NOT NULL				-- 取值约束
    CHECK(birthday BETWEEN '1800-01-01' AND '2074-01-01'),
    
    introduction VARCHAR(300),
    nationality VARCHAR(20) NOT NULL,
    prize VARCHAR(300),
    
    create_id SMALLINT NOT NULL,		-- 外键，对应admin表
    CONSTRAINT actorCreate_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    create_time DATETIME NOT NULL		-- 取值约束
    CHECK(create_time BETWEEN '2024-01-01' AND '2074-12-31'),
    
    edit_id SMALLINT NOT NULL,			-- 外键，对应admin表
    CONSTRAINT actorEdit_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    edit_time DATETIME NOT NULL			-- 取值约束
    CHECK(edit_time BETWEEN '2024-01-01' AND '2074-12-31')
);



-- 类别 type（外键涉及admin表）
-- 主键type_id关联movie_type的外键

CREATE TABLE IF NOT EXISTS type(
	type_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    name CHAR(3) NOT NULL UNIQUE,
    
    create_id SMALLINT NOT NULL,		-- 外键，对应admin表
    CONSTRAINT typeCreate_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    create_time DATETIME NOT NULL		-- 取值约束
    CHECK(create_time BETWEEN '2024-01-01' AND '2074-12-31'),
    
    edit_id SMALLINT NOT NULL,			-- 外键，对应admin表
    CONSTRAINT typeEdit_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    edit_time DATETIME NOT NULL			-- 取值约束
    CHECK(edit_time BETWEEN '2024-01-01' AND '2074-12-31')
);



-- 公司 company（外键涉及admin表）
-- 主键company_id关联movie表的外键

CREATE TABLE IF NOT EXISTS company(
	company_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(30) NOT NULL,
    
    create_id SMALLINT NOT NULL,		-- 外键，对应admin表
    CONSTRAINT companyCreate_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    create_time DATETIME NOT NULL		-- 取值约束
    CHECK(create_time BETWEEN '2024-01-01' AND '2074-12-31'),
    
    edit_id SMALLINT NOT NULL,			-- 外键，对应admin表
    CONSTRAINT companyEdit_fk_admin FOREIGN KEY (create_id) REFERENCES admin(admin_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    edit_time DATETIME NOT NULL			-- 取值约束
    CHECK(edit_time BETWEEN '2024-01-01' AND '2074-12-31')
);

-- 添加movie表的外键，对应company表

ALTER TABLE movie ADD CONSTRAINT movie_fk_company
FOREIGN KEY(company_id) REFERENCES company(company_id)
ON DELETE CASCADE
ON UPDATE CASCADE;



-- 电影-导演 movie_director（外键涉及movie, director表）

CREATE TABLE IF NOT EXISTS movie_director(
	movie_id INT NOT NULL,				-- 外键，对应movie表
    CONSTRAINT moviedirector_fk_movie FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    director_id MEDIUMINT NOT NULL,		-- 外键，对应director表
    CONSTRAINT moviedirector_fk_director FOREIGN KEY (director_id) REFERENCES director(director_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    duty VARCHAR(20) NOT NULL,
    
    PRIMARY KEY(movie_id, director_id)	-- 联合主键
);



-- 电影-演员 movie_actor（外键涉及movie, actor表）

CREATE TABLE IF NOT EXISTS movie_actor(
	movie_id INT NOT NULL,				-- 外键，对应movie表
    CONSTRAINT movieactor_fk_movie FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    role VARCHAR(50) NOT NULL,
    actor_id MEDIUMINT NOT NULL,		-- 外键，对应actor表
    CONSTRAINT movieactor_fk_actor FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    PRIMARY KEY(movie_id, role)			-- 联合主键
);



-- 电影-类别 movie_type（外键涉及movie, type表）

CREATE TABLE IF NOT EXISTS movie_type(
	movie_id INT NOT NULL,				-- 外键，对应movie表
    CONSTRAINT movietype_fk_movie FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    type_id TINYINT NOT NULL,		-- 外键，对应type表
    CONSTRAINT movietype_fk_type FOREIGN KEY (type_id) REFERENCES type(type_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    PRIMARY KEY(movie_id, type_id)	-- 联合主键
);



-- 用户-电影初评 firstcomment（外键涉及user, movie表）
-- 主键firstcomment_id关联attitude, followcomment的外键

CREATE TABLE IF NOT EXISTS firstcomment(
	firstcomment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,				-- 外键，对应user表
    CONSTRAINT firstcomment_fk_user FOREIGN KEY (user_id) REFERENCES user(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    professional ENUM("是","否") NOT NULL DEFAULT "否",
    
    movie_id INT NOT NULL,				-- 外键，对应movie表
    CONSTRAINT firstcomment_fk_movie FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    overall_score TINYINT NOT NULL		-- 取值约束
    CHECK (overall_score BETWEEN 0 AND 10),
    
    plot_score TINYINT NOT NULL			-- 取值约束
    CHECK (plot_score BETWEEN 0 AND 10),
    
    texture_score TINYINT NOT NULL		-- 取值约束
    CHECK (texture_score BETWEEN 0 AND 10),
    
    acting_score TINYINT NOT NULL		-- 取值约束
    CHECK (acting_score BETWEEN 0 AND 10),
    
    entertainment_score TINYINT NOT NULL	-- 取值约束
    CHECK (entertainment_score BETWEEN 0 AND 10),
    
    theme_score TINYINT NOT NULL		-- 取值约束
    CHECK (theme_score BETWEEN 0 AND 10),
    
    save ENUM("是","否") NOT NULL DEFAULT "否",
    rewatch ENUM("是","否") NOT NULL,
    
    time DATETIME NOT NULL				-- 取值约束
    CHECK (time BETWEEN  '2024-01-01' AND '2074-12-31'),
    
    text VARCHAR(300) NOT NULL,
    status ENUM("通过","未通过","审核中") NOT NULL DEFAULT("审核中"),
    likes INT NOT NULL DEFAULT 0,
    dislikes INT NOT NULL DEFAULT 0
);



-- 用户-电影初评点踩关系 attitude（外键涉及user, firstcomment表）

CREATE TABLE IF NOT EXISTS attitude(
	firstcomment_id INT NOT NULL UNIQUE,	-- 外键，对应firstcomment表
    CONSTRAINT attitude_fk_firstcomment FOREIGN KEY (firstcomment_id) REFERENCES firstcomment(firstcomment_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    user_id INT NOT NULL,					-- 外键，对应user表
    CONSTRAINT attitude_fk_user FOREIGN KEY (user_id) REFERENCES user(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    attitude ENUM("赞","踩") NOT NULL,
    
    time DATETIME NOT NULL					-- 取值约束
    CHECK (time BETWEEN  '2024-01-01' AND '2074-12-31'),
    
    PRIMARY KEY(firstcomment_id, user_id)	-- 联合主键
);



-- 用户-电影追评关系表 followcomment（外键涉及user, firstcomment表）

CREATE TABLE IF NOT EXISTS followcomment(
	followcomment_id INT PRIMARY KEY AUTO_INCREMENT,
    
    firstcomment_id INT NOT NULL,	-- 外键，对应firstcomment表
    CONSTRAINT followcomment_fk_firstcomment FOREIGN KEY (firstcomment_id) REFERENCES firstcomment(firstcomment_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    user_id INT NOT NULL,			-- 外键，对应user表
    CONSTRAINT followcomment_fk_user FOREIGN KEY (user_id) REFERENCES user(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    professional ENUM("是","否") NOT NULL DEFAULT "否",
    text VARCHAR(300) NOT NULL,
    
    time DATETIME NOT NULL			-- 取值约束
    CHECK (time BETWEEN  '2024-01-01' AND '2074-12-31'),
    
    status ENUM("通过","未通过","审核中") NOT NULL DEFAULT("审核中")
);



-- 调试时使用：
-- SHOW DATABASES;
-- SHOW TABLES;
-- DESCRIBE table_name;
-- DROP TABLE table_name;
-- DROP DATABASE movie_database;