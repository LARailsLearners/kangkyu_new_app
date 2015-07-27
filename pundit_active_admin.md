[ActiveAdmin](https://github.com/activeadmin/activeadmin)
```
gem 'activeadmin', github: 'activeadmin'
```

[documentation.html](http://activeadmin.info/docs/documentation.html)
[setting-up-active-admin](http://activeadmin.info/docs/0-installation.html#setting-up-active-admin)

###active_admin_01
```
rails generate active_admin:install
rails generate active_admin:resource Product
rails generate active_admin:resource User
```

```
create_table :active_admin_comments
create_table :admin_users
```

Visit http://localhost:3000/admin and log in using:

User: admin@example.com  
Password: password  


###active_admin_02
```
rails generate active_admin:install User
```

```
create_table :active_admin_comments
```

```
User.create!({:email => "admin@example.com", :role => "admin", :password => "password", :password_confirmation => "password" })
```

(using existing "users" table and "User" model for admin_user) may need create admin user from console [create-a-devise-user-from-ruby-console](http://stackoverflow.com/questions/4316940/create-a-devise-user-from-ruby-console)


