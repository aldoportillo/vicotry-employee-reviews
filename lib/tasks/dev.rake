desc "Fill the database tables with some sample data"
task({ :populate_restaurants => :environment }) do

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
  pp "There are now #{Restaurant.count} restaurants"
end
