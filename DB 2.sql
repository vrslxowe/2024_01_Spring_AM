DROP DATABASE IF EXISTS `Spring_AM_01`;
CREATE DATABASE `Spring_AM_01`;
USE `Spring_AM_01`;

#Diary_Member 테이블 생성
CREATE TABLE Diary_Member (
    user_id INT AUTO_INCREMENT NOT NULL,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId VARCHAR(255) NOT NULL,
    loginPw VARCHAR(255) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    authLevel SMALLINT(2) UNSIGNED DEFAULT 2 COMMENT '권한 레벨 (2=일반,7=관리자)',
    PRIMARY KEY(user_id)
);

#Diary_Member TD 생성
#일반
INSERT INTO Diary_Member
SET regDate = NOW(),
updateDate = NOW(),
loginId = 't1',
loginPw = 't1',
`name` = '회원1',
phone_number = '01011112222',
birth_date = '1999-04-01',
email = 'pwblsh@gmail.com',
nickname = '회원1';

INSERT INTO Diary_Member
SET regDate = NOW(),
updateDate = NOW(),
loginId = 't2',
loginPw = 't2',
`name` = '회원2',
phone_number = '01033334444',
birth_date = '1999-05-01',
email = 'atlses@gmail.com',
nickname = '회원2';

#Diary_Member TD 생성
#관리자
INSERT INTO Diary_Member
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
phone_number = '01055556666',
birth_date = '1999-03-01',
email = 'strjsc@gmail.com',
nickname = '관리자';

SELECT * FROM Diary_Member;

#Diary_Setting 테이블 생성
CREATE TABLE Diary_Setting (
    user_id INT,
    font_setting VARCHAR(50),
    start_day VARCHAR(10),
    record_backup BOOLEAN,
    record_recovery BOOLEAN,
    contact_us VARCHAR(255),
    FOREIGN KEY(user_id) REFERENCES Diary_Member(user_id)
);

SELECT * FROM Diary_Setting;

#Diary_MemberState 테이블 생성
CREATE TABLE Diary_MemberState (
    state_id INT AUTO_INCREMENT,
    location VARCHAR(255),
    weather VARCHAR(50),
    emotion VARCHAR(50),
    music VARCHAR(255),
    PRIMARY KEY(state_id)
);

SELECT * FROM Diary_MemberState;

#Diary_PostStyle 테이블 생성
CREATE TABLE Diary_PostStyle (
    style_id INT AUTO_INCREMENT,
    font_size INT,
    alignment VARCHAR(50),
    original_size_attachment BOOLEAN,
    attachment_placement VARCHAR(50),
    PRIMARY KEY(style_id)
);
SELECT * FROM Diary_PostStyle;


#Diary_MainCalendar 테이블 생성
CREATE TABLE Diary_MainCalendar (
    `date` DATE,
    user_id INT,
    `event` VARCHAR(255),
    is_recorded BOOLEAN,
    record_content TEXT,
    d_day VARCHAR(10),
    to_do VARCHAR(255),
    to_do_status ENUM('미완료', '진행 중', '완료'),
    PRIMARY KEY(`date`, user_id),
    FOREIGN KEY(user_id) REFERENCES Diary_Member(user_id)
);

SELECT * FROM Diary_MainCalendar;

#Diary_Write 테이블 생성
CREATE TABLE Diary_Write (
    post_id INT AUTO_INCREMENT,
    user_id INT,
    state_id INT,
    style_id INT,
    title VARCHAR(255),
    content TEXT,
    temp_save BOOLEAN,
    post_date DATE,
    link VARCHAR(255),
    date_setting DATE,
    PRIMARY KEY(post_id),
    FOREIGN KEY(user_id) REFERENCES Diary_Member(user_id),
    FOREIGN KEY(state_id) REFERENCES Diary_MemberState(state_id),
    FOREIGN KEY(style_id) REFERENCES Diary_PostStyle(style_id)
);

SELECT * FROM Diary_Write;

#Diary_Post 테이블 생성
CREATE TABLE Diary_Post (
    post_id INT,
    state_id INT,
    d_day INT,
    FOREIGN KEY(post_id) REFERENCES Diary_Write(post_id),
    FOREIGN KEY(state_id) REFERENCES Diary_MemberState(state_id)
);

SELECT * FROM Diary_Post;

#Diary_Event 테이블 생성
CREATE TABLE Diary_Event (
    event_id INT AUTO_INCREMENT,
    user_id INT,
    event_name VARCHAR(255),
    event_type VARCHAR(50),
    event_color VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (event_id),
    FOREIGN KEY (user_id) REFERENCES Diary_Member(user_id)
);

SELECT * FROM Diary_Event;

#Diary_Event TD 생성
INSERT INTO Diary_Event
SET user_id = 1,
event_name = 'Lunch Meeting w/ Mark',
event_type = 'Work',
event_color = 'orange';

INSERT INTO Diary_Event
SET user_id = 1,
event_name = 'Game vs Portalnd',
event_type = 'Sports',
event_color = 'blue';

INSERT INTO Diary_Event
SET user_id = 1,
event_name = 'School Play',
event_type = 'Kids',
event_color = 'yellow';

INSERT INTO Diary_Event
SET user_id = 1,
event_name = 'Free Tamale Night',
event_type = 'Other',
event_color = 'green';

INSERT INTO Diary_Event
SET user_id = 2,
event_name = 'Dinner w/ Marketing',
event_type = 'Work',
event_color = 'orange';

INSERT INTO Diary_Event
SET user_id = 2,
event_name = 'Game vs San Degio',
event_type = 'Sports',
event_color = 'blue';

INSERT INTO Diary_Event
SET user_id = 2,
event_name = 'Ice Cream Night',
event_type = 'Kids',
event_color = 'yellow';

INSERT INTO Diary_Event
SET user_id = 2,
event_name = 'Startup Weekend',
event_type = 'Other',
event_color = 'green';