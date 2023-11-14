desc "Fill the database tables with some sample data"
task({ :populate_restaurants => :development }) do

  pp "Populating Restaurants"
  Restaurant.create(
    name: "Victory Italian",
    location: "Oak Park",
  )
  Restaurant.create(
    name: "Victory Tap",
    location: "South Loop",
  )
  Restaurant.create(
    name: "HB Jones",
    location: "Elmhurst",
  )
  Restaurant.create(
    name: "Victory Steak & Seafood",
    location: "Elmhurst",
  )
  User.create(
    name: "tom",
    email: "tom@example.com",
    admin: true,
    password: "password"
  )
  pp "There are now #{Restaurant.count} restaurants"
end
