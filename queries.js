const db = require('./db_connect');

// Query to fetch user information
const getUserInfo = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT name, location, age, phone, email, alternate_email FROM user_info LIMIT 1;`;
        db.query(sql, (err, results) => {
            if (err) {
                console.error('Error fetching user info:', err);
                return reject(err);
            }
            resolve(results[0]); // Return the first user
        });
    });
};

// Query to fetch education data
const getEducation = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM education;`;
        db.query(sql, (err, results) => {
            if (err) {
                console.error('Error fetching education data:', err);
                return reject(err);
            }
            resolve(results);
        });
    });
};

// Query to fetch all projects
const getProjects = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM projects;`;
        db.query(sql, (err, results) => {
            if (err) {
                console.error('Error fetching projects:', err);
                return reject(err);
            }
            resolve(results);
        });
    });
};

// Query to fetch project details by ID
const getProjectDetails = (projectId) => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM projects WHERE id = ?;`;
        db.query(sql, [projectId], (err, results) => {
            if (err) {
                console.error(`Error fetching project details for ID ${projectId}:`, err);
                return reject(err);
            }
            resolve(results[0]);
        });
    });
};

// Query to fetch project images by project ID
const getProjectImages = (projectId) => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM project_images WHERE project_id = ?;`;
        db.query(sql, [projectId], (err, results) => {
            if (err) {
                console.error(`Error fetching project images for project ID ${projectId}:`, err);
                return reject(err);
            }
            resolve(results);
        });
    });
};

// Query to fetch additional personal details
const getFooterAndSidebarDetails = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT linkedin, github, portfolio FROM user_info LIMIT 1;`;
        db.query(sql, (err, results) => {
            if (err) {
                console.error('Error fetching footer and sidebar details:', err);
                return reject(err);
            }
            resolve(results[0]); // Return additional details for the user
        });
    });
};

// Query to fetch all internships
const getInternships = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM internships;`;
        db.query(sql, (err, results) => {
            if (err) {
                console.error('Error fetching internships:', err);
                return reject(err);
            }
            resolve(results);
        });
    });
};

// Query to fetch all skills
const getSkills = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT category, skill_name FROM skills;`;
        db.query(sql, (err, results) => {
            if (err) {
                console.error('Error fetching skills:', err);
                return reject(err);
            }
            resolve(results);
        });
    });
};

module.exports = {
    getUserInfo,
    getEducation,
    getProjects,
    getProjectDetails,
    getProjectImages,
    getFooterAndSidebarDetails, 
    getInternships,
    getSkills,
};
