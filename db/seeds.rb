# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email:"rajkushwah1234@gmail.com",password:"12345678",password_confirmation:"12345678",admin:true )

   # for i in 1..50
   #     Restaurant.create(name: "Restaurant#{i}",
   #                       description: "Restaurant#{i} is very Popular in Indore.",
   #                        address:"Address#{i}")
   # end


#  for i in 1..4
#      Cuisine.create(name: "Fooditem#{i}", restaurant_id:i, description: "good food",price:i,cart_id:i,cuisine_type:"south Indian")
#   end
 Fooditem.create(name:"fooditem1", restaurant_id:1, description:"good food", price:1)   
