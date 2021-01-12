# MYSQL_Files

This a collection of exercises and projects completed in a Udemy MYSQL Bootcamp course.


<h3> MYSQLLESSONS Folder </h3>

The MYSQLLessons folder contains an assortment of MYSQL lessons and exercises completed
within the course. The databases that were used were created within a GoormIDE container.

The databases used were:
<br>
<em>book_shop</em> - contains a books and authors table 
<br>
<em>cat_app</em> - contains a cats table filled with different cat's names and ages
<br>
<em>customers_and_orders</em> - contains a customer and orders table
<br>
<em>shirts_db</em> - contains shirts table filled with different shirts and sizes
<br>
<em>tv_review_app</em> - contains series, reviews and reviewer tables that are connected

<h3> InstagramCloneDatabase Folder </h3>

The InstagramCloneDatabase folder contains the MYSQL files for a Instagram clone database.
The schema used for the database is stored within the instagram.sql file. The schema includes
tables that represent users, photos, comments, likes, follows and photo tags. There is also an
instagram_clone_data.sql file that contains sample data that was added to the database to test
it. The instagram.sql file also contains exercises that were used to select specific data within
the database based on real life situations where a someone must find significant data within the 
database.

<h3> JoinUsWebApp Folder </h3>

This folder contains the files for a simple web application. The web application is a website called
Join Us. Node Express was used to create the web application. The website was created locally on 
GoormIDE. The purpose of this website is to connect web applications with our databases. This way we
can retrieve or edit data from a database. The website contains a simple form that takes an email address
given by a user and submits a post request that takes the email and adds it to a user database that tracks
users and the time they registered. The application then goes back to the original webpage. On the webpage
there is also a counter that keeps track of the number of users registered. Once a new user is added to the
database, the counter updates. The folder also contains a add500Users.js file that uses javascript to bulk
add 500 random users into the database. I used a module called faker that creates random emails and past
timestamps. 
