# User Stories
* As a user, i would like to see a list of my saved bookmarks
* As a user, I would like to save a bookmark
* As a user, I would like to delete a bookmark(s)
* As a user, I would like to update a bookmark. By tag, or URL
* As a user, I would like to tag bookmarks into categories
* As a user, I would like to filter my bookmarks by tag
* As a user, I only want write access to my own bookmarks
* As a user, I would like to browse bookmarks other users have added

<img style="diaplay: block; text-align: center; alt='Sequence Diagram'" src="./images/Scanned Document.png" width="400px" />
<img style="diaplay: block; text-align: center; alt='Domain Modelling'" src="./images/Scanned Document-2.png" width="400px" />

# To set up SQL
* Connect to psql
* Create the database using the psql command `CREATE DATABASE bookmark_manager;`
* Connect to the database using the pqsl command \c bookmark_manager;
* Run the query we have saved in the file 01_create_bookmarks_table.sql