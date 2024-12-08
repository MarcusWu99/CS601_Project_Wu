### 🚀 **Project Introduction**
**➡️ Author:** **`Yifan Wu`**  

This project is a **🌟 Personal Portfolio Website** created as part of the coursework for **CS 601** in **2024**. The website showcases:
- 📖 **Personal Information**
- 🎓 **Educational Background**
- 💻 **Professional Skills**
- 🏢 **Internship Experiences**
- 📂 **Project Highlights**  

It is designed to be both **visually appealing** and **functional**, adhering to modern web development best practices.

---

### 🛠️ **Technologies and Languages Used**

#### **Frontend**:  
- **HTML5**: For static page structure like the homepage, education, and projects.  
- **CSS3**: For styling, with separate stylesheets for navigation, footer, and page-specific designs.  
- **JavaScript**: For client-side interactions and utility functions.

#### **Backend**:  
- **Node.js with Express.js**: To manage server-side logic, routing, and rendering dynamic content using EJS templates.  
- **MySQL**: For database storage and retrieval of dynamic data like projects and internships.

#### **Dynamic Content**:  
- **EJS (Embedded JavaScript Templates)**: To render pages with reusable components (e.g., headers, footers).  

#### **Database Scripts**:  
- **SQL**: Includes scripts for creating the database schema and populating it with sample data.

---

### 📂 **Project Structure**
```plaintext
601_project/
│
├── public/                                # Static assets
│   ├── css/                               # Stylesheets
│   │   ├── global.css                     # Global styles
│   │   ├── header.css                     # Header styles
│   │   ├── footer.css                     # Footer styles
│   │   ├── sidebar.css                    # Sidebar styles
│   │   ├── projects.css                   # Project page styles
│   │   ├── education.css                  # Education page styles
│   │   ├── internships.css                # Internships page styles
│   │   └── skills.css                     # Skills page styles
│   │
│   ├── images/                            # Image resources
│   │   ├── bu-logo.gif                    # Boston University Logo
│   │   ├── profile.jpg                    # Profile picture
│   │   └── projects/                      # Project images
│   │       ├── project1.jpg               # WeatherDB image
│   │       ├── project2.jpg               # Health Care Web App image
│   │       ├── project3.jpg               # ASCVD Algorithm image
│   │       └── project4.jpg               # Sentiment Analysis image
│   │
│   ├── js/                                # Static JavaScript files
│   │   ├── frontend.js                    # Frontend logic
│   │   └── utils.js                       # Utility functions
│
├── views/                                 # Dynamic EJS templates
│   ├── partials/                          # Reusable components
│   │   ├── header.ejs                     # Dynamic header
│   │   ├── footer.ejs                     # Dynamic footer
│   │   └── sidebar.ejs                    # Sidebar template
│   │
│   ├── index.ejs                          # Homepage template
│   ├── education.ejs                      # Education page template
│   ├── internships_dynamic.ejs            # Internships page template
│   ├── skills.ejs                         # Skills page template
│   ├── projects.ejs                       # Projects overview template
│   └── project_details.ejs                # Project details template
│
├── sql/                                   # Database scripts
│   ├── create_database.sql                # Create database schema
│   ├── insert_data.sql                    # Populate database with sample data
│
├── db_connect.js                          # Database connection configuration
├── queries.js                             # Query functions for database
├── server.js                              # Main server file
├── .gitignore                             # Git ignore file
├── README.md                              # Documentation
```

---

### ✍️ **File Descriptions**

#### **CSS Files**
- **`global.css`**: Contains global styles applied to the entire site.  
- **`header.css`**: Styles specific to the navigation header.  
- **`footer.css`**: Styles for the website's footer.  
- **`sidebar.css`**: Styling for the sidebar used for navigation.  
- **`projects.css`**: Styling for the project overview and detail pages.  
- **`education.css`**: Styling for the education page.  
- **`internships.css`**: Styling for the internships page.  
- **`skills.css`**: Tailored styles for the skills page.  

#### **JavaScript Files**
- **`frontend.js`**: Handles client-side interactivity like animations and events.  
- **`utils.js`**: Provides reusable utility functions.  

#### **Dynamic EJS Templates**
- **`header.ejs`**: Dynamic template for the navigation header.  
- **`footer.ejs`**: Dynamic template for the footer.  
- **`sidebar.ejs`**: Sidebar navigation template.  
- **`index.ejs`**: Template for the homepage.  
- **`education.ejs`**: Template for educational background.  
- **`projects.ejs`**: Template for the project overview page.  
- **`project_details.ejs`**: Template for detailed project pages.  
- **`internships_dynamic.ejs`**: Template for internships.  
- **`skills.ejs`**: Template for skills and proficiencies.

#### **SQL Files**
- **`create_database.sql`**: Script to create database tables and relations.  
- **`insert_data.sql`**: Adds initial sample data to the database.  

#### **Server and Database**
- **`db_connect.js`**: Configuration file for connecting to the database.  
- **`queries.js`**: Handles database interactions like fetching or inserting data.  
- **`server.js`**: Main server file to manage routing and dynamic page rendering.

---

### 📦 **Packages**
```bash
npm install express ejs mysql2 dotenv body-parser cors bcrypt morgan helmet compression
npm install --save-dev nodemon prettier eslint
```