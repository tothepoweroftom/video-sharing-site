DROP DATABASE YOUTUBE;

CREATE DATABASE YOUTUBE;

USE YOUTUBE;

CREATE TABLE USER(U_ID INT AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(30) NOT NULL,USERNAME VARCHAR(30) NOT NULL,PASSWORD VARCHAR(100) NOT NULL,
DISPLAY_PICTURE VARCHAR(200));

CREATE TABLE VIDEO(V_ID INT AUTO_INCREMENT PRIMARY KEY,U_ID INT NOT NULL,TITLE VARCHAR(20) NOT NULL,VIEWS INT NOT NULL,CHAN_ID INT NOT NULL,
PATH VARCHAR(100) NOT NULL,DISPLAY_PICTURE VARCHAR(200));

CREATE TABLE RATING(U_ID INT NOT NULL,V_ID INT NOT NULL,RATE INT NOT NULL,PRIMARY KEY(U_ID,V_ID),
FOREIGN KEY(U_ID) REFERENCES USER(U_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(V_ID) REFERENCES VIDEO(V_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE COMMENT(U_ID INT NOT NULL,V_ID INT NOT NULL,TEXT VARCHAR(150) NOT NULL,C_ID INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(U_ID) REFERENCES USER(U_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(V_ID) REFERENCES VIDEO(V_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE REPLY(C_ID INT NOT NULL,U_ID INT NOT NULL,TEXT VARCHAR(150) NOT NULL,R_ID INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(C_ID) REFERENCES COMMENT(C_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(U_ID) REFERENCES USER(U_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE CHANNEL(CHAN_ID INT AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(30) NOT NULL,U_ID INT NOT NULL,DISPLAY_PICTURE VARCHAR(200),
BCKGND_PIC VARCHAR(200),
FOREIGN KEY(U_ID) REFERENCES USER(U_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SUBSCRIPTION(CHAN_ID INT NOT NULL,U_ID INT NOT NULL,PRIMARY KEY(CHAN_ID,U_ID),
FOREIGN KEY(CHAN_ID) REFERENCES CHANNEL(CHAN_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(U_ID) REFERENCES USER(U_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE PLAYLIST(P_ID INT AUTO_INCREMENT PRIMARY KEY,U_ID INT NOT NULL,NAME VARCHAR(30) NOT NULL,
FOREIGN KEY(U_ID) REFERENCES USER(U_ID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE PLAYLIST_VIDEOS(P_ID INT NOT NULL,V_ID INT NOT NULL,INDEX_ INT NOT NULL,PRIMARY KEY(P_ID,V_ID),
FOREIGN KEY(P_ID) REFERENCES PLAYLIST(P_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(V_ID) REFERENCES VIDEO(V_ID) ON DELETE CASCADE ON UPDATE CASCADE);
 