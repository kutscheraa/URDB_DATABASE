
# Relational database class project

**MySQL To-do list database**

![](https://github.com/kutscheraa/TO-DO-LIST_DATABASE/blob/main/databaseerd.png)
  
Naimportujeme námi vytvořené komponenty do `app.py` a přidáme do layoutu. Celý kód vypadá takto.
<details>
  <summary>KOMPLETNÍ KOD</summary>
  
```python
# app.py

from dash import Dash, dcc
import dash_bootstrap_components as dbc
import dash
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
# from db import *

app = Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP, dbc.icons.FONT_AWESOME],
	   suppress_callback_exceptions=True, prevent_initial_callbacks=True)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
server = app.server

############################################################################################
# Import shared components

from assets.footer import _footer
from assets.nav import _nav

############################################################################################
# App Layout
app.layout = dbc.Container([
	dbc.Row([
        dbc.Col([_nav], width = 2),
        dbc.Col([
            dbc.Row([dash.page_container])
	    ], width = 10),
    ]),
    dbc.Row([
        dbc.Col([], width = 2),
        dbc.Col([
            dbc.Row([_footer])
	    ], width = 10),
    ]),
], fluid=True)

############################################################################################
# Run App
if __name__ == '__main__':
	app.run_server(debug=True)

```
</details>

## Assignment
Design your own database:
- Choose your own topic and database content (it should not be an example covered in class).
- The database must consist of at least 7 tables connected by relationships.
- Create a Conceptual Database Design, i.e., an Entity-Relationship Diagram (ERD) graphically (use a suitable application for creating ERDs).

2. Implement your own database:
- Choose a suitable relational DBMS according to your consideration (relational or object-relational).
- Create a Physical Database Design using SQL commands to structure the DB.
- Populate the created DB with data - the minimum average number of records per table is 20 (i.e., the total number of records in all tables / the number of tables).
- (For example, 10 tables * 20 records = 200 records in the entire database).

3. Work with the database data:
- Prepare at least 4 SQL commands that will work with the data in your DB and save them for verification during the examination (+ try them out in advance with the data in your DB).
- The prepared SQL commands should include all the commands covered in class, such as the SELECT ... FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY (they don't need to be all in one command), the CREATE VIEW ... AS SELECT ..., etc.
- The prepared SQL commands must involve at least two different types of table joins (JOIN) - meaning you need to join at least 3 tables using 2 different types of joins.
