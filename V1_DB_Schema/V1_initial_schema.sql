-- PostgreSQL database schema for a project management application

-- Tables

-- Projects table
CREATE TABLE projects (
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	description TEXT
);

-- Comments on projects table and its columns
COMMENT ON TABLE projects IS 'Table to store project information';
COMMENT ON COLUMN projects.id IS 'Unique identifier for each project';
COMMENT ON COLUMN projects.title IS 'Title of the project';
COMMENT ON COLUMN projects.description IS 'Detailed description of the project';

-- Categories table
CREATE TABLE categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	project_id INT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
	color VARCHAR(7),
	"order" INT
);

-- Comments on categories table and its columns
COMMENT ON TABLE categories IS 'Table to store category information for tasks';
COMMENT ON COLUMN categories.id IS 'Unique identifier for each category';
COMMENT ON COLUMN categories.name IS 'Name of the category';
COMMENT ON COLUMN categories.project_id IS 'Foreign key referencing the project this category belongs to';
COMMENT ON COLUMN categories.description IS 'Detailed description of the category';
COMMENT ON COLUMN categories.color IS 'Color code for the category (e.g., #FF5733)';
COMMENT ON COLUMN categories."order" IS 'Order of the category for display purposes';

-- Tasks table
CREATE TABLE tasks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	description TEXT,
	project_id INT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
	category_id INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE
);

-- Comments on tasks table and its columns
COMMENT ON TABLE tasks IS 'Table to store task information';
COMMENT ON COLUMN tasks.id IS 'Unique identifier for each task';
COMMENT ON COLUMN tasks.title IS 'Title of the task';
COMMENT ON COLUMN tasks.description IS 'Detailed description of the task';
COMMENT ON COLUMN tasks.project_id IS 'Foreign key referencing the project this task belongs to';
COMMENT ON COLUMN tasks.category_id IS 'Foreign key referencing the category this task belongs to';


