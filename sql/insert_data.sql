USE PortfolioDB;

-- Insert user information
INSERT INTO user_info (name, location, age, phone, email, alternate_email, profile_picture, bio, linkedin, github, portfolio)
VALUES 
('Yifan Wu', 'Boston, MA, US', 22, '+1 617-817-8680', 'yifan@outlook.com', 'highwind@bu.edu', 'public/images/profile.jpg', 
 'An aspiring software developer specializing in web development and machine learning.',
 'https://linkedin.com/in/yifanwu', 'https://github.com/YifanWu', 'https://yifanwu.dev');

-- Insert education
INSERT INTO education (user_id, university_name, program, start_date, end_date, main_courses, achievements)
VALUES 
(1, 'Boston University', 'M.Sc. in Computer Science', '2023-09-01', '2025-01-18', 
 'CS690 Network Security, CS601 Web Application Development, CS580 Health Informatics', 'None'),
(1, 'Chongqing University of Posts and Telecommunications', 'B.Sc. in Computer Science', '2019-09-01', '2023-06-01', 
 'Data Analysis by R, SQL, Advanced Statistics, Data Mining', 'Second Prize in the 2022 National College Students Innovation and Entrepreneurship Competition');

-- Insert projects
INSERT INTO projects (user_id, title, abstract, description, github_link, category, tech_stack, start_date, end_date)
VALUES 
-- WeatherDB
(1, 'WeatherDB', 
 'WeatherDB automates the ETL (Extract, Transform, Load) process for NOAA weather data, providing seamless data warehousing and advanced management capabilities.', 
 'WeatherDB is a highly scalable meteorological data management system designed to support complex analyses, high-volume data ingestion, and advanced visualization. The project integrates big data processing, dynamic schema optimization, and real-time querying to empower meteorologists, urban planners, and disaster response teams.\n\nAdvanced Features:\n1. Intelligent ETL Pipeline:\n   - Uses parallel data extraction to handle NOAA''s multi-terabyte archives.\n   - Dynamic transformation pipelines leverage Spark for distributed processing, ensuring low-latency ingestion.\n   - Missing data imputation through advanced algorithms, such as K-Nearest Neighbors (KNN), maintains data integrity:\n     x_missing = SUM(w_i * x_i) / SUM(w_i).\n\n2. Temporal and Spatial Indexing:\n   - Implements multi-level indexing combining geohashing for spatial queries and temporal partitioning for chronological access.\n   - Query performance improves by up to 85% when retrieving station-specific historical trends.\n\n3. Custom Visualization Framework:\n   - Heatmaps and vector field plots for wind analysis, powered by D3.js.\n   - Predictive modeling dashboard integrating machine learning outputs (e.g., ARIMA for time-series forecasts).\n\nUse Case:\nPredicting storm impacts:\n- Analyze wind speed and precipitation anomalies over affected regions.\n- Generate interactive maps to aid emergency response teams.', 
 'https://github.com/MarcusWu99/WeatherDB', 
 'Web Development', 
 'Node.js, MySQL, Spark, ARIMA, D3.js', 
 '2024-06-01', '2024-09-01'),

-- Student Health Care Web Application
(1, 'Student Health Care Web Application', 
 'The Student Health Care Web Application is designed to streamline communication and operations for school medical offices. It includes features like student-doctor appointment scheduling, real-time prescription and diagnosis management, and secure user authentication using bcrypt.', 
 'This application represents a next-generation healthcare management platform designed for multi-role interaction. Built on microservices architecture, it ensures modularity, scalability, and fault tolerance. Aimed at university campuses, it supports over 10,000 concurrent users while maintaining sub-second response times.\n\nAdvanced Features:\n1. Dynamic Scheduling Engine:\n   - Employs constraint satisfaction algorithms (e.g., Backtracking Search with Arc-Consistency) to allocate appointments based on time slots, resources, and urgency.\n   - Mathematical formulation: minimize SUM(c_i * x_i) where x_i is the slot allocation, and c_i is the penalty for conflicts.\n\n2. Secure Data Pipeline:\n   - Implements end-to-end encryption with AES-256 for medical data.\n   - Real-time data synchronization using WebSocket protocols for live updates.\n\n3. AI-Assisted Diagnostics:\n   - Leverages natural language processing (NLP) to extract symptoms from medical notes.\n   - Integrates a Bayesian inference model to suggest possible diagnoses.\n\nUse Case:\nAdministrators: Track disease prevalence and generate epidemiological reports.\nDoctors: Automate prescription generation with embedded drug interaction checks.\nStudents: Receive personalized health recommendations through AI-powered analytics.', 
 'https://github.com/MarcusWu99/BU-HealthCare-Web-App', 
 'Full Stack', 
 'Node.js, MySQL, Microservices, AES-256, WebSocket, Bayesian Inference', 
 '2024-01-01', '2024-04-01'),

-- ASCVD Risk Reduction Algorithm
(1, 'ASCVD Risk Reduction Algorithm', 
 'Developed a module for predicting Atherosclerotic Cardiovascular Disease (ASCVD) risk among patients with type 2 diabetes. The system utilizes machine learning algorithms such as Support Vector Machine (SVM), Random Forest, and Neural Networks to analyze patient data and recommend personalized treatment plans.', 
 'The ASCVD Risk Reduction Algorithm is a sophisticated AI-powered tool that integrates multi-modal patient data to predict cardiovascular risks. It provides explainable AI outputs to support medical decision-making, ensuring both accuracy and transparency.\n\nAdvanced Features:\n1. Hybrid Modeling Approach:\n   - Combines statistical models (e.g., Cox Proportional Hazards) with machine learning techniques for improved robustness: h(t) = h_0(t) * exp(beta_1 * x_1 + beta_2 * x_2 + ... + beta_p * x_p).\n\n2. Explainable AI (XAI):\n   - Implements SHAP (SHapley Additive exPlanations) to visualize the contribution of each feature to predictions.\n\n3. Continuous Learning Pipeline:\n   - Retrains models with new patient data every 6 months, ensuring adaptation to emerging medical trends.\n\nUse Case:\nEarly detection of ASCVD risks in diabetic patients:\n- Predict 10-year risk levels for over 5,000 patients in under 2 minutes.\n- Simulate treatment plans and visualize projected risk reduction.', 
 'https://github.com/MarcusWu99/BU-HealthCare-Web-App', 
 'Machine Learning', 
 'SVM, Random Forest, Neural Networks, XAI, SHAP, Cox Model', 
 '2022-06-01', '2022-09-01'),

-- Text-based Stock Price and Investor Sentiment Analysis
(1, 'Text-based Stock Price and Investor Sentiment Analysis', 
 'Built a sentiment analysis system to predict stock prices based on investor opinions. Crawled over 400,000 stock-related comments and historical trading data using Scrapy and BeautifulSoup. Preprocessed text data with jieba and TF-IDF, and classified sentiment using SVM. Constructed an investor sentiment index to correlate sentiment trends with stock performance.', 
 'This system revolutionizes financial analytics by combining NLP, big data, and predictive modeling to analyze market sentiment. It predicts stock movements with high accuracy, empowering traders and analysts with actionable insights.\n\nAdvanced Features:\n1. Sentiment Index Analytics:\n   - Calculates daily sentiment shifts: Delta_Sentiment = (ISI_t+1 - ISI_t) / ISI_t.\n   - Visualizes sentiment correlation with volatility indices (e.g., VIX).\n\n2. Deep Learning Extension:\n   - Fine-tuned BERT model to enhance sentiment classification accuracy to 92%.\n   - Processes colloquial and domain-specific language effectively (e.g., ''diamond hands'').\n\n3. Financial Signal Generation:\n   - Combines sentiment with technical indicators (e.g., RSI, MACD) to trigger buy/sell signals.\n   - Incorporates reinforcement learning to refine trading strategies based on past performance.\n\nUse Case:\nPortfolio Managers: Use real-time sentiment shifts to rebalance portfolios.\nRetail Investors: Track social media-driven price surges (e.g., meme stocks).', 
 'https://github.com/MarcusWu99/BU-HealthCare-Web-App', 
 'Data Analysis', 
 'Scrapy, BeautifulSoup, jieba, TF-IDF, SVM, BERT, Reinforcement Learning', 
 '2023-06-01', '2023-09-01');

-- Insert project images
INSERT INTO project_images (project_id, image_path, description)
VALUES 
(1, 'public/images/projects/project1.jpg', 'WeatherDB Project Screenshot'),
(2, 'public/images/projects/project2.jpg', 'Health Care Web App Screenshot'),
(3, 'public/images/projects/project3.png', 'ASCVD Risk Reduction Algorithm Screenshot'),
(4, 'public/images/projects/project4.png', 'Stock Price and Sentiment Analysis Screenshot');

-- Insert internships
INSERT INTO internships (user_id, company_name, role, abstract, description, start_date, end_date)
VALUES 
(1, 'Tangshan Maternal and Child Health Hospital', 'IT System Maintenance', 
 'Provided system maintenance and optimized hospital operations.', 
 'During this internship, I was responsible for maintaining the hospital’s IT systems, ensuring database integrity, and implementing security updates. I also deployed new operational modules tailored to healthcare workflows, reducing system downtime by 20%.', 
 '2022-06-01', '2022-08-31'),
(1, 'Intel China (Beijing)', 'Backend Development Intern', 
 'Developed enterprise-level backend systems for efficient data exchange.', 
 'At Intel, I contributed to developing robust backend systems for data-driven enterprise solutions. My tasks included designing RESTful APIs using Java and Spring Boot to ensure accurate data exchange and implementing optimized MySQL queries for high-volume transactions.', 
 '2023-01-01', '2023-03-31');

-- Insert skills
INSERT INTO skills (user_id, category, skill_name)
VALUES 
(1, 'Programming', 'Python - I appreciate its simplicity and versatility, especially in automating tasks and handling data processing efficiently.'),
(1, 'Programming', 'Java - A language that taught me the importance of robustness and scalability in software design.'),
(1, 'Web Development', 'HTML - The backbone of web development, allowing me to structure web pages quickly and effectively.'),
(1, 'Web Development', 'CSS - A tool that enables me to enhance user experience by creating visually appealing and responsive designs.'),
(1, 'Data Management', 'MySQL - A database I rely on for its straightforward syntax and reliability in managing complex queries and large datasets.'),
(1, 'Deep Learning', 'Machine Learning Algorithms - These methods help me uncover patterns and build intelligent models that address real-world problems.'),
(1, 'Data Analysis', 'Scrapy - A framework that makes extracting large-scale data from websites efficient, even for dynamically loaded content.'),
(1, 'Data Analysis', 'TF-IDF - A technique I use to extract meaningful features from text, particularly in relevance analysis and search optimization.'),
(1, 'AI Models', 'BERT - A model that transformed how I approach natural language understanding, especially for tasks involving context and semantics.'),
(1, 'Security', 'AES-256 - A robust encryption standard I trust for safeguarding sensitive data in secure applications.'),
(1, 'API Development', 'REST API - I value its simplicity and flexibility, making it ideal for creating scalable and interoperable web services.');

