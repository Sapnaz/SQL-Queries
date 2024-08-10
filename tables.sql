CREATE DATABASE Friday;
USE Friday;

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(100),
    password_hash VARCHAR(255),
    signup_date DATE,
    last_login TIMESTAMP,
    status VARCHAR(20),
    role VARCHAR(50),
    profile_id INT UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

CREATE TABLE Profile (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    bio TEXT,
    website_url VARCHAR(100),
    profile_picture_url VARCHAR(100),
    twitter_handle VARCHAR(50),
    linkedin_profile VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Table with One-to-Many relationship (Department and Instructor)
CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100),
    location VARCHAR(100),
    head_of_department VARCHAR(100),
    contact_email VARCHAR(100),
    phone_number VARCHAR(15),
    established_year INT,
    faculty_count INT,
    student_count INT,
    building_name VARCHAR(50),
    office_number VARCHAR(20)
);

CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    office_location VARCHAR(100),
    specialization VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    course_count INT,
    CONSTRAINT fk_instructor_department FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- 3. Table with Many-to-One relationship (Student and Course)
CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    credits INT,
    course_description TEXT,
    syllabus_url VARCHAR(100),
    course_start_date DATE,
    course_end_date DATE,
    total_enrolled INT,
    passing_grade VARCHAR(5),
    course_material_url VARCHAR(100),
    max_students INT
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    enrollment_date DATE,
    graduation_date DATE,
    major VARCHAR(100),
    gpa DECIMAL(3, 2),
    course_id INT,
    advisor_name VARCHAR(50),
    CONSTRAINT fk_student_course FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- 4. Table with Many-to-Many relationship (Student and Course through Enrollment)
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    semester VARCHAR(50),
    grade VARCHAR(5),
    enrollment_date DATE,
    completion_date DATE,
    is_active BOOLEAN,
    feedback TEXT,
    attendance_rate DECIMAL(5, 2),
    grade_point DECIMAL(4, 2),
    CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id) REFERENCES Student(student_id),
    CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    building_name VARCHAR(100),
    capacity INT,
    has_projector BOOLEAN,
    has_whiteboard BOOLEAN,
    has_ac BOOLEAN,
    is_lab BOOLEAN,
    availability_status VARCHAR(20),
    schedule_url VARCHAR(100),
    last_maintenance_date DATE
);

CREATE TABLE Library (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    author VARCHAR(100),
    publisher VARCHAR(100),
    year_published INT,
    isbn VARCHAR(20),
    genre VARCHAR(50),
    availability_status VARCHAR(20),
    shelf_location VARCHAR(20),
    pages INT,
    added_date DATE
);

CREATE TABLE Exam (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(100),
    course_id INT,
    exam_date DATE,
    duration_minutes INT,
    total_marks INT,
    pass_marks INT,
    exam_location VARCHAR(100),
    exam_type VARCHAR(50),
    syllabus_covered TEXT,
    instructor_id INT,
    CONSTRAINT fk_exam_course FOREIGN KEY (course_id) REFERENCES Course(course_id),
    CONSTRAINT fk_exam_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

INSERT INTO Profile (first_name, last_name, age, gender, bio, website_url, profile_picture_url, twitter_handle, linkedin_profile) 
VALUES 
('John', 'Doe', 30, 'Male', 'Loves coding', 'http://johndoe.com', 'http://johndoe.com/profile.jpg', '@johndoe', 'http://linkedin.com/in/johndoe'), 
('Jane', 'Doe', 28, 'Female', 'Data Scientist', 'http://janedoe.com', 'http://janedoe.com/profile.jpg', '@janedoe', 'http://linkedin.com/in/janedoe'),
('Mike', 'Smith', 35, 'Male', 'Web Developer', 'http://mikesmith.com', 'http://mikesmith.com/profile.jpg', '@mikesmith', 'http://linkedin.com/in/mikesmith'), 
('Emily', 'Johnson', 40, 'Female', 'Project Manager', 'http://emilyjohnson.com', 'http://emilyjohnson.com/profile.jpg', '@emilyjohnson', 'http://linkedin.com/in/emilyjohnson'),
('Alex', 'Brown', 25, 'Male', 'Software Engineer', 'http://alexbrown.com', 'http://alexbrown.com/profile.jpg', '@alexbrown', 'http://linkedin.com/in/alexbrown'),
('Chris', 'Davis', 29, 'Male', 'UX Designer', 'http://chrisdavis.com', 'http://chrisdavis.com/profile.jpg', '@chrisdavis', 'http://linkedin.com/in/chrisdavis'),
('Patricia', 'Garcia', 32, 'Female', 'System Administrator', 'http://patriciagarcia.com', 'http://patriciagarcia.com/profile.jpg', '@patriciagarcia', 'http://linkedin.com/in/patriciagarcia'),
('Robert', 'Miller', 45, 'Male', 'Data Engineer', 'http://robertmiller.com', 'http://robertmiller.com/profile.jpg', '@robertmiller', 'http://linkedin.com/in/robertmiller'),
('Linda', 'Martinez', 26, 'Female', 'QA Tester', 'http://lindamartinez.com', 'http://lindamartinez.com/profile.jpg', '@lindamartinez', 'http://linkedin.com/in/lindamartinez'),
('Michael', 'Anderson', 33, 'Male', 'DevOps Engineer', 'http://michaelanderson.com', 'http://michaelanderson.com/profile.jpg', '@michaelanderson', 'http://linkedin.com/in/michaelanderson'),
('David', 'Taylor', 38, 'Male', 'Business Analyst', 'http://davidtaylor.com', 'http://davidtaylor.com/profile.jpg', '@davidtaylor', 'http://linkedin.com/in/davidtaylor'),
('Barbara', 'Moore', 27, 'Female', 'Product Owner', 'http://barbaramoore.com', 'http://barbaramoore.com/profile.jpg', '@barbaramoore', 'http://linkedin.com/in/barbaramoore'),
('William', 'Harris', 41, 'Male', 'Cloud Architect', 'http://williamharris.com', 'http://williamharris.com/profile.jpg', '@williamharris', 'http://linkedin.com/in/williamharris'),
('Elizabeth', 'Clark', 31, 'Female', 'AI Specialist', 'http://elizabethclark.com', 'http://elizabethclark.com/profile.jpg', '@elizabethclark', 'http://linkedin.com/in/elizabethclark'),
('Joseph', 'Lewis', 34, 'Male', 'Backend Developer', 'http://josephlewis.com', 'http://josephlewis.com/profile.jpg', '@josephlewis', 'http://linkedin.com/in/josephlewis'),
('Mary', 'Robinson', 42, 'Female', 'Tech Lead', 'http://maryrobinson.com', 'http://maryrobinson.com/profile.jpg', '@maryrobinson', 'http://linkedin.com/in/maryrobinson'),
('Thomas', 'Walker', 28, 'Male', 'Full Stack Developer', 'http://thomaswalker.com', 'http://thomaswalker.com/profile.jpg', '@thomaswalker', 'http://linkedin.com/in/thomaswalker'),
('Margaret', 'Hall', 36, 'Female', 'Cybersecurity Analyst', 'http://margarethall.com', 'http://margarethall.com/profile.jpg', '@margarethall', 'http://linkedin.com/in/margarethall'),
('Charles', 'Young', 39, 'Male', 'Mobile Developer', 'http://charlesyoung.com', 'http://charlesyoung.com/profile.jpg', '@charlesyoung', 'http://linkedin.com/in/charlesyoung'),
('Susan', 'Allen', 30, 'Female', 'Blockchain Developer', 'http://susanallen.com', 'http://susanallen.com/profile.jpg', '@susanallen', 'http://linkedin.com/in/susanallen');

USE friday;

INSERT INTO Classroom (room_number, building_name, capacity, has_projector, has_whiteboard, has_ac, is_lab, availability_status, schedule_url, last_maintenance_date)
VALUES
('A101', 'Science Building', 30, TRUE, TRUE, FALSE, FALSE, 'Available', 'http://example.com/schedule/A101', '2024-01-15'),
('B202', 'Engineering Hall', 50, TRUE, TRUE, TRUE, TRUE, 'Occupied', 'http://example.com/schedule/B202', '2024-02-20'),
('C303', 'Arts Center', 25, FALSE, TRUE, FALSE, FALSE, 'Available', 'http://example.com/schedule/C303', '2024-03-10'),
('D404', 'Business School', 45, TRUE, TRUE, TRUE, FALSE, 'Under Maintenance', 'http://example.com/schedule/D404', '2024-04-05'),
('E505', 'Law Building', 35, FALSE, FALSE, TRUE, FALSE, 'Available', 'http://example.com/schedule/E505', '2024-05-12'),
('F606', 'Medical Center', 40, TRUE, TRUE, TRUE, TRUE, 'Occupied', 'http://example.com/schedule/F606', '2024-06-18'),
('G707', 'Math Building', 20, FALSE, TRUE, FALSE, FALSE, 'Available', 'http://example.com/schedule/G707', '2024-07-23'),
('H808', 'Physics Lab', 30, TRUE, TRUE, FALSE, TRUE, 'Occupied', 'http://example.com/schedule/H808', '2024-08-30'),
('I909', 'Chemistry Lab', 25, TRUE, TRUE, TRUE, TRUE, 'Available', 'http://example.com/schedule/I909', '2024-09-14'),
('J010', 'Library', 60, FALSE, FALSE, TRUE, FALSE, 'Available', 'http://example.com/schedule/J010', '2024-10-20'),
('K111', 'Sports Complex', 100, FALSE, FALSE, TRUE, FALSE, 'Occupied', 'http://example.com/schedule/K111', '2024-11-02'),
('L212', 'Computer Lab', 35, TRUE, TRUE, TRUE, TRUE, 'Available', 'http://example.com/schedule/L212', '2024-12-18'),
('M313', 'Auditorium', 150, TRUE, TRUE, TRUE, FALSE, 'Available', 'http://example.com/schedule/M313', '2024-12-31'),
('N414', 'Biology Lab', 20, TRUE, TRUE, TRUE, TRUE, 'Under Maintenance', 'http://example.com/schedule/N414', '2024-01-07'),
('O515', 'Engineering Lab', 50, TRUE, TRUE, TRUE, TRUE, 'Occupied', 'http://example.com/schedule/O515', '2024-01-18'),
('P616', 'Lecture Hall', 80, TRUE, TRUE, TRUE, FALSE, 'Available', 'http://example.com/schedule/P616', '2024-02-12'),
('Q717', 'Fine Arts Studio', 15, FALSE, TRUE, FALSE, FALSE, 'Available', 'http://example.com/schedule/Q717', '2024-03-21'),
('R818', 'Lecture Hall', 75, TRUE, TRUE, TRUE, FALSE, 'Occupied', 'http://example.com/schedule/R818', '2024-04-10'),
('S919', 'Physics Lab', 25, TRUE, TRUE, TRUE, TRUE, 'Available', 'http://example.com/schedule/S919', '2024-05-19'),
('T020', 'Chemistry Lab', 30, TRUE, TRUE, TRUE, TRUE, 'Under Maintenance', 'http://example.com/schedule/T020', '2024-06-27'),
('U121', 'Language Lab', 20, TRUE, TRUE, TRUE, FALSE, 'Available', 'http://example.com/schedule/U121', '2024-07-15');

INSERT INTO Course (course_name, credits, course_description, syllabus_url, course_start_date, course_end_date, total_enrolled, passing_grade, course_material_url, max_students)
VALUES
('Introduction to Computer Science', 4, 'Basic concepts of computer science, including algorithms, data structures, and programming.', 'http://example.com/syllabus/cs101', '2024-09-01', '2024-12-15', 150, 'C', 'http://example.com/materials/cs101', 200),
('Calculus I', 3, 'Differential and integral calculus of one variable.', 'http://example.com/syllabus/math101', '2024-09-01', '2024-12-15', 100, 'C', 'http://example.com/materials/math101', 120),
('General Chemistry', 4, 'Introduction to the principles of chemistry, including atomic structure, bonding, and reactions.', 'http://example.com/syllabus/chem101', '2024-09-01', '2024-12-15', 80, 'C', 'http://example.com/materials/chem101', 100),
('World History', 3, 'A survey of global historical events and movements from ancient to modern times.', 'http://example.com/syllabus/hist101', '2024-09-01', '2024-12-15', 60, 'C', 'http://example.com/materials/hist101', 80),
('Introduction to Psychology', 3, 'Overview of the major concepts, theories, and research in psychology.', 'http://example.com/syllabus/psy101', '2024-09-01', '2024-12-15', 200, 'C', 'http://example.com/materials/psy101', 220),
('Physics I: Mechanics', 4, 'Fundamentals of classical mechanics, including motion, forces, and energy.', 'http://example.com/syllabus/phys101', '2024-09-01', '2024-12-15', 120, 'C', 'http://example.com/materials/phys101', 140),
('English Composition', 3, 'Development of writing skills, with emphasis on expository and argumentative essays.', 'http://example.com/syllabus/eng101', '2024-09-01', '2024-12-15', 180, 'C', 'http://example.com/materials/eng101', 200),
('Biology I', 4, 'Introduction to the principles of biology, including cell structure, genetics, and evolution.', 'http://example.com/syllabus/bio101', '2024-09-01', '2024-12-15', 110, 'C', 'http://example.com/materials/bio101', 130),
('Introduction to Sociology', 3, 'Study of society, social institutions, and social relationships.', 'http://example.com/syllabus/soc101', '2024-09-01', '2024-12-15', 140, 'C', 'http://example.com/materials/soc101', 160),
('Microeconomics', 3, 'Analysis of the behavior of individuals and firms in making decisions regarding the allocation of resources.', 'http://example.com/syllabus/econ101', '2024-09-01', '2024-12-15', 130, 'C', 'http://example.com/materials/econ101', 150),
('Introduction to Philosophy', 3, 'Exploration of fundamental philosophical questions and concepts.', 'http://example.com/syllabus/phil101', '2024-09-01', '2024-12-15', 70, 'C', 'http://example.com/materials/phil101', 90),
('Linear Algebra', 3, 'Introduction to vector spaces, linear transformations, and matrices.', 'http://example.com/syllabus/math201', '2024-09-01', '2024-12-15', 50, 'C', 'http://example.com/materials/math201', 70),
('Organic Chemistry I', 4, 'Study of the structure, properties, and reactions of organic compounds.', 'http://example.com/syllabus/chem201', '2024-09-01', '2024-12-15', 90, 'C', 'http://example.com/materials/chem201', 110),
('Macroeconomics', 3, 'Examination of the economy as a whole, including inflation, unemployment, and economic growth.', 'http://example.com/syllabus/econ201', '2024-09-01', '2024-12-15', 80, 'C', 'http://example.com/materials/econ201', 100),
('Art History I', 3, 'Survey of the history of art from prehistory to the Renaissance.', 'http://example.com/syllabus/arth101', '2024-09-01', '2024-12-15', 60, 'C', 'http://example.com/materials/arth101', 80),
('Introduction to Programming', 4, 'Basic programming concepts using a high-level programming language.', 'http://example.com/syllabus/cs102', '2024-09-01', '2024-12-15', 160, 'C', 'http://example.com/materials/cs102', 180),
('Environmental Science', 4, 'Introduction to environmental issues and the science behind them.', 'http://example.com/syllabus/envs101', '2024-09-01', '2024-12-15', 70, 'C', 'http://example.com/materials/envs101', 90),
('Human Anatomy', 4, 'Study of the structure and function of the human body.', 'http://example.com/syllabus/anat101', '2024-09-01', '2024-12-15', 80, 'C', 'http://example.com/materials/anat101', 100),
('Discrete Mathematics', 3, 'Introduction to discrete mathematical structures and their applications.', 'http://example.com/syllabus/math301', '2024-09-01', '2024-12-15', 90, 'C', 'http://example.com/materials/math301', 110),
('Business Management', 3, 'Overview of the principles and practices of business management.', 'http://example.com/syllabus/mgmt101', '2024-09-01', '2024-12-15', 100, 'C', 'http://example.com/materials/mgmt101', 120);

INSERT INTO Department (department_name, location, head_of_department, contact_email, phone_number, established_year, faculty_count, student_count, building_name, office_number)
VALUES
('Computer Science', 'North Campus', 'Dr. Alice Smith', 'cs@university.edu', '555-1234', 1985, 40, 500, 'Engineering Hall', 'A101'),
('Mathematics', 'West Campus', 'Dr. John Doe', 'math@university.edu', '555-5678', 1975, 30, 300, 'Math Building', 'B202'),
('Chemistry', 'East Campus', 'Dr. Jane Johnson', 'chem@university.edu', '555-8765', 1980, 25, 250, 'Science Building', 'C303'),
('Physics', 'North Campus', 'Dr. Richard Roe', 'physics@university.edu', '555-4321', 1965, 35, 400, 'Physics Lab', 'D404'),
('Biology', 'East Campus', 'Dr. Emily Davis', 'bio@university.edu', '555-1235', 1990, 28, 350, 'Life Sciences Center', 'E505'),
('History', 'South Campus', 'Dr. Charles Lee', 'history@university.edu', '555-5679', 1970, 20, 200, 'Humanities Building', 'F606'),
('Psychology', 'West Campus', 'Dr. Susan Taylor', 'psych@university.edu', '555-8764', 1982, 22, 250, 'Social Sciences Hall', 'G707'),
('English', 'South Campus', 'Dr. William Brown', 'english@university.edu', '555-4320', 1955, 25, 300, 'Liberal Arts Building', 'H808'),
('Sociology', 'West Campus', 'Dr. Angela Green', 'sociology@university.edu', '555-1236', 1978, 18, 150, 'Social Sciences Hall', 'I909'),
('Economics', 'North Campus', 'Dr. Michael White', 'economics@university.edu', '555-5677', 1988, 24, 300, 'Business School', 'J010'),
('Philosophy', 'South Campus', 'Dr. Sarah Black', 'philosophy@university.edu', '555-8763', 1960, 12, 100, 'Humanities Building', 'K111'),
('Art History', 'West Campus', 'Dr. Gregory Hall', 'arthistory@university.edu', '555-4322', 1973, 10, 80, 'Arts Center', 'L212'),
('Environmental Science', 'North Campus', 'Dr. Margaret King', 'envscience@university.edu', '555-1237', 1995, 15, 120, 'Science Building', 'M313'),
('Business Administration', 'East Campus', 'Dr. Robert Adams', 'business@university.edu', '555-5676', 1987, 30, 350, 'Business School', 'N414'),
('Engineering', 'North Campus', 'Dr. James Nelson', 'engineering@university.edu', '555-8762', 1968, 50, 600, 'Engineering Hall', 'O515'),
('Law', 'South Campus', 'Dr. Jennifer Moore', 'law@university.edu', '555-4323', 1945, 18, 150, 'Law Building', 'P616'),
('Medical Sciences', 'East Campus', 'Dr. Patricia Scott', 'medsci@university.edu', '555-1238', 1992, 45, 500, 'Medical Center', 'Q717'),
('Fine Arts', 'West Campus', 'Dr. Thomas Turner', 'finearts@university.edu', '555-5675', 1979, 20, 180, 'Arts Center', 'R818'),
('Education', 'South Campus', 'Dr. Mary Brown', 'education@university.edu', '555-8761', 1984, 22, 250, 'Education Building', 'S919'),
('Political Science', 'North Campus', 'Dr. Daniel Wilson', 'polisci@university.edu', '555-4324', 1972, 18, 200, 'Social Sciences Hall', 'T020');

INSERT INTO Enrollment (student_id, course_id, semester, grade, enrollment_date, completion_date, is_active, feedback, attendance_rate, grade_point)
VALUES
(1, 1, 'Fall 2024', 'A', '2024-09-01', '2024-12-15', FALSE, 'Excellent performance.', 95.50, 4.00),
(2, 2, 'Fall 2024', 'B+', '2024-09-01', '2024-12-15', FALSE, 'Good understanding of material.', 88.00, 3.50),
(3, 3, 'Fall 2024', 'C', '2024-09-01', '2024-12-15', FALSE, 'Needs improvement in lab work.', 75.00, 2.00),
(4, 4, 'Fall 2024', 'A-', '2024-09-01', '2024-12-15', FALSE, 'Strong analytical skills.', 92.00, 3.70),
(5, 5, 'Fall 2024', 'B', '2024-09-01', '2024-12-15', FALSE, 'Participated well in class.', 85.00, 3.00),
(6, 6, 'Fall 2024', 'A+', '2024-09-01', '2024-12-15', FALSE, 'Outstanding performance.', 98.00, 4.00),
(7, 7, 'Fall 2024', 'B-', '2024-09-01', '2024-12-15', FALSE, 'Good writing skills.', 82.00, 2.70),
(8, 8, 'Fall 2024', 'C+', '2024-09-01', '2024-12-15', FALSE, 'Needs to improve on assignments.', 78.00, 2.30),
(9, 9, 'Fall 2024', 'B+', '2024-09-01', '2024-12-15', FALSE, 'Active class participation.', 87.50, 3.50),
(10, 10, 'Fall 2024', 'A', '2024-09-01', '2024-12-15', FALSE, 'Excellent understanding of concepts.', 93.00, 4.00),
(11, 11, 'Fall 2024', 'B+', '2024-09-01', '2024-12-15', FALSE, 'Good grasp of philosophical ideas.', 88.00, 3.50),
(12, 12, 'Fall 2024', 'A-', '2024-09-01', '2024-12-15', FALSE, 'Solid mathematical skills.', 91.00, 3.70),
(13, 13, 'Fall 2024', 'C', '2024-09-01', '2024-12-15', FALSE, 'Struggled with organic chemistry.', 74.00, 2.00),
(14, 14, 'Fall 2024', 'A+', '2024-09-01', '2024-12-15', FALSE, 'Excellent understanding of macroeconomic principles.', 97.00, 4.00),
(15, 15, 'Fall 2024', 'B', '2024-09-01', '2024-12-15', FALSE, 'Good artistic analysis.', 85.50, 3.00),
(16, 16, 'Fall 2024', 'A', '2024-09-01', '2024-12-15', FALSE, 'Strong programming skills.', 94.00, 4.00),
(17, 17, 'Fall 2024', 'B-', '2024-09-01', '2024-12-15', FALSE, 'Needs to improve environmental knowledge.', 81.00, 2.70),
(18, 18, 'Fall 2024', 'A-', '2024-09-01', '2024-12-15', FALSE, 'Good understanding of human anatomy.', 90.00, 3.70),
(19, 19, 'Fall 2024', 'C+', '2024-09-01', '2024-12-15', FALSE, 'Needs better attendance.', 77.00, 2.30),
(20, 20, 'Fall 2024', 'B+', '2024-09-01', '2024-12-15', FALSE, 'Good grasp of business management principles.', 86.50, 3.50);



INSERT INTO Instructor (first_name, last_name, hire_date, email, phone_number, office_location, specialization, salary, department_id, course_count)
VALUES
('John', 'Doe', '2015-03-12', 'john.doe@example.com', '555-1234', 'Room 201', 'Computer Science', 80000.00, 1, 5),
('Jane', 'Smith', '2016-07-22', 'jane.smith@example.com', '555-5678', 'Room 202', 'Mathematics', 85000.00, 2, 4),
('Emily', 'Johnson', '2017-01-10', 'emily.johnson@example.com', '555-8765', 'Room 303', 'Physics', 90000.00, 3, 6),
('Michael', 'Williams', '2018-05-15', 'michael.williams@example.com', '555-4321', 'Room 304', 'Chemistry', 88000.00, 4, 3),
('Linda', 'Brown', '2019-09-01', 'linda.brown@example.com', '555-6789', 'Room 405', 'Biology', 92000.00, 5, 7),
('David', 'Jones', '2020-02-20', 'david.jones@example.com', '555-1357', 'Room 406', 'Engineering', 95000.00, 6, 8),
('Sophia', 'Garcia', '2021-08-30', 'sophia.garcia@example.com', '555-2468', 'Room 507', 'Economics', 87000.00, 7, 4),
('James', 'Martinez', '2022-06-14', 'james.martinez@example.com', '555-3579', 'Room 508', 'History', 83000.00, 8, 2),
('Olivia', 'Hernandez', '2023-03-25', 'olivia.hernandez@example.com', '555-4680', 'Room 609', 'Literature', 88000.00, 9, 5),
('William', 'Lee', '2014-11-05', 'william.lee@example.com', '555-5791', 'Room 610', 'Philosophy', 91000.00, 10, 3),
('Isabella', 'Wilson', '2015-10-12', 'isabella.wilson@example.com', '555-6802', 'Room 711', 'Political Science', 86000.00, 1, 6),
('Benjamin', 'Anderson', '2016-04-22', 'benjamin.anderson@example.com', '555-7913', 'Room 712', 'Geology', 87000.00, 2, 4),
('Mia', 'Thomas', '2017-12-11', 'mia.thomas@example.com', '555-8024', 'Room 813', 'Astronomy', 92000.00, 3, 5),
('Ethan', 'Taylor', '2018-09-05', 'ethan.taylor@example.com', '555-9135', 'Room 814', 'Psychology', 86000.00, 4, 7),
('Ava', 'Moore', '2019-05-16', 'ava.moore@example.com', '555-0246', 'Room 915', 'Sociology', 88000.00, 5, 3),
('Alexander', 'Jackson', '2020-07-29', 'alexander.jackson@example.com', '555-1358', 'Room 916', 'Music', 87000.00, 6, 4),
('Charlotte', 'White', '2021-10-19', 'charlotte.white@example.com', '555-2469', 'Room 1017', 'Art', 85000.00, 7, 2),
('Daniel', 'Harris', '2022-12-01', 'daniel.harris@example.com', '555-3570', 'Room 1018', 'Theater', 88000.00, 8, 5),
('Ella', 'Clark', '2023-01-15', 'ella.clark@example.com', '555-4681', 'Room 1119', 'Dance', 90000.00, 9, 6),
('Matthew', 'Lewis', '2024-04-30', 'matthew.lewis@example.com', '555-5792', 'Room 1120', 'Creative Writing', 91000.00, 10, 4);

INSERT INTO Library (title, author, publisher, year_published, isbn, genre, availability_status, shelf_location, pages, added_date)
VALUES
('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 1960, '9780060935467', 'Fiction', 'Available', 'A1', 281, '2024-01-15'),
('1984', 'George Orwell', 'Secker & Warburg', 1949, '9780451524935', 'Dystopian', 'Checked Out', 'B2', 328, '2024-01-16'),
('Moby Dick', 'Herman Melville', 'Richard Bentley', 1851, '9781503280786', 'Classic', 'Available', 'C3', 635, '2024-01-17'),
('Pride and Prejudice', 'Jane Austen', 'T. Egerton', 1813, '9781503290563', 'Romance', 'Available', 'D4', 279, '2024-01-18'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons', 1925, '9780743273565', 'Classic', 'Available', 'E5', 180, '2024-01-19'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, '9780316769488', 'Fiction', 'Checked Out', 'F6', 277, '2024-01-20'),
('Brave New World', 'Aldous Huxley', 'Chatto & Windus', 1932, '9780060850524', 'Dystopian', 'Available', 'G7', 268, '2024-01-21'),
('The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', 1937, '9780345339683', 'Fantasy', 'Available', 'H8', 310, '2024-01-22'),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Bloomsbury', 1997, '9780747532699', 'Fantasy', 'Checked Out', 'I9', 309, '2024-01-23'),
('The Da Vinci Code', 'Dan Brown', 'Doubleday', 2003, '9780385504201', 'Thriller', 'Available', 'J10', 454, '2024-01-24'),
('The Shining', 'Stephen King', 'Doubleday', 1977, '9780307743657', 'Horror', 'Available', 'K11', 447, '2024-01-25'),
('The Alchemist', 'Paulo Coelho', 'HarperOne', 1988, '9780062315007', 'Adventure', 'Checked Out', 'L12', 208, '2024-01-26'),
('Wuthering Heights', 'Emily Brontë', 'Thomas Cautley Newby', 1847, '9781853260019', 'Classic', 'Available', 'M13', 416, '2024-01-27'),
('Jane Eyre', 'Charlotte Brontë', 'Smith, Elder & Co.', 1847, '9780486277868', 'Classic', 'Checked Out', 'N14', 500, '2024-01-28'),
('Little Women', 'Louisa May Alcott', 'Roberts Brothers', 1868, '9780147514017', 'Fiction', 'Available', 'O15', 449, '2024-01-29'),
('Gone with the Wind', 'Margaret Mitchell', 'Macmillan', 1936, '9781451635621', 'Historical Fiction', 'Available', 'P16', 1037, '2024-01-30'),
('Catch-22', 'Joseph Heller', 'Simon & Schuster', 1961, '9781451686654', 'Satire', 'Checked Out', 'Q17', 453, '2024-01-31'),
('Lord of the Flies', 'William Golding', 'Faber and Faber', 1954, '9780399501487', 'Fiction', 'Available', 'R18', 224, '2024-02-01'),
('The Chronicles of Narnia', 'C.S. Lewis', 'Geoffrey Bles', 1950, '9780064471190', 'Fantasy', 'Available', 'S19', 767, '2024-02-02'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Norstedts Förlag', 2005, '9780307473479', 'Mystery', 'Checked Out', 'T20', 465, '2024-02-03');

INSERT INTO Student (first_name, last_name, email, phone_number, enrollment_date, graduation_date, major, gpa, course_id, advisor_name)
VALUES
('Alice', 'Smith', 'alice.smith@example.com', '555-1111', '2022-09-01', '2026-05-15', 'Computer Science', 3.85, 1, 'Dr. John Doe'),
('Bob', 'Johnson', 'bob.johnson@example.com', '555-2222', '2022-09-01', '2026-05-15', 'Mathematics', 3.70, 2, 'Dr. Jane Smith'),
('Carol', 'Williams', 'carol.williams@example.com', '555-3333', '2022-09-01', '2026-05-15', 'Physics', 3.90, 3, 'Dr. Emily Brown'),
('David', 'Jones', 'david.jones@example.com', '555-4444', '2022-09-01', '2026-05-15', 'Chemistry', 3.60, 4, 'Dr. Michael White'),
('Eva', 'Brown', 'eva.brown@example.com', '555-5555', '2022-09-01', '2026-05-15', 'Biology', 3.75, 5, 'Dr. Linda Green'),
('Frank', 'Davis', 'frank.davis@example.com', '555-6666', '2022-09-01', '2026-05-15', 'Engineering', 3.80, 6, 'Dr. David Miller'),
('Grace', 'Miller', 'grace.miller@example.com', '555-7777', '2022-09-01', '2026-05-15', 'Economics', 3.65, 7, 'Dr. Sophia Lee'),
('Henry', 'Wilson', 'henry.wilson@example.com', '555-8888', '2022-09-01', '2026-05-15', 'History', 3.55, 8, 'Dr. James Wilson'),
('Ivy', 'Moore', 'ivy.moore@example.com', '555-9999', '2022-09-01', '2026-05-15', 'Literature', 3.80, 9, 'Dr. Olivia Taylor'),
('Jack', 'Taylor', 'jack.taylor@example.com', '555-1010', '2022-09-01', '2026-05-15', 'Philosophy', 3.95, 10, 'Dr. William Anderson'),
('Karen', 'Anderson', 'karen.anderson@example.com', '555-1112', '2022-09-01', '2026-05-15', 'Political Science', 3.70, 1, 'Dr. Isabella Harris'),
('Larry', 'Thomas', 'larry.thomas@example.com', '555-1213', '2022-09-01', '2026-05-15', 'Geology', 3.65, 2, 'Dr. Benjamin Martinez'),
('Mona', 'Jackson', 'mona.jackson@example.com', '555-1314', '2022-09-01', '2026-05-15', 'Astronomy', 3.85, 3, 'Dr. Mia Robinson'),
('Nina', 'White', 'nina.white@example.com', '555-1415', '2022-09-01', '2026-05-15', 'Psychology', 3.80, 4, 'Dr. Ethan Lewis'),
('Oscar', 'Harris', 'oscar.harris@example.com', '555-1516', '2022-09-01', '2026-05-15', 'Sociology', 3.55, 5, 'Dr. Charlotte Clark'),
('Paula', 'Martin', 'paula.martin@example.com', '555-1617', '2022-09-01', '2026-05-15', 'Music', 3.90, 6, 'Dr. Daniel Walker'),
('Quinn', 'Garcia', 'quinn.garcia@example.com', '555-1718', '2022-09-01', '2026-05-15', 'Art', 3.75, 7, 'Dr. Ava Young'),
('Ryan', 'Robinson', 'ryan.robinson@example.com', '555-1819', '2022-09-01', '2026-05-15', 'Theater', 3.65, 8, 'Dr. Matthew Hall'),
('Sally', 'Lee', 'sally.lee@example.com', '555-1920', '2022-09-01', '2026-05-15', 'Dance', 3.80, 9, 'Dr. Ella King'),
('Tom', 'Walker', 'tom.walker@example.com', '555-2021', '2022-09-01', '2026-05-15', 'Creative Writing', 3.90, 10, 'Dr. Alexander Scott'),
('Uma', 'Perez', 'uma.perez@example.com', '555-2122', '2022-09-01', '2026-05-15', 'Environmental Science', 3.85, 1, 'Dr. Grace Adams');

DESC User;
SELECT * FROM User;
SELECT * FROM Instructor ;

INSERT INTO Instructor (first_name, last_name, hire_date, email, phone_number, office_location, specialization, salary, department_id, course_count)
VALUES
('John', 'Doe', '2020-08-01', 'john.doe@university.edu', '123-456-7890', 'Building A, Room 101', 'Mathematics', 75000.00, 1, 2),
('Jane', 'Smith', '2019-09-15', 'jane.smith@university.edu', '234-567-8901', 'Building B, Room 102', 'Physics', 80000.00, 2, 3),
('Michael', 'Johnson', '2018-10-10', 'michael.johnson@university.edu', '345-678-9012', 'Building C, Room 103', 'Chemistry', 78000.00, 3, 4),
('Emily', 'Williams', '2021-02-12', 'emily.williams@university.edu', '456-789-0123', 'Building D, Room 104', 'Biology', 77000.00, 4, 5),
('James', 'Brown', '2017-03-23', 'james.brown@university.edu', '567-890-1234', 'Building E, Room 105', 'Economics', 82000.00, 5, 3),
('Patricia', 'Davis', '2022-04-15', 'patricia.davis@university.edu', '678-901-2345', 'Building F, Room 106', 'History', 74000.00, 6, 2),
('Robert', 'Miller', '2019-05-20', 'robert.miller@university.edu', '789-012-3456', 'Building G, Room 107', 'Political Science', 86000.00, 7, 4),
('Linda', 'Garcia', '2020-06-11', 'linda.garcia@university.edu', '890-123-4567', 'Building H, Room 108', 'Literature', 75000.00, 8, 3),
('Charles', 'Martinez', '2018-07-01', 'charles.martinez@university.edu', '901-234-5678', 'Building I, Room 109', 'Philosophy', 80000.00, 9, 2),
('Elizabeth', 'Rodriguez', '2021-08-09', 'elizabeth.rodriguez@university.edu', '012-345-6789', 'Building J, Room 110', 'Psychology', 79000.00, 10, 3),
('Christopher', 'Hernandez', '2017-09-14', 'christopher.hernandez@university.edu', '123-456-7890', 'Building K, Room 111', 'Sociology', 76000.00, 11, 4),
('Barbara', 'Lopez', '2019-10-19', 'barbara.lopez@university.edu', '234-567-8901', 'Building L, Room 112', 'Anthropology', 83000.00, 12, 3),
('Paul', 'Gonzales', '2020-11-23', 'paul.gonzales@university.edu', '345-678-9012', 'Building M, Room 113', 'Engineering', 88000.00, 13, 5),
('Karen', 'Wilson', '2021-12-05', 'karen.wilson@university.edu', '456-789-0123', 'Building N, Room 114', 'Art', 72000.00, 14, 2),
('Steven', 'Anderson', '2018-01-15', 'steven.anderson@university.edu', '567-890-1234', 'Building O, Room 115', 'Music', 81000.00, 15, 3),
('Donna', 'Thomas', '2019-02-20', 'donna.thomas@university.edu', '678-901-2345', 'Building P, Room 116', 'Drama', 75000.00, 16, 4),
('George', 'Taylor', '2020-03-25', 'george.taylor@university.edu', '789-012-3456', 'Building Q, Room 117', 'Computer Science', 90000.00, 17, 6),
('Susan', 'Moore', '2021-04-30', 'susan.moore@university.edu', '890-123-4567', 'Building R, Room 118', 'Statistics', 82000.00, 18, 3),
('David', 'Jackson', '2017-05-17', 'david.jackson@university.edu', '901-234-5678', 'Building S, Room 119', 'Environmental Science', 78000.00, 19, 5),
('Nancy', 'Lee', '2019-06-22', 'nancy.lee@university.edu', '012-345-6789', 'Building T, Room 120', 'Law', 87000.00, 20, 4);

UPDATE Enrollment
SET grade = CASE
    WHEN grade_point >= 4.0 THEN 'A'
    WHEN grade_point >= 3.0 THEN 'B'
    WHEN grade_point >= 2.0 THEN 'C'
    WHEN grade_point >= 1.0 THEN 'D'
    ELSE 'F'
END;

SELECT * FROM Student
LIMIT 10 OFFSET 5;
SELECT major, AVG(gpa) AS avg_gpa
FROM Student
GROUP BY major
HAVING AVG(gpa) > 3.0;

SELECT * FROM Course
ORDER BY course_name ASC, credits DESC;




