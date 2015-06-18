# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create!([
    {
                  firstname: "kang",
                   lastname: "lee",
                      email: "kang@example.com",
                   password: "password",
      password_confirmation: "password"
    },
    {
                  firstname: "sean",
                   lastname: "wiig",
                      email: "seanwiig@test.com",
                   password: "password",
      password_confirmation: "password"
    },
    {
                  firstname: "James",
                   lastname: "Kim",
                      email: "james@example.com",
                   password: "password",
      password_confirmation: "password"
    }
  ])

Product.create!([
    {
             name: "Coke",
      description: "Let's drink",
            price: 10.0,
             user: users.first
    },
    {
             name: "Macbook",
      description: "You can buy it from Apple Store",
            price: 2000.0,
             user: users.last
    },
    {
             name: "Gear",
      description: "gear descr",
            price: 100.0,
             user: users.last
    }
  ])
