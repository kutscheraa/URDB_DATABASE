/* příkaz 1 */
CREATE VIEW prumer AS
SELECT categories.name AS kategorie, COUNT(tasks.task_id) AS počet_úkolů, CONCAT(ROUND(AVG(p.value), 1), ' - Zaokrouhleno') AS průměrná_priorita
FROM categories
LEFT JOIN tasks ON categories.category_id = tasks.category_id
INNER JOIN priorities p ON tasks.priority_id = p.priority_id
GROUP BY categories.category_id;

/* příkaz 2 */
SELECT IFNULL(c.name, 'Žádná kategorie') AS nazev_kategorie, IFNULL(t.description, 'Žádný úkol') as úkol,
COUNT(DISTINCT u.user_id) AS počet_uživatelů
FROM categories c
LEFT JOIN tasks t ON c.category_id = t.category_id
RIGHT JOIN users u ON t.user_id = u.user_id OR (t.user_id IS NULL AND c.category_id IS NULL)
GROUP BY nazev_kategorie, úkol
HAVING COUNT(DISTINCT u.user_id) > 0
ORDER BY počet_uživatelů DESC;


/* příkaz 3 */
SELECT u.username AS uživatel, t.description AS úkol
FROM users u
INNER JOIN tasks t ON u.user_id = t.user_id
LEFT JOIN subtasks st ON t.task_id = st.task_id
WHERE t.is_complete = TRUE
AND (st.is_complete = TRUE OR st.is_complete IS NULL);

/*příkaz 4 */
SELECT u.username AS uživatel, tf.file_name AS soubor, t.description AS úkol
FROM users u
INNER JOIN tasks t ON u.user_id = t.user_id
LEFT JOIN task_files tf ON t.task_id = tf.task_id;

/* příkaz 5 */
SELECT u.username AS uživatel, t.description AS úkol, c.name AS kategorie, p.value AS priorita, p.name AS nazev_priority
FROM tasks t
INNER JOIN categories c ON t.category_id = c.category_id
LEFT JOIN priorities p ON t.priority_id = p.priority_id
INNER JOIN users u ON t.user_id = u.user_id
WHERE p.value = 9;
