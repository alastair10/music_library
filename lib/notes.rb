# In the realm of PostgreSQL, we manipulate tables, column names and records. However, in Ruby programs, we represent data using classes, objects and attributes. We therefore need a way to transform the data retrieved from the database into data that can be used in our program.

# To achieve this, you will learn how to build two kind of classes — they're regular Ruby classes, but designed to achieve a specific purpose in our program:

## A MODEL class is used to hold a record's data.
    # For example, if we have a table students, we'd have a class Student, with attributes for each column. A single object holds the data for a specific student record. This class usually doesn't contain any logic, but is only used to hold data.

# A REPOSITORY class implements methods to run SQL queries on the database to retrieve, create, update or delete data.
    # For example, if we have one table students, we'd have a class StudentRepository containing methods that communicates with the database using SQL.

# Here's how these classes would be mapped to a project structure:

# project/
#    app.rb
#    lib/
#       student.rb
#       student_repository.rb
#    spec/
#       student_repository_spec.rb
# And heres an example behaviour for such two classes, StudentRepository and Student:

repository = StudentRepository.new 

all_students = repository.all # Performs a SELECT query and returns an array of Student objects.

new_student = Student.new
new_student.name = 'Josh'
new_student.cohort_name = 'March 22'

repository.create(new_student) # Creates a new student by performing a INSERT query.

# This technique (converting records from a database into objects we use in our program) is also called object-relational mapping.


# STEPS
# 1.  Create the TEST SQL Seeds
#     - updated the seed file with data
#     - created a test database
#     - update test database with data from prod db using 
#       - psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
#       - check to see if db exists by SELECT * FROM artists

# 2. Insert seeds into the test db
#     - psql -h 127.0.0.1 music_library_test < spec/seeds_artists.sql
#     - resets the table and inserts our new data in

# 3. Define the Class names
#     - just renamed the template classes and table name

# 4. Implement the Model class
#     - created the artist.rb file for the class
#     - copied over the class structure from recipe
#     - renamed to Artist class and updated the attributes to match columns in db

# 5. Define the Repository class
#     - update recipe with All method, updating class names and attributes

# 6. Write test examples
#     - start thinking about seed data that we used in our test db
#     - write what you would expect to see in test db (we inserted 2 records so we expect to see those two in the tests.)
#     - then create new spec file for class and copy in your example
#       - artist_repository_spec.rb
#       - convert the tests to rspec language expect(xxx) etc.
#     - include the helper method from the Recipe file 
#       - this resets the db every time you run it 

# 7. RSPEC to TDD
#     - likely need to now build the ArtistRepo Class in a new file and add the All method
#       - will then need to add the other methods 

# 8. Go in and change the app.rb file
# 
