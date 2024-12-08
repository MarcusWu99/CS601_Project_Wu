const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const queries = require('./queries');
const app = express();

// Set the port number
const PORT = 3002;

// Middleware for parsing JSON and form data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Set up static files directory
app.use(express.static(path.join(__dirname, 'public')));

// Set the view engine to EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware to fetch user info for `footer` and `sidebar`
app.use(async (req, res, next) => {
    try {
        const userInfo = await queries.getUserInfo();
        const additionalInfo = await queries.getFooterAndSidebarDetails();
        res.locals.userInfo = userInfo; // Share basic user info across templates
        res.locals.additionalInfo = additionalInfo; // Share additional info across templates
        next();
    } catch (error) {
        console.error('Error fetching user info for middleware:', error);
        res.locals.userInfo = null;
        res.locals.additionalInfo = null;
        next();
    }
});

// Route: Homepage
app.get('/', async (req, res) => {
    try {
        res.render('index');
    } catch (error) {
        console.error('Error fetching homepage data:', error);
        res.status(500).send('Internal Server Error');
    }
});

// Route: Education
app.get('/education', async (req, res) => {
    try {
        const educationData = await queries.getEducation();
        res.render('education', { educationData });
    } catch (error) {
        console.error('Error fetching education data:', error);
        res.status(500).send('Internal Server Error');
    }
});

// Route: Projects Overview
app.get('/projects', async (req, res) => {
    try {
        const projects = await queries.getProjects();
        res.render('projects', { projects });
    } catch (error) {
        console.error('Error fetching projects:', error);
        res.status(500).send('Internal Server Error');
    }
});

// Route: Project Details
app.get('/projects/:id', async (req, res) => {
    const projectId = req.params.id;
    try {
        const project = await queries.getProjectDetails(projectId);
        const images = await queries.getProjectImages(projectId);
        if (!project) {
            res.status(404).send('Project not found');
        } else {
            res.render('project_details', { project, images });
        }
    } catch (error) {
        console.error('Error fetching project details:', error);
        res.status(500).send('Internal Server Error');
    }
});

// Route: Internships
app.get('/internships', async (req, res) => {
    try {
        const internships = await queries.getInternships();
        res.render('internships_dynamic', { internships });
    } catch (error) {
        console.error('Error fetching internships:', error);
        res.status(500).send('Internal Server Error');
    }
});

// Route: Skills
app.get('/skills', async (req, res) => {
    try {
        const skills = await queries.getSkills();
        res.render('skills', { skills });
    } catch (error) {
        console.error('Error fetching skills:', error);
        res.status(500).send('Internal Server Error');
    }
});


// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
