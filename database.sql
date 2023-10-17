CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(255),
  password_hash VARCHAR(255)
);

CREATE TABLE priorities (
  priority_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  value INT
);

CREATE TABLE tasks (
  task_id INT AUTO_INCREMENT PRIMARY KEY,
  description TEXT,
  is_complete BOOLEAN,
  due_date TIMESTAMP,
  category_id INT,
  user_id INT,
  priority_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (priority_id) REFERENCES priorities(priority_id)
);

CREATE TABLE task_notes (
  note_id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT,
  user_id INT,
  note TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (task_id) REFERENCES tasks(task_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE task_files (
  file_id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT,
  user_id INT,
  file_name VARCHAR(255),
  file_type VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (task_id) REFERENCES tasks(task_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE reminders (
  reminder_id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT,
  reminder_date TIMESTAMP,
  message TEXT,
  FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

CREATE TABLE subtasks (
  subtask_id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT,
  user_id INT,
  description TEXT,
  is_complete BOOLEAN,
  FOREIGN KEY (task_id) REFERENCES tasks(task_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);






/* možná přidat */
CREATE TABLE permissions (
  permissions_id AUTO_INCREMENT PRIMARY KEY,
  task_id INT,
  user_id INT,
  permission_name TEXT,
  FOREIGN KEY (task_id) REFERENCES tasks(task_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

/* do tasks přidat FOREIGN KEY (permissions_id) REFERENCES permissions (permissions_id) */
/* do task_files, tasks, task_notes přidat created_at */
created_at BOOLEAN