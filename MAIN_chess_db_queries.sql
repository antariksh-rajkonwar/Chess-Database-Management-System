create database miniproj2;
use miniproj2;

-- Players Table
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100),
    rating INT
    -- Other personal details
);

-- Teams Table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
    -- Other team details
);

-- TeamPlayers Relationship Table
CREATE TABLE TeamPlayers (
    team_id INT,
    player_id INT,
    PRIMARY KEY (team_id, player_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Matches Table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_id INT,
    player1_id INT,
    player2_id INT,
    match_date DATE,
    result VARCHAR(50),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id),
    FOREIGN KEY (player1_id) REFERENCES Players(player_id),
    FOREIGN KEY (player2_id) REFERENCES Players(player_id)
    -- Other match details
);

-- Tournaments Table
CREATE TABLE Tournaments (
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    start_date DATE,
    end_date DATE,
    organizer VARCHAR(255)
    -- Other tournament details
);

-- Events Table
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    event_date DATE,
    location VARCHAR(255),
    description TEXT,
    tournament_id INT,
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id)
    -- Other event details
);

-- Coaches Table
CREATE TABLE Coaches (
    coach_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    contact_details VARCHAR(255)
    -- Other coach details
);

-- CoachPlayers Relationship Table
CREATE TABLE CoachPlayers (
    coach_id INT,
    player_id INT,
    PRIMARY KEY (coach_id, player_id),
    FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Chess Pieces Table
CREATE TABLE ChessPieces (
    piece_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
    -- Other piece details
);

-- Prizes Table
CREATE TABLE Prizes (
    prize_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_id INT,
    amount DECIMAL(10, 2),
    category VARCHAR(100),
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id)
    -- Other prize details
);

-- Federations Table
CREATE TABLE Federations (
    federation_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    contact_details VARCHAR(255)
    -- Other federation details
);

-- Games Table
CREATE TABLE Games (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT,
    moves TEXT,
    timestamp DATETIME,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
    -- Other game details
);


-- Commentaries Table
CREATE TABLE Commentaries (
    commentary_id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT,
    commentator_id INT,
    commentary TEXT,
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (commentator_id) REFERENCES Players(player_id)
    -- Other commentary details
);

-- User Accounts Table
CREATE TABLE UserAccounts (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
    -- Other user account details
);

-- User Preferences Table
CREATE TABLE UserPreferences (
    user_id INT PRIMARY KEY,
    language VARCHAR(50),
    theme VARCHAR(50),
    notifications BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES UserAccounts(user_id)
    -- Other user preference details
);

-- Logs Table
CREATE TABLE Logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    timestamp DATETIME,
    event_description TEXT
    -- Other log details
);
