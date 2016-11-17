# README

This is a simple Ruby app to parse the page content and store its content using the Rails framework.

##### To run the application do the following:

1. Clone this repo.
2. Run `bundle install`.
3. Create a database with the username `lim_development` and provide the password of your choice.
4. Run `rake db:create` to create a database.
5. Run `rake db:migrate` to populate the tables in db.
6. Run `rails s` to start a rails server.

## API End points

1. Endpoint to receive the URL of the page, grab its content.

	URL : http://localhost:3000/scrap?url=http://www.example.com
	METHOD : GET

2. Endpont to list the urls and content stored in the database

	URL : http://localhost:3000/list
	METHOD : GET



