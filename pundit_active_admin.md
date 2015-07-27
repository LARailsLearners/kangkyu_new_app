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


###active_admin_03
```
➜ 2.2.2 new_app (active_admin_03) ✔ rails g active_admin:install --skip-users
      create  config/initializers/active_admin.rb
      create  app/admin
      create  app/admin/dashboard.rb
       route  ActiveAdmin.routes(self)
    generate  active_admin:assets
      create  app/assets/javascripts/active_admin.js.coffee
      create  app/assets/stylesheets/active_admin.css.scss
      create  db/migrate/20150727230646_create_active_admin_comments.rb
```
