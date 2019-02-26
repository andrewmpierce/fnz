# fnz
## *A Ruby web framework, just for funsies*

### About fnz
fnz is a web framework I'm building to help better understand how web 
frameworks work and strengthen my understanding of the web and web 
applications. 

At completion, it will consist of a basic HTTP server, a routing layer, 
database connection with the ability to run migrations and SQL on the fly,
a basic templating language, and maybe a very lightweight ORM. 

### How do you use fnz?  
Eventually fnz will be packaged as a gem which you can get by running
`gem install fnz`

`fnz new project_name` will do the following
1. Create a routes.rb file
2. Create a Postgres database with your project name.
3. Create a migrations folder
4. Create a folder for your template/html files. 


`fnz serve -p $PORT` will start your webserver at the specified port, 
the default is port 2000. 

### Routing
Creating a new fnz project will create a routes.rb file. 

```
get /
render public/index.html
```

```
get /users
render templates/users/index.html
```

```
post /user/1
handle post request
```

### Migrations

`fnz make_migration` will create a new timestamped migration file in your 
migrations folder. It will only accept raw SQL. 

`fnz migrate` will execute all the pending migration files, in timestamped
order. 



