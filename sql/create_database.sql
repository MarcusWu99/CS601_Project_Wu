-- Create database
CREATE DATABASE IF NOT EXISTS PortfolioDB;

USE PortfolioDB;

-- User Info Table
CREATE TABLE user_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    age INT,
    phone VARCHAR(15),
    email VARCHAR(100),
    alternate_email VARCHAR(100),
    profile_picture VARCHAR(255), -- Path to profile picture
    bio TEXT, -- Short introduction
    linkedin VARCHAR(255),
    github VARCHAR(255),
    portfolio VARCHAR(255)
);

-- Education Table
CREATE TABLE education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    university_name VARCHAR(100) NOT NULL,
    program VARCHAR(100),
    start_date DATE,
    end_date DATE,
    main_courses TEXT,
    achievements TEXT,
    FOREIGN KEY (user_id) REFERENCES user_info(id)
);

-- Projects Table
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    abstract TEXT, -- Short project summary
    description TEXT, -- Detailed project content
    github_link VARCHAR(255),
    category VARCHAR(50), -- Category (e.g., Web Development, Machine Learning)
    tech_stack TEXT, -- Technologies used
    start_date DATE, -- Project start date
    end_date DATE, -- Project end date
    FOREIGN KEY (user_id) REFERENCES user_info(id)
);

-- Project Images Table
CREATE TABLE project_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    image_path VARCHAR(255),
    description VARCHAR(255),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- Internships Table
CREATE TABLE internships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_name VARCHAR(100),
    role VARCHAR(100),
    abstract TEXT, -- Short internship summary
    description TEXT, -- Detailed internship content
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES user_info(id)
);

-- Skills Table
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category VARCHAR(50), -- Programming, Web Development, etc.
    skill_name VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES user_info(id)
);
